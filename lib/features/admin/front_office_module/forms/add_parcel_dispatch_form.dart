import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/front_office_repository.dart';
import '../providers/front_office_providers.dart';

class AddParcelDispatchForm extends ConsumerStatefulWidget {
  const AddParcelDispatchForm({super.key});

  @override
  ConsumerState<AddParcelDispatchForm> createState() =>
      _AddParcelDispatchFormState();
}

class _AddParcelDispatchFormState extends ConsumerState<AddParcelDispatchForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final _receiverNameController = TextEditingController();
  final _deliveryAddressController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _itemDetailsController = TextEditingController();
  final _courierNameController = TextEditingController();
  final _dispatchDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dispatchDateController.text = DateTime.now()
        .toIso8601String()
        .split('T')
        .first;
  }

  @override
  void dispose() {
    _receiverNameController.dispose();
    _deliveryAddressController.dispose();
    _phoneNumberController.dispose();
    _itemDetailsController.dispose();
    _courierNameController.dispose();
    _dispatchDateController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);

    try {
      final data = {
        'receiverName': _receiverNameController.text,
        'deliveryAddress': _deliveryAddressController.text,
        'phoneNumber': _phoneNumberController.text,
        'itemDetails': _itemDetailsController.text,
        'courierName': _courierNameController.text,
        'dispatchDate': _dispatchDateController.text.isNotEmpty
            ? _dispatchDateController.text
            : DateTime.now().toIso8601String().split('T').first,
      };

      await ref.read(frontOfficeRepositoryProvider).createParcelDispatch(data);
      ref.invalidate(parcelsDispatchProvider);

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Log Dispatched Parcel successful')),
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
                  'Log Dispatched Parcel',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _receiverNameController,
                  decoration: InputDecoration(labelText: 'Receiver Name'),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _deliveryAddressController,
                  decoration: InputDecoration(labelText: 'Delivery Address'),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _phoneNumberController,
                  decoration: InputDecoration(labelText: 'Phone Number'),
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
                  controller: _courierNameController,
                  decoration: InputDecoration(labelText: 'Courier Name'),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _dispatchDateController,
                  decoration: const InputDecoration(
                    labelText: 'Dispatch Date',
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
                      _dispatchDateController.text = date
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
