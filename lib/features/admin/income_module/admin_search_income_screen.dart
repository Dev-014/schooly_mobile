import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'data/income_providers.dart';

class AdminSearchIncomeScreen extends ConsumerWidget {
  const AdminSearchIncomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final incomesAsync = ref.watch(incomesProvider);
    final statsAsync = ref.watch(incomeStatsProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Search Income',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Browse and filter all school revenue and income receipts.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 20),

          // Search Input
          Container(
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: colorScheme.surfaceContainerHigh),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search invoices, payers, or heads...',
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
                  vertical: 12,
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
                  'Sep 2026',
                  true,
                  colorScheme,
                  theme,
                ),
                const SizedBox(width: 8),
                _buildFilterButton(
                  null,
                  'All Categories',
                  false,
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
              final total = stats['totalIncome'];
              final count = stats['receiptCount'];
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
                                  'Total Income',
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '₹$total',
                                  style: theme.textTheme.titleLarge?.copyWith(
                                    color: colorScheme.secondary,
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
                              color: colorScheme.secondaryContainer,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.payments,
                              color: colorScheme.onSecondaryContainer,
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
                                  'Total Invoices',
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '$count ',
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                              color: colorScheme.onSurface,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      TextSpan(
                                        text: '($count settled)',
                                        style: theme.textTheme.labelSmall
                                            ?.copyWith(
                                              color:
                                                  colorScheme.onSurfaceVariant,
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
                              color: colorScheme.primaryFixed,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.receipt_long,
                              color: colorScheme.primary,
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
              Row(
                children: [
                  Text(
                    'Invoice Records',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(width: 8),
                  incomesAsync.maybeWhen(
                    data: (incomes) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '${incomes.length} Total',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                    orElse: () => const SizedBox(),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Date (Newest)',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.swap_vert,
                    size: 16,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Records List
          incomesAsync.when(
            data: (incomes) {
              if (incomes.isEmpty) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('No income records found.'),
                  ),
                );
              }
              return Column(
                children: incomes.map((income) {
                  return _buildRecordItem(
                    title: income['incomeHead']?['name'] ?? 'Unknown Head',
                    invoiceNo: income['invoiceNumber'] ?? '-',
                    subtitle:
                        '${income['date'] ?? ''} • ${income['incomeFrom'] ?? ''} • ${income['paymentMode'] ?? ''}',
                    amount: '+₹${income['amount'] ?? 0}',
                    icon: Icons.account_balance,
                    isPrimaryIcon: true,
                    colorScheme: colorScheme,
                    theme: theme,
                  );
                }).toList(),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, st) => Center(child: Text('Error loading incomes: $e')),
          ),

          const SizedBox(height: 24),

          incomesAsync.maybeWhen(
            data: (incomes) => Center(
              child: Text(
                'Showing ${incomes.length} of ${incomes.length} invoices',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            orElse: () => const SizedBox(),
          ),

          // Removed Load More and Statement buttons as they are non-functional
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
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colorScheme.surfaceContainerHigh),
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
              color: colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 4),
          Icon(
            Icons.expand_more,
            size: 16,
            color: colorScheme.onSurfaceVariant,
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
    required bool isPrimaryIcon,
    required ColorScheme colorScheme,
    required ThemeData theme,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
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
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: isPrimaryIcon
                        ? colorScheme.primaryFixed
                        : colorScheme.surfaceContainerHigh,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    icon,
                    color: isPrimaryIcon
                        ? colorScheme.primary
                        : colorScheme.onSurfaceVariant,
                    size: 20,
                  ),
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
                              style: theme.textTheme.bodyMedium?.copyWith(
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
                                color: colorScheme.primary,
                                fontSize: 10,
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
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.secondary,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'PAID',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSecondaryFixed,
                    fontSize: 10,
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
