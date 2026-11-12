import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/fees_providers.dart';

class AdminDueFeeRemindersScreen extends ConsumerWidget {
  const AdminDueFeeRemindersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ref
        .watch(feeRecordsProvider)
        .when(
          data: (records) {
            final dueRecords = records
                .where((r) => r['status'] == 'PENDING')
                .toList();
            final defaulterCount = dueRecords.length;
            final totalOverdue = dueRecords.fold<double>(
              0.0,
              (sum, r) => sum + ((r['totalAmount'] as num?)?.toDouble() ?? 0.0),
            );

            return Stack(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16,
                    bottom: 120,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Due Fee Reminders',
                                  style: theme.textTheme.headlineSmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: colorScheme.onSurface,
                                      ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'List of students with pending dues • Send reminders',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: colorScheme.errorContainer,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              '$defaulterCount Defaulters',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: colorScheme.onErrorContainer,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Overview Card
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceContainerLow,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.04),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color: colorScheme.primaryFixed,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.payments,
                                    color: colorScheme.primary,
                                    size: 18,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Total Overdue Amount',
                                      style: theme.textTheme.labelSmall
                                          ?.copyWith(
                                            color: colorScheme.onSurfaceVariant,
                                          ),
                                    ),
                                    Text(
                                      '₹$totalOverdue',
                                      style: theme.textTheme.titleMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: colorScheme.error,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Pending Notices',
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: theme.textTheme.titleMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: colorScheme.onSurface,
                                        ),
                                    children: [
                                      TextSpan(text: '$defaulterCount '),
                                      TextSpan(
                                        text: 'Students',
                                        style: theme.textTheme.bodySmall
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
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Bulk Reminder Card
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceContainerHigh.withValues(
                            alpha: 0.6,
                          ),
                          borderRadius: BorderRadius.circular(16),
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
                                      color: colorScheme.primary,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.campaign,
                                      color: colorScheme.onPrimary,
                                      size: 20,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Send Bulk Reminder',
                                          style: theme.textTheme.labelMedium
                                              ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: colorScheme.onSurface,
                                              ),
                                        ),
                                        Text(
                                          'Broadcast SMS & WhatsApp to all $defaulterCount defaulters',
                                          style: theme.textTheme.bodySmall
                                              ?.copyWith(
                                                color: colorScheme
                                                    .onSurfaceVariant,
                                                fontSize: 10,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Bulk reminders dispatched!'),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.send, size: 16),
                              label: const Text('Send All'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: colorScheme.primary,
                                foregroundColor: colorScheme.onPrimary,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 8,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                elevation: 2,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Filter Select
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Filter by Class / Batch',
                            style: theme.textTheme.labelSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                          Text(
                            '$defaulterCount Defaulters Total',
                            style: theme.textTheme.labelSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.primary,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceContainerLowest,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: colorScheme.surfaceContainer,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.02),
                              blurRadius: 4,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.filter_alt,
                              size: 20,
                              color: colorScheme.primary,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'All Classes ($defaulterCount Defaulters)',
                                style: theme.textTheme.labelMedium?.copyWith(
                                  color: colorScheme.onSurface,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.expand_more,
                              size: 20,
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Select All Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: true,
                                onChanged: (v) {},
                                activeColor: colorScheme.primary,
                              ),
                              Text(
                                'Select All ($defaulterCount Students)',
                                style: theme.textTheme.labelSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: colorScheme.onSurface,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Sorted by highest due',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.outline,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),

                      // Students List
                      if (dueRecords.isEmpty)
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Text('No pending reminders.'),
                          ),
                        )
                      else
                        Column(
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
                            return _buildStudentRow(
                              name,
                              'Class ${r['classId'] ?? '-'}',
                              initials,
                              amount,
                              r['dueDate'] ?? '',
                              colorScheme.secondaryFixed,
                              colorScheme.secondary,
                              colorScheme,
                              theme,
                            );
                          }).toList(),
                        ),
                    ],
                  ),
                ),

                // Sticky Bottom Action Bar
                Positioned(
                  bottom: 16,
                  left: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerLowest,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: colorScheme.surfaceContainer),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '$defaulterCount Selected',
                              style: theme.textTheme.labelSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.onSurface,
                              ),
                            ),
                            Text(
                              'Total: ₹$totalOverdue',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: colorScheme.surfaceContainer,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.chat,
                                    size: 16,
                                    color: colorScheme.secondary,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'WhatsApp',
                                    style: theme.textTheme.labelSmall?.copyWith(
                                      color: colorScheme.onSurface,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton.icon(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Bulk reminders dispatched!'),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.send, size: 16),
                              label: const Text('Send Reminders'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: colorScheme.primary,
                                foregroundColor: colorScheme.onPrimary,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 8,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                elevation: 2,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, st) => Center(child: Text('Error: $e')),
        );
  }

  Widget _buildStudentRow(
    String name,
    String details,
    String initials,
    String amount,
    String dueDate,
    Color avatarBg,
    Color avatarText,
    ColorScheme colorScheme,
    ThemeData theme,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Checkbox(
            value: true,
            onChanged: (v) {},
            activeColor: colorScheme.primary,
            visualDensity: VisualDensity.compact,
          ),
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(color: avatarBg, shape: BoxShape.circle),
            child: Center(
              child: Text(
                initials,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: avatarText,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: theme.textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  details,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontSize: 10,
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
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.error,
                ),
              ),
              Text(
                'Due: $dueDate',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.outline,
                  fontSize: 10,
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainer,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.notifications_active,
              color: colorScheme.primary,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
