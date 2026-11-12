import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'data/income_providers.dart';
import 'data/income_repository.dart';

class AdminAddIncomeScreen extends ConsumerStatefulWidget {
  const AdminAddIncomeScreen({super.key});

  @override
  ConsumerState<AdminAddIncomeScreen> createState() =>
      _AdminAddIncomeScreenState();
}

class _AdminAddIncomeScreenState extends ConsumerState<AdminAddIncomeScreen> {
  final _amountController = TextEditingController();
  final _institutionalAccountController = TextEditingController();
  final _incomeFromController = TextEditingController();
  final _invoiceNoController = TextEditingController();
  final _dateController = TextEditingController(
    text:
        '${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}',
  );

  String _selectedAccountType = 'Bank Account';
  int? _selectedIncomeHeadId;
  String _selectedPaymentMode = 'NEFT / Bank';

  @override
  void dispose() {
    _amountController.dispose();
    _institutionalAccountController.dispose();
    _incomeFromController.dispose();
    _invoiceNoController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _saveIncome() async {
    final amountText = _amountController.text.trim();
    final amount = double.tryParse(amountText.replaceAll(',', ''));
    if (amount == null || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid amount')),
      );
      return;
    }

    if (_selectedIncomeHeadId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select an income head')),
      );
      return;
    }

