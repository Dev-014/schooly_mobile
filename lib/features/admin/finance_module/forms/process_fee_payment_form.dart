import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProcessFeePaymentForm extends ConsumerStatefulWidget {
  const ProcessFeePaymentForm({super.key});

  @override
  ConsumerState<ProcessFeePaymentForm> createState() =>
      _ProcessFeePaymentFormState();
}

class _ProcessFeePaymentFormState extends ConsumerState<ProcessFeePaymentForm> {
  final _amountController = TextEditingController();
  final _paymentMethodController = TextEditingController(text: 'CASH');

  @override
  void dispose() {
    _amountController.dispose();
    _paymentMethodController.dispose();
    super.dispose();
  }

  void _submit() {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Payment processed successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Process Payment',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _amountController,
                decoration: const InputDecoration(labelText: 'Amount (₹)'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                initialValue: _paymentMethodController.text,
                items: const [
                  DropdownMenuItem(value: 'CASH', child: Text('Cash')),
                  DropdownMenuItem(
                    value: 'ONLINE',
                    child: Text('Online / UPI'),
                  ),
                  DropdownMenuItem(value: 'CHEQUE', child: Text('Cheque / DD')),
                ],
                onChanged: (val) {
                  if (val != null)
                    setState(() => _paymentMethodController.text = val);
                },
                decoration: const InputDecoration(labelText: 'Payment Method'),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Confirm Payment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
