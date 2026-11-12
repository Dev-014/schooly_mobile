import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'data/expense_providers.dart';
import 'data/expense_repository.dart';

class AdminAddExpenseScreen extends ConsumerStatefulWidget {
  const AdminAddExpenseScreen({super.key});

  @override
  ConsumerState<AdminAddExpenseScreen> createState() =>
      _AdminAddExpenseScreenState();
}

class _AdminAddExpenseScreenState extends ConsumerState<AdminAddExpenseScreen> {
  final _amountController = TextEditingController();
  final _institutionalAccountController = TextEditingController();
  final _vendorNameController = TextEditingController();
  final _invoiceNoController = TextEditingController();
  final _dateController = TextEditingController(
    text:
        '${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}',
  );

  String _selectedAccountType = 'Bank Account';
  int? _selectedExpenseHeadId;
  String _selectedPaymentMode = 'NEFT/RTGS';

  @override
  void dispose() {
    _amountController.dispose();
    _institutionalAccountController.dispose();
    _vendorNameController.dispose();
    _invoiceNoController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _saveExpense() async {
    final amountText = _amountController.text.trim();
    final amount = double.tryParse(amountText.replaceAll(',', ''));
    if (amount == null || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid amount')),
      );
      return;
    }

    if (_selectedExpenseHeadId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select an expense head')),
      );
      return;
    }

