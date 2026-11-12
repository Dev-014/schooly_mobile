import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/front_office_repository.dart';
import '../providers/front_office_providers.dart';

class AddGatePassForm extends ConsumerStatefulWidget {
  const AddGatePassForm({super.key});

  @override
  ConsumerState<AddGatePassForm> createState() => _AddGatePassFormState();
}

class _AddGatePassFormState extends ConsumerState<AddGatePassForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final _personNameController = TextEditingController();
  final _roleController = TextEditingController();
  final _reasonForExitController = TextEditingController();
  final _passDateController = TextEditingController();
  final _exitTimeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passDateController.text = DateTime.now()
        .toIso8601String()
        .split('T')
        .first;
  }

  @override
  void dispose() {
    _personNameController.dispose();
    _roleController.dispose();
    _reasonForExitController.dispose();
    _passDateController.dispose();
    _exitTimeController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);

    try {
      final data = {
        'personName': _personNameController.text,
        'role': _roleController.text,
        'reasonForExit': _reasonForExitController.text,
        'passDate': _passDateController.text.isNotEmpty
            ? _passDateController.text
            : DateTime.now().toIso8601String().split('T').first,
        'exitTime': _exitTimeController.text.isNotEmpty
            ? _exitTimeController.text
            : TimeOfDay.now().format(context),
      };

      await ref.read(frontOfficeRepositoryProvider).createGatePass(data);
      ref.invalidate(gatePassesProvider);

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Issue Gate Pass successful')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Issue Gate Pass',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _personNameController,
                  decoration: InputDecoration(labelText: 'Person Name'),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _roleController,
                  decoration: InputDecoration(
                    labelText: 'Role (STUDENT/STAFF/VISITOR)',
                  ),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _reasonForExitController,
                  decoration: InputDecoration(labelText: 'Reason For Exit'),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _passDateController,
                  decoration: const InputDecoration(
                    labelText: 'Pass Date',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  readOnly: true,
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (date != null) {
                      _passDateController.text = date
                          .toIso8601String()
                          .split('T')
                          .first;
                    }
                  },
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _exitTimeController,
                  decoration: InputDecoration(labelText: 'Exit Time (HH:MM)'),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 12),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _isLoading ? null : _submit,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator()
                      : const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
