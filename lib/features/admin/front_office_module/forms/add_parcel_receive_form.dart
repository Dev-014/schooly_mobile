import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/front_office_repository.dart';
import '../providers/front_office_providers.dart';

class AddParcelReceiveForm extends ConsumerStatefulWidget {
  const AddParcelReceiveForm({super.key});

  @override
  ConsumerState<AddParcelReceiveForm> createState() =>
      _AddParcelReceiveFormState();
}

class _AddParcelReceiveFormState extends ConsumerState<AddParcelReceiveForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final _senderNameController = TextEditingController();
  final _contactNumberController = TextEditingController();
  final _itemDetailsController = TextEditingController();
  final _receivedByController = TextEditingController();
  final _dateReceivedController = TextEditingController();

  @override
  void dispose() {
    _senderNameController.dispose();
    _contactNumberController.dispose();
    _itemDetailsController.dispose();
    _receivedByController.dispose();
    _dateReceivedController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);

    try {
      final data = {
        'senderName': _senderNameController.text,
        'contactNumber': _contactNumberController.text,
        'itemDetails': _itemDetailsController.text,
        'receivedBy': _receivedByController.text,
        'dateReceived': _dateReceivedController.text.isNotEmpty
            ? _dateReceivedController.text
            : DateTime.now().toIso8601String().split('T').first,
      };

      await ref.read(frontOfficeRepositoryProvider).createParcelReceive(data);
      ref.invalidate(parcelsReceiveProvider);

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Log Received Parcel successful')),
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
                  'Log Received Parcel',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _senderNameController,
                  decoration: InputDecoration(labelText: 'Sender Name'),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _contactNumberController,
                  decoration: InputDecoration(labelText: 'Contact Number'),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _itemDetailsController,
                  decoration: InputDecoration(labelText: 'Item Details'),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _receivedByController,
                  decoration: InputDecoration(labelText: 'Received By'),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _dateReceivedController,
                  decoration: const InputDecoration(
                    labelText: 'Date Received',
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
                      _dateReceivedController.text = date
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
