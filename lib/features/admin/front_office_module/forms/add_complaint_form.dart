import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/front_office_repository.dart';
import '../providers/front_office_providers.dart';

class AddComplaintForm extends ConsumerStatefulWidget {
  const AddComplaintForm({super.key});

  @override
  ConsumerState<AddComplaintForm> createState() => _AddComplaintFormState();
}

class _AddComplaintFormState extends ConsumerState<AddComplaintForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final _complainantNameController = TextEditingController();
  final _complaintTypeController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _complaintDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _complaintDateController.text = DateTime.now()
        .toIso8601String()
        .split('T')
        .first;
  }

  @override
  void dispose() {
    _complainantNameController.dispose();
    _complaintTypeController.dispose();
    _descriptionController.dispose();
    _complaintDateController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);

    try {
      final data = {
        'complainantName': _complainantNameController.text,
        'complaintType': _complaintTypeController.text,
        'description': _descriptionController.text,
        'complaintDate': _complaintDateController.text.isNotEmpty
            ? _complaintDateController.text
            : DateTime.now().toIso8601String().split('T').first,
      };

      await ref.read(frontOfficeRepositoryProvider).createComplaint(data);
      ref.invalidate(complaintsProvider);

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Log Complaint successful')),
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
                  'Log Complaint',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _complainantNameController,
                  decoration: InputDecoration(labelText: 'Complainant Name'),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _complaintTypeController,
                  decoration: InputDecoration(labelText: 'Complaint Type'),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _complaintDateController,
                  decoration: const InputDecoration(
                    labelText: 'Complaint Date',
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
                      _complaintDateController.text = date
                          .toIso8601String()
                          .split('T')
                          .first;
                    }
                  },
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