    try {
      final repo = ref.read(expenseRepositoryProvider);

      String parsedDateStr = _dateController.text.trim();
      if (parsedDateStr.isEmpty) {
        final now = DateTime.now();
        parsedDateStr =
            '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
      }

      await repo.createExpense({
        'expenseHeadId': _selectedExpenseHeadId,
        'accountType': _selectedAccountType,
        'accountName': _institutionalAccountController.text.trim(),
        'vendorName': _vendorNameController.text.trim(),
        'invoiceNumber': _invoiceNoController.text.trim(),
        'amount': amount,
        'date': parsedDateStr,
        'paymentMode': _selectedPaymentMode,
      });

      ref.invalidate(expensesProvider);
      ref.invalidate(expenseStatsProvider);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Expense record saved successfully!')),
        );
        _amountController.clear();
        _institutionalAccountController.clear();
        _vendorNameController.clear();
        _invoiceNoController.clear();
        setState(() {
          _selectedExpenseHeadId = null;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error saving expense: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final expenseHeadsAsync = ref.watch(expenseHeadsProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Add Expense',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'New Entry',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSecondaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Record and categorize institutional expense transaction.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 20),

          // Main Form Card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primary.withValues(alpha: 0.08),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                  spreadRadius: -4,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLabel('Expense Head', theme, colorScheme),
                expenseHeadsAsync.when(
                  data: (heads) {
                    return Container(
                      height: 48,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerLow,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.category,
                            color: colorScheme.primary,
                            size: 20,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<int>(
                                isExpanded: true,
                                value: _selectedExpenseHeadId,
                                hint: Text(
                                  'Select Expense Head Category',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                                items: heads
                                    .map(
                                      (head) => DropdownMenuItem<int>(
                                        value: head['id'] as int,
                                        child: Text(
                                          head['name'],
                                          style: theme.textTheme.bodyMedium
                                              ?.copyWith(
                                                color: colorScheme.onSurface,
                                              ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (v) =>
                                    setState(() => _selectedExpenseHeadId = v),
                                icon: Icon(
                                  Icons.expand_more,
                                  color: colorScheme.onSurfaceVariant,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (e, st) => Text('Error loading heads: $e'),
                ),
                const SizedBox(height: 16),

                _buildLabel('Account Type', theme, colorScheme),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(
                            () => _selectedAccountType = 'Bank Account',
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: _selectedAccountType == 'Bank Account'
                                  ? colorScheme.surfaceContainerLowest
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: _selectedAccountType == 'Bank Account'
                                  ? [
                                      BoxShadow(
                                        color: Colors.black.withValues(
                                          alpha: 0.05,
                                        ),
                                        blurRadius: 2,
                                        offset: const Offset(0, 1),
                                      ),
                                    ]
                                  : null,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.account_balance,
                                  size: 18,
                                  color: _selectedAccountType == 'Bank Account'
                                      ? colorScheme.primary
                                      : colorScheme.onSurfaceVariant,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  'Bank Account',
                                  style: theme.textTheme.labelMedium?.copyWith(
                                    color:
                                        _selectedAccountType == 'Bank Account'
                                        ? colorScheme.primary
                                        : colorScheme.onSurfaceVariant,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(
                            () => _selectedAccountType = 'Cash Vault',
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: _selectedAccountType == 'Cash Vault'
                                  ? colorScheme.surfaceContainerLowest
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: _selectedAccountType == 'Cash Vault'
                                  ? [
                                      BoxShadow(
                                        color: Colors.black.withValues(
                                          alpha: 0.05,
                                        ),
                                        blurRadius: 2,
                                        offset: const Offset(0, 1),
                                      ),
                                    ]
                                  : null,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.payments,
                                  size: 18,
                                  color: _selectedAccountType == 'Cash Vault'
                                      ? colorScheme.primary
                                      : colorScheme.onSurfaceVariant,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  'Cash Vault',
                                  style: theme.textTheme.labelMedium?.copyWith(
                                    color: _selectedAccountType == 'Cash Vault'
                                        ? colorScheme.primary
                                        : colorScheme.onSurfaceVariant,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                _buildLabel('Account Name', theme, colorScheme),
                _buildTextField(
                  controller: _institutionalAccountController,
                  hint: 'e.g. HDFC School Main A/c - *4092',
                  icon: Icons.account_balance_wallet,
                  colorScheme: colorScheme,
                  theme: theme,
                ),
                const SizedBox(height: 16),

                _buildLabel('Vendor / Payee Name', theme, colorScheme),
                _buildTextField(
                  controller: _vendorNameController,
                  hint: 'e.g. Apex Science Instruments / Vendor Name',
                  icon: Icons.storefront,
                  colorScheme: colorScheme,
                  theme: theme,
                ),
                const SizedBox(height: 16),

                _buildLabel('Amount (₹)', theme, colorScheme),
                _buildAmountField(colorScheme: colorScheme, theme: theme),
                const SizedBox(height: 16),

                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLabel('Invoice Number', theme, colorScheme),
                          _buildTextField(
                            controller: _invoiceNoController,
                            hint: 'INV-2026-884',
                            icon: Icons.receipt,
                            colorScheme: colorScheme,
                            theme: theme,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLabel('Date (YYYY-MM-DD)', theme, colorScheme),
                          _buildTextField(
                            controller: _dateController,
                            hint: '2026-09-24',
                            icon: Icons.calendar_today,
                            colorScheme: colorScheme,
                            theme: theme,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                _buildLabel('Payment Mode', theme, colorScheme),
                _buildPaymentModeGrid(colorScheme, theme),
                const SizedBox(height: 16),

                _buildLabel('Attach Document', theme, colorScheme),
                _buildFileUpload(colorScheme, theme),
                const SizedBox(height: 24),

                ElevatedButton.icon(
                  onPressed: _saveExpense,
                  icon: const Icon(Icons.add, size: 20),
                  label: const Text('Save Expense'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    elevation: 4,
                    shadowColor: colorScheme.primary.withValues(alpha: 0.4),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildLabel(String text, ThemeData theme, ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: theme.textTheme.labelMedium?.copyWith(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    required ColorScheme colorScheme,
    required ThemeData theme,
  }) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
          ),
          prefixIcon: Icon(icon, color: colorScheme.onSurfaceVariant, size: 20),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
        ),
        style: theme.textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurface,
        ),
      ),
    );
  }

  Widget _buildAmountField({
    required ColorScheme colorScheme,
    required ThemeData theme,
  }) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: _amountController,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          hintText: '0.00',
          hintStyle: theme.textTheme.titleMedium?.copyWith(
            color: colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
            fontWeight: FontWeight.bold,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              '₹',
              style: theme.textTheme.titleMedium?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 0,
            minHeight: 0,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
        style: theme.textTheme.titleMedium?.copyWith(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildPaymentModeGrid(ColorScheme colorScheme, ThemeData theme) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 3.5,
      children: [
        _buildPaymentModeButton('NEFT/RTGS', colorScheme, theme),
        _buildPaymentModeButton('UPI', colorScheme, theme),
        _buildPaymentModeButton('Cheque', colorScheme, theme),
        _buildPaymentModeButton('Cash', colorScheme, theme),
      ],
    );
  }

  Widget _buildPaymentModeButton(
    String title,
    ColorScheme colorScheme,
    ThemeData theme,
  ) {
    final isSelected = _selectedPaymentMode == title;
    return GestureDetector(
      onTap: () => setState(() => _selectedPaymentMode = title),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.primary
              : colorScheme.surfaceContainerLow,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isSelected) ...[
              Icon(Icons.check_circle, color: colorScheme.onPrimary, size: 16),
              const SizedBox(width: 4),
            ],
            Text(
              title,
              style: theme.textTheme.labelMedium?.copyWith(
                color: isSelected
                    ? colorScheme.onPrimary
                    : colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFileUpload(ColorScheme colorScheme, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.6),
          style: BorderStyle.solid,
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.attach_file, color: colorScheme.primary, size: 24),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Click to upload voucher/bill (PDF/JPG)',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                Text(
                  'Max size: 10MB',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Browse',
              style: theme.textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
