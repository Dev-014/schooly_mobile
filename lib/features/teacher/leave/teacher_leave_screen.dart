import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TeacherLeaveScreen extends StatelessWidget {
  const TeacherLeaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        scrolledUnderElevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Context & Quota Summary
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Leave',
                      style: theme.textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
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
                        'AY 2026–27',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  '26 Total Days',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Leave Balances Overview (3-Card Bento Strip)
            Row(
              children: [
                _buildBalanceCard(
                  'Casual',
                  '8',
                  'of 10 left',
                  colorScheme.primary,
                  theme,
                  colorScheme,
                ),
                const SizedBox(width: 8),
                _buildBalanceCard(
                  'Sick',
                  '6',
                  'of 7 left',
                  colorScheme.secondary,
                  theme,
                  colorScheme,
                ),
                const SizedBox(width: 8),
                _buildBalanceCard(
                  'Earned',
                  '12',
                  'of 15 left',
                  colorScheme.tertiary,
                  theme,
                  colorScheme,
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Primary Quick Action
            ElevatedButton.icon(
              onPressed: () => context.push('/teacher/apply-leave'),
              icon: const Icon(Icons.add, size: 20),
              label: const Text('Apply for Leave'),
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                foregroundColor: colorScheme.onPrimary,
                minimumSize: const Size(double.infinity, 52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(26),
                ),
                elevation: 4,
                textStyle: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Recent Leaves
            Text(
              'Recent Applications',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _buildLeaveHistoryItem(
              'Casual Leave',
              '15 Sep - 16 Sep',
              'Approved',
              Colors.green,
              theme,
              colorScheme,
            ),
            const SizedBox(height: 8),
            _buildLeaveHistoryItem(
              'Sick Leave',
              '10 Aug - 12 Aug',
              'Approved',
              Colors.green,
              theme,
              colorScheme,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceCard(
    String title,
    String mainValue,
    String subValue,
    Color color,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 4,
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              title,
              style: theme.textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              mainValue,
              style: theme.textTheme.displaySmall?.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
                height: 1.1,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subValue,
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLeaveHistoryItem(
    String type,
    String dates,
    String status,
    Color statusColor,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.surfaceContainer),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                type,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 12,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    dates,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: statusColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              status,
              style: theme.textTheme.labelSmall?.copyWith(
                color: statusColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
