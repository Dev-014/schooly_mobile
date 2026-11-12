import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'data/expense_providers.dart';

class AdminSearchExpenseScreen extends ConsumerWidget {
  const AdminSearchExpenseScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final expensesAsync = ref.watch(expensesProvider);
    final statsAsync = ref.watch(expenseStatsProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Search Expense',
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Browse and filter all school expense vouchers.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 20),

          // Search Input
          Container(
            height: 48,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: colorScheme.surfaceContainerHigh),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search vouchers or vendors...',
                hintStyle: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.outline,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: colorScheme.onSurfaceVariant,
                ),
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
          ),
          const SizedBox(height: 12),

          // Filters Row
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildFilterButton(
                  'calendar_today',
                  'Select Month',
                  false,
                  colorScheme,
                  theme,
                ),
                const SizedBox(width: 8),
                _buildFilterButton(
                  null,
                  'All Categories',
                  true,
                  colorScheme,
                  theme,
                ),
                const SizedBox(width: 8),
                _buildFilterButton(
                  null,
                  'Payment Mode',
                  false,
                  colorScheme,
                  theme,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Summary KPI Bar
          statsAsync.when(
            data: (stats) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerLowest,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: colorScheme.surfaceContainerHigh,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Total Spent',
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '₹${stats['totalExpense']}',
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    color: colorScheme.onSurface,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: colorScheme.primary.withValues(alpha: 0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.payments,
                              color: colorScheme.primary,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerLowest,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: colorScheme.surfaceContainerHigh,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Total Vouchers',
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '${stats['receiptCount']} ',
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                              color: colorScheme.onSurface,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      TextSpan(
                                        text: '(Settled)',
                                        style: theme.textTheme.bodySmall
                                            ?.copyWith(
                                              color:
                                                  colorScheme.onSurfaceVariant,
                                              fontSize: 11,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: colorScheme.secondary.withValues(
                                alpha: 0.1,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.receipt_long,
                              color: colorScheme.secondary,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, st) => Center(child: Text('Error loading stats: $e')),
          ),

          const SizedBox(height: 24),

          // Records Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              expensesAsync.maybeWhen(
                data: (expenses) => Row(
                  children: [
                    Text(
                      'Voucher Records',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.primaryFixed,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '${expenses.length} Total',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.onPrimaryFixedVariant,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                orElse: () => Text(
                  'Voucher Records',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.swap_vert,
                    size: 16,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Date (Newest)',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Records List
          expensesAsync.when(
            data: (expenses) {
              if (expenses.isEmpty) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('No expense records found.'),
                  ),
                );
              }
              return Column(
                children: expenses.map((expense) {
                  return _buildRecordItem(
                    title:
                        expense['vendorName'] ??
                        expense['expenseHead']?['name'] ??
                        'Unknown Vendor',
                    invoiceNo: expense['invoiceNumber'] ?? '-',
                    subtitle:
                        '${expense['date'] ?? ''} • ${expense['paymentMode'] ?? ''}',
                    amount: '-₹${expense['amount'] ?? 0}',
                    icon: Icons.receipt,
                    colorScheme: colorScheme,
                    theme: theme,
                  );
                }).toList(),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, st) => Center(child: Text('Error loading expenses: $e')),
          ),

          const SizedBox(height: 24),

          expensesAsync.maybeWhen(
            data: (expenses) => Center(
              child: Text(
                'Showing ${expenses.length} of ${expenses.length} vouchers',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            orElse: () => const SizedBox(),
          ),

          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _buildFilterButton(
    String? iconString,
    String text,
    bool isPrimaryIcon,
    ColorScheme colorScheme,
    ThemeData theme,
  ) {
    IconData? iconData;
    if (iconString == 'calendar_today') iconData = Icons.calendar_today;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isPrimaryIcon
            ? colorScheme.primaryFixed
            : colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isPrimaryIcon
              ? Colors.transparent
              : colorScheme.surfaceContainerHigh,
        ),
      ),
      child: Row(
        children: [
          if (iconData != null) ...[
            Icon(
              iconData,
              size: 16,
              color: isPrimaryIcon
                  ? colorScheme.primary
                  : colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: 6),
          ],
          Text(
            text,
            style: theme.textTheme.labelSmall?.copyWith(
              color: isPrimaryIcon
                  ? colorScheme.onPrimaryFixedVariant
                  : colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 4),
          Icon(
            Icons.expand_more,
            size: 16,
            color: isPrimaryIcon
                ? colorScheme.onPrimaryFixedVariant
                : colorScheme.outlineVariant,
          ),
        ],
      ),
    );
  }

  Widget _buildRecordItem({
    required String title,
    required String invoiceNo,
    required String subtitle,
    required String amount,
    required IconData icon,
    bool isSecondaryIcon = false,
    bool isNeutralIcon = false,
    required ColorScheme colorScheme,
    required ThemeData theme,
  }) {
    Color iconBg = colorScheme.primaryFixed;
    Color iconColor = colorScheme.primary;
    if (isSecondaryIcon) {
      iconBg = colorScheme.surfaceContainerHighest;
      iconColor = colorScheme.tertiary;
    } else if (isNeutralIcon) {
      iconBg = colorScheme.surfaceContainerHigh;
      iconColor = colorScheme.onSurface;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.surfaceContainerHigh),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: iconBg,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: iconColor, size: 18),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.onSurface,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: colorScheme.surfaceContainer,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              invoiceNo,
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                                fontSize: 9,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        subtitle,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontSize: 11,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.error,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'PAID',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSecondaryContainer,
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
