import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/front_office_repository.dart';
import '../providers/front_office_providers.dart';

class AddVisitorForm extends ConsumerStatefulWidget {
  const AddVisitorForm({super.key});

  @override
  ConsumerState<AddVisitorForm> createState() => _AddVisitorFormState();
}

class _AddVisitorFormState extends ConsumerState<AddVisitorForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final _visitorNameController = TextEditingController();
  final _purposeController = TextEditingController();
  final _meetingWithController = TextEditingController();
  final _phoneController = TextEditingController();
  final _visitDateController = TextEditingController();
  final _timeInController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _visitDateController.text = DateTime.now()
        .toIso8601String()
        .split('T')
        .first;
  }

  @override
  void dispose() {
    _visitorNameController.dispose();
    _purposeController.dispose();
    _meetingWithController.dispose();
    _phoneController.dispose();
    _visitDateController.dispose();
    _timeInController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);

    try {
      final data = {
        'visitorName': _visitorNameController.text,
        'purpose': _purposeController.text,
        'meetingWith': _meetingWithController.text,
        'phone': _phoneController.text,
        'visitDate': _visitDateController.text.isNotEmpty
            ? _visitDateController.text
            : DateTime.now().toIso8601String().split('T').first,
        'timeIn': _timeInController.text.isNotEmpty
            ? _timeInController.text
            : TimeOfDay.now().format(context),
      };

      await ref.read(frontOfficeRepositoryProvider).createVisitor(data);
      ref.invalidate(visitorsProvider);

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Log Visitor successful')));
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
                  'Log Visitor',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _visitorNameController,
                  decoration: InputDecoration(labelText: 'Visitor Name'),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _purposeController,
                  decoration: InputDecoration(labelText: 'Purpose'),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _meetingWithController,
                  decoration: InputDecoration(labelText: 'Meeting With'),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(labelText: 'Phone Number'),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _visitDateController,
                  decoration: const InputDecoration(
                    labelText: 'Visit Date',
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
                      _visitDateController.text = date
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
                  controller: _timeInController,
                  decoration: InputDecoration(labelText: 'Time In (HH:MM)'),
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
