import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/front_office_repository.dart';
import '../providers/front_office_providers.dart';

class AddEnquiryForm extends ConsumerStatefulWidget {
  const AddEnquiryForm({super.key});

  @override
  ConsumerState<AddEnquiryForm> createState() => _AddEnquiryFormState();
}

class _AddEnquiryFormState extends ConsumerState<AddEnquiryForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final _studentNameController = TextEditingController();
  final _parentNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _sourceController = TextEditingController();
  final _enquiryDateController = TextEditingController();
  final _nextFollowUpDateController = TextEditingController();
  final _statusController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _enquiryDateController.text = DateTime.now()
        .toIso8601String()
        .split('T')
        .first;
  }

  @override
  void dispose() {
    _studentNameController.dispose();
    _parentNameController.dispose();
    _phoneController.dispose();
    _sourceController.dispose();
    _enquiryDateController.dispose();
    _nextFollowUpDateController.dispose();
    _statusController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);

    try {
      final data = {
        'studentName': _studentNameController.text,
        'parentName': _parentNameController.text,
        'phone': _phoneController.text,
        'source': _sourceController.text,
        'status': _statusController.text,
        'nextFollowUpDate': _nextFollowUpDateController.text,
        'enquiryDate': _enquiryDateController.text.isNotEmpty
            ? _enquiryDateController.text
            : DateTime.now().toIso8601String().split('T').first,
      };

      await ref.read(frontOfficeRepositoryProvider).createEnquiry(data);
      ref.invalidate(enquiriesProvider);

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('New Admission Enquiry successful')),
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
                  'New Admission Enquiry',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _studentNameController,
                  decoration: InputDecoration(labelText: 'Student Name'),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _parentNameController,
                  decoration: InputDecoration(labelText: 'Parent Name'),
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
                  controller: _sourceController,
                  decoration: InputDecoration(labelText: 'Source'),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _enquiryDateController,
                  decoration: InputDecoration(
                    labelText: 'Enquiry Date',
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
                      _enquiryDateController.text = date
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
                  controller: _nextFollowUpDateController,
                  decoration: const InputDecoration(
                    labelText: 'Next Follow Up Date',
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
                      _nextFollowUpDateController.text = date
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
                  controller: _statusController,
                  decoration: const InputDecoration(
                    labelText: 'Status (e.g. ACTIVE)',
                  ),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Required' : null,
                ),
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