    try {
      final repo = ref.read(incomeRepositoryProvider);

      // Assume date is already in yyyy-MM-dd format or just pass it as is
      String parsedDateStr = _dateController.text.trim();
      if (parsedDateStr.isEmpty) {
        final now = DateTime.now();
        parsedDateStr =
            '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
      }

      await repo.createIncome({
        'incomeHeadId': _selectedIncomeHeadId,
        'accountType': _selectedAccountType,
        'accountName': _institutionalAccountController.text.trim(),
        'incomeFrom': _incomeFromController.text.trim(),
        'invoiceNumber': _invoiceNoController.text.trim(),
        'amount': amount,
        'date': parsedDateStr,
        'paymentMode': _selectedPaymentMode,
      });

      ref.invalidate(incomesProvider);
      ref.invalidate(incomeStatsProvider);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Income record saved successfully!')),
        );
        _amountController.clear();
        _institutionalAccountController.clear();
        _incomeFromController.clear();
        _invoiceNoController.clear();
        setState(() {
          _selectedIncomeHeadId = null;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error saving income: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final incomeHeadsAsync = ref.watch(incomeHeadsProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Context Breadcrumb
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: colorScheme.primaryFixed,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'FINANCE • Income Module',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.onPrimaryFixed,
                    fontSize: 10,
                    letterSpacing: 1.1,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: colorScheme.secondaryFixed,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: colorScheme.secondary,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Active Session',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorScheme.onSecondaryFixed,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Add Income Record',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Record institutional revenues, grants, fees and miscellaneous receipts.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),

          const SizedBox(height: 24),

          // Form Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primary.withValues(alpha: 0.08),
                  blurRadius: 24,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: colorScheme.primaryFixed,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.add_card,
                            color: colorScheme.primary,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'New Income Entry',
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.onSurface,
                              ),
                            ),
                            Text(
                              'Transaction ID: TXN-AUTO',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHigh,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        'FY',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Amount Highlight Module
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                          children: [
                            const TextSpan(text: 'Amount (₹) '),
                            TextSpan(
                              text: '*',
                              style: TextStyle(color: colorScheme.error),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            '₹',
                            style: theme.textTheme.headlineMedium?.copyWith(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: _amountController,
                              decoration: InputDecoration(
                                hintText: '0.00',
                                hintStyle: theme.textTheme.headlineMedium
                                    ?.copyWith(
                                      color: colorScheme.outlineVariant,
                                      fontWeight: FontWeight.bold,
                                    ),
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                              ),
                              style: theme.textTheme.headlineMedium?.copyWith(
                                color: colorScheme.onSurface,
                                fontWeight: FontWeight.bold,
                              ),
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Enter net realized institutional revenue',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Income Head Dropdown
                _buildLabel('Income Head', true, colorScheme, theme),
                const SizedBox(height: 6),
                incomeHeadsAsync.when(
                  data: (heads) {
                    return Container(
                      height: 48,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerLow,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<int>(
                          isExpanded: true,
                          value: _selectedIncomeHeadId,
                          hint: Text(
                            'Select category source',
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
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: colorScheme.onSurface,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (v) =>
                              setState(() => _selectedIncomeHeadId = v),
                          icon: Icon(
                            Icons.expand_more,
                            color: colorScheme.onSurfaceVariant,
                            size: 20,
                          ),
                        ),
                      ),
                    );
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (e, st) => Text('Error loading heads: $e'),
                ),

                const SizedBox(height: 16),

                // Account Type Selector
                _buildLabel('Deposit Account Type', true, colorScheme, theme),
                const SizedBox(height: 6),
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

                // Institutional Account
                _buildLabel('Institutional Account', true, colorScheme, theme),
                const SizedBox(height: 6),
                _buildTextField(
                  controller: _institutionalAccountController,
                  hint: 'e.g. HDFC School Main Account - 9481',
                  icon: Icons.verified_user,
                  iconColor: colorScheme.secondary,
                  colorScheme: colorScheme,
                  theme: theme,
                ),

                const SizedBox(height: 16),

                // Income From
                _buildLabel('Income Received From', true, colorScheme, theme),
                const SizedBox(height: 6),
                _buildTextField(
                  controller: _incomeFromController,
                  hint: 'e.g. Apex Education Trust / Vendor Name',
                  colorScheme: colorScheme,
                  theme: theme,
                ),

                const SizedBox(height: 16),

                // Invoice Number & Date
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLabel(
                            'Invoice / Ref No.',
                            false,
                            colorScheme,
                            theme,
                          ),
                          const SizedBox(height: 6),
                          _buildTextField(
                            controller: _invoiceNoController,
                            hint: 'INV-2026-0842',
                            colorScheme: colorScheme,
                            theme: theme,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLabel(
                            'Receipt Date (YYYY-MM-DD)',
                            true,
                            colorScheme,
                            theme,
                          ),
                          const SizedBox(height: 6),
                          _buildTextField(
                            controller: _dateController,
                            hint: '2026-09-24',
                            colorScheme: colorScheme,
                            theme: theme,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Payment Mode Selector
                _buildLabel('Payment Mode', true, colorScheme, theme),
                const SizedBox(height: 6),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildPaymentChip(
                        'NEFT / Bank',
                        Icons.swap_horiz,
                        colorScheme,
                        theme,
                      ),
                      const SizedBox(width: 8),
                      _buildPaymentChip(
                        'UPI / QR',
                        Icons.qr_code_2,
                        colorScheme,
                        theme,
                      ),
                      const SizedBox(width: 8),
                      _buildPaymentChip(
                        'Cheque',
                        Icons.history_edu,
                        colorScheme,
                        theme,
                      ),
                      const SizedBox(width: 8),
                      _buildPaymentChip(
                        'Cash',
                        Icons.local_atm,
                        colorScheme,
                        theme,
                      ),
                      const SizedBox(width: 8),
                      _buildPaymentChip(
                        'Card',
                        Icons.credit_card,
                        colorScheme,
                        theme,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Attach Voucher
                _buildLabel(
                  'Proof / Voucher Document',
                  false,
                  colorScheme,
                  theme,
                ),
                const SizedBox(height: 6),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: colorScheme.primaryFixed,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.cloud_upload,
                          color: colorScheme.primary,
                          size: 20,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Upload PDF or JPG receipt / voucher',
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Drag or browse receipts (Max file size 5MB)',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                ElevatedButton.icon(
                  onPressed: _saveIncome,
                  icon: const Icon(Icons.check_circle, size: 20),
                  label: const Text('+ Save & Record Income'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                  ),
                ),
                const SizedBox(height: 12),
                Center(
                  child: TextButton(
                    onPressed: () {
                      _amountController.clear();
                      _institutionalAccountController.clear();
                      _incomeFromController.clear();
                      _invoiceNoController.clear();
                      setState(() {
                        _selectedIncomeHeadId = null;
                      });
                    },
                    child: Text(
                      'Reset Form',
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildLabel(
    String text,
    bool required,
    ColorScheme colorScheme,
    ThemeData theme,
  ) {
    return RichText(
      text: TextSpan(
        style: theme.textTheme.labelMedium?.copyWith(
          color: colorScheme.onSurface,
        ),
        children: [
          TextSpan(text: '$text '),
          if (required)
            TextSpan(
              text: '*',
              style: TextStyle(color: colorScheme.error),
            ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    IconData? icon,
    Color? iconColor,
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
            color: colorScheme.onSurfaceVariant,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: icon != null ? 14 : 14,
          ),
          suffixIcon: icon != null
              ? Icon(
                  icon,
                  color: iconColor ?? colorScheme.onSurfaceVariant,
                  size: 20,
                )
              : null,
        ),
        style: theme.textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurface,
        ),
      ),
    );
  }

  Widget _buildPaymentChip(
    String label,
    IconData icon,
    ColorScheme colorScheme,
    ThemeData theme,
  ) {
    final isSelected = _selectedPaymentMode == label;
    return GestureDetector(
      onTap: () => setState(() => _selectedPaymentMode = label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.primary
              : colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(20),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ]
              : null,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 16,
              color: isSelected
                  ? colorScheme.onPrimary
                  : colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: 4),
            Text(
              label,
              style: theme.textTheme.labelMedium?.copyWith(
                color: isSelected
                    ? colorScheme.onPrimary
                    : colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
