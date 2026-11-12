import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/fees_providers.dart';

class AdminSearchDueFeesScreen extends ConsumerWidget {
  const AdminSearchDueFeesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.search_off,
                    color: colorScheme.primary,
                    size: 28,
                  ), // Note: using search_off or similar as search_insights isn't standard
                  const SizedBox(width: 8),
                  Text(
                    'Search Due Fees',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.errorContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: colorScheme.error,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Total Overdue: ₹4,85,000',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorScheme.onErrorContainer,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Filters Box
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 12,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search by student name or roll...',
                      prefixIcon: Icon(
                        Icons.search,
                        color: colorScheme.outline,
                        size: 20,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _buildSelect('Class 10', colorScheme, theme),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildSelect('All Sections', colorScheme, theme),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildSelect(
                        'Sep 2026',
                        colorScheme,
                        theme,
                        icon: Icons.calendar_month,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // KPIs
          ref
              .watch(feeStatsProvider)
              .when(
                data: (stats) {
                  final gen = stats['totalAmountGenerated'] ?? 0;
                  final paid = stats['totalAmountPaid'] ?? 0;
                  final pending = gen - paid;
                  return Row(
                    children: [
                      _buildKpiBox(
                        stats['totalAmountGenerated']?.toString() ?? '0',
                        'Total Generated',
                        colorScheme.primary,
                        null,
                        colorScheme,
                        theme,
                      ),
                      const SizedBox(width: 8),
                      _buildKpiBox(
                        '₹$pending',
                        'Total Overdue',
                        colorScheme.error,
                        Icons.warning_amber,
                        colorScheme,
                        theme,
                      ),
                    ],
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, st) => const SizedBox(),
              ),

          const SizedBox(height: 16),

          // List Label
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Defaulters List',
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
                      color: colorScheme.surfaceContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Class 10',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                'Sorted by severity',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.outline,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Student Cards
          ref
              .watch(feeRecordsProvider)
              .when(
                data: (records) {
                  final dueRecords = records
                      .where((r) => r['status'] == 'PENDING')
                      .toList();
                  if (dueRecords.isEmpty)
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Text('No pending dues found.'),
                      ),
                    );
                  return Column(
                    children: dueRecords.map((r) {
                      final name = r['studentName'] ?? 'Unknown';
                      final initials = name.isNotEmpty
                          ? name
                                .split(' ')
                                .map((e) => e.isNotEmpty ? e[0] : '')
                                .take(2)
                                .join('')
                          : '';
                      final amount = '₹${r['totalAmount'] ?? 0}';
                      return _buildDueCard(
                        name,
                        'Class ${r['classId'] ?? '-'}',
                        initials,
                        amount,
                        'Pending',
                        'Notice',
                        colorScheme.errorContainer,
                        colorScheme.onErrorContainer,
                        colorScheme,
                        theme,
                      );
                    }).toList(),
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, st) => Center(child: Text('Error: $e')),
              ),
        ],
      ),
    );
  }

  Widget _buildSelect(
    String text,
    ColorScheme colorScheme,
    ThemeData theme, {
    IconData icon = Icons.expand_more,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              text,
              style: theme.textTheme.labelMedium?.copyWith(
                color: colorScheme.onSurface,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Icon(icon, size: 16, color: colorScheme.outline),
        ],
      ),
    );
  }

  Widget _buildKpiBox(
    String value,
    String label,
    Color valueColor,
    IconData? icon,
    ColorScheme colorScheme,
    ThemeData theme,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  value,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: valueColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (icon != null) ...[
                  const SizedBox(width: 4),
                  Icon(icon, size: 16, color: valueColor),
                ],
              ],
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: theme.textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDueCard(
    String name,
    String details,
    String initials,
    String amount,
    String overdueText,
    String actionBtnText,
    Color avatarBg,
    Color avatarText,
    ColorScheme colorScheme,
    ThemeData theme, {
    bool isCritical = false,
    Color? tagColor,
    Color? tagText,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: avatarBg,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    initials,
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: avatarText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          name,
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        if (isCritical) ...[
                          const SizedBox(width: 4),
                          Icon(
                            Icons.warning,
                            color: colorScheme.error,
                            size: 16,
                          ),
                        ],
                      ],
                    ),
                    Text(
                      details,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    amount,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isCritical
                          ? colorScheme.error
                          : colorScheme.onSurface,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color:
                          tagColor ??
                          (isCritical
                              ? colorScheme.errorContainer
                              : colorScheme.surfaceContainer),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      overdueText,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color:
                            tagText ??
                            (isCritical
                                ? colorScheme.onErrorContainer
                                : colorScheme.tertiary),
                        fontWeight: isCritical
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(
                  isCritical ? Icons.priority_high : Icons.sms,
                  size: 16,
                  color: isCritical ? colorScheme.error : colorScheme.primary,
                ),
                label: Text(
                  'Send $actionBtnText',
                  style: TextStyle(
                    color: isCritical ? colorScheme.error : colorScheme.primary,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  side: BorderSide(
                    color: isCritical ? colorScheme.error : colorScheme.primary,
                  ),
                  backgroundColor: isCritical
                      ? colorScheme.errorContainer.withValues(alpha: 0.2)
                      : colorScheme.surfaceContainerLowest,
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.payments, size: 16),
                label: const Text('Collect'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.secondary,
                  foregroundColor: colorScheme.onSecondary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  elevation: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
