import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/auth/permissions.dart';
import '../../../core/auth/user_permissions.dart';
import '../../auth/providers/auth_provider.dart';

class StudentAttendanceScreen extends ConsumerWidget {
  const StudentAttendanceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final user = ref.watch(authProvider);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface.withValues(alpha: 0.85),
        elevation: 0,
        scrolledUnderElevation: 1,
        title: Text(
          'Attendance',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLow,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_back,
              size: 20,
              color: colorScheme.onSurface,
            ),
          ),
          onPressed: () => context.pop(),
        ),
        actions: [
          if (user?.hasPermission(Permissions.support.ticket.edit) ?? false)
            Container(
              margin: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(Icons.flag, size: 16, color: colorScheme.primary),
                  const SizedBox(width: 4),
                  Text(
                    'Report Issue',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Student Mini Identity Badge
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://i.pravatar.cc/150?img=11',
                              ),
                              fit: BoxFit.cover,
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
                                    'Aarav Sharma',
                                    style: theme.textTheme.titleMedium
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(width: 6),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: colorScheme.secondaryContainer,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      'Active',
                                      style: theme.textTheme.labelSmall
                                          ?.copyWith(
                                            fontSize: 10,
                                            color: colorScheme
                                                .onSecondaryContainer,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Class 10-A • Roll No. 21',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Session',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.outline,
                        ),
                      ),
                      Text(
                        '2026–27',
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Attendance Metric Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Overall Attendance',
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.secondaryContainer.withValues(
                            alpha: 0.4,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.verified,
                              size: 14,
                              color: colorScheme.onSecondaryContainer,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Good Standing',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: colorScheme.onSecondaryContainer,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '92%',
                    style: theme.textTheme.displayMedium?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '184 of 200 Days Present • Good Standing (Min. Required: 85%)',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildStatPill(
                          'Present',
                          '184',
                          colorScheme.secondary,
                          theme,
                          colorScheme,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _buildStatPill(
                          'Absent',
                          '4',
                          colorScheme.error,
                          theme,
                          colorScheme,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _buildStatPill(
                          'Leave',
                          '12',
                          colorScheme.tertiary,
                          theme,
                          colorScheme,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Monthly Calendar
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.06),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: colorScheme.surfaceContainerLow,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.chevron_left,
                              size: 18,
                              color: colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'September 2026',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: colorScheme.surfaceContainerLow,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.chevron_right,
                              size: 18,
                              color: colorScheme.onSurface,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryFixed,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '24 Working Days',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: colorScheme.onPrimaryContainer,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Day headers
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                        .map(
                          (d) => SizedBox(
                            width: 36,
                            child: Text(
                              d,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: d == 'Sat' || d == 'Sun'
                                    ? colorScheme.outline
                                    : colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 8),

                  // Calendar grid (mocked based on HTML structure)
                  GridView.count(
                    crossAxisCount: 7,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: 0.8,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    children: [
                      // Week 1
                      _buildDayCell('1', 'P', colorScheme),
                      _buildDayCell('2', 'P', colorScheme),
                      _buildDayCell('3', 'P', colorScheme),
                      _buildDayCell('4', 'A', colorScheme),
                      _buildDayCell('5', 'P', colorScheme),
                      _buildDayCell('6', '-', colorScheme),
                      _buildDayCell('7', '-', colorScheme),
                      // Week 2
                      _buildDayCell('8', 'P', colorScheme),
                      _buildDayCell('9', 'P', colorScheme),
                      _buildDayCell('10', 'L', colorScheme),
                      _buildDayCell('11', 'P', colorScheme),
                      _buildDayCell('12', 'P', colorScheme),
                      _buildDayCell('13', '-', colorScheme),
                      _buildDayCell('14', '-', colorScheme),
                      // Week 3
                      _buildDayCell('15', 'P', colorScheme),
                      _buildDayCell('16', 'P', colorScheme),
                      _buildDayCell('17', 'A', colorScheme),
                      _buildDayCell('18', 'P', colorScheme),
                      _buildDayCell('19', 'P', colorScheme),
                      _buildDayCell('20', '-', colorScheme),
                      _buildDayCell('21', '-', colorScheme),
                      // Week 4
                      _buildDayCell('22', 'P', colorScheme),
                      _buildDayCell('23', 'P', colorScheme),
                      _buildTodayCell('24', colorScheme),
                      _buildDayCell('25', 'F', colorScheme),
                      _buildDayCell('26', 'P', colorScheme),
                      _buildDayCell('27', '-', colorScheme),
                      _buildDayCell('28', '-', colorScheme),
                      // Week 5
                      _buildDayCell('29', 'P', colorScheme),
                      _buildDayCell('30', 'P', colorScheme),
                      const SizedBox(),
                      const SizedBox(),
                      const SizedBox(),
                      const SizedBox(),
                      const SizedBox(),
                    ],
                  ),

                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: colorScheme.secondary,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Today: Wed, 24 Sep',
                              style: theme.textTheme.labelMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Present (07:55 AM In)',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.secondary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Recent Attendance Logs
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Attendance History',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Monthly summary breakdown',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: colorScheme.outlineVariant.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.date_range,
                        size: 16,
                        color: colorScheme.primary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Session 2026–27',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: colorScheme.outlineVariant.withValues(alpha: 0.3),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildHistoryRow(
                    'Sep 2026',
                    '24d',
                    '22P',
                    '1A',
                    '1L',
                    '96%',
                    true,
                    theme,
                    colorScheme,
                  ),
                  Divider(
                    height: 1,
                    color: colorScheme.surfaceContainer,
                    indent: 16,
                    endIndent: 16,
                  ),
                  _buildHistoryRow(
                    'Aug 2026',
                    '23d',
                    '21P',
                    '2A',
                    '0L',
                    '91%',
                    false,
                    theme,
                    colorScheme,
                  ),
                  Divider(
                    height: 1,
                    color: colorScheme.surfaceContainer,
                    indent: 16,
                    endIndent: 16,
                  ),
                  _buildHistoryRow(
                    'Jul 2026',
                    '22d',
                    '21P',
                    '0A',
                    '1L',
                    '95%',
                    false,
                    theme,
                    colorScheme,
                  ),
                  Divider(
                    height: 1,
                    color: colorScheme.surfaceContainer,
                    indent: 16,
                    endIndent: 16,
                  ),
                  _buildHistoryRow(
                    'Jun 2026',
                    '25d',
                    '22P',
                    '1A',
                    '2L',
                    '88%',
                    false,
                    theme,
                    colorScheme,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Action Button
            if (user?.hasPermission(
                  Permissions.attendance.attendanceRecord.view,
                ) ??
                false)
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  elevation: 4,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.download, size: 20),
                    const SizedBox(width: 8),
                    const Text(
                      'Download Attendance Report (PDF)',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildStatPill(
    String label,
    String count,
    Color dotColor,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: dotColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                label,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            count,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: dotColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDayCell(String day, String status, ColorScheme colorScheme) {
    final isWeekend = status == '-';
    Color? dotColor;
    if (status == 'P') dotColor = colorScheme.secondary;
    if (status == 'A') dotColor = colorScheme.error;
    if (status == 'L') dotColor = colorScheme.tertiary;
    if (status == 'F') dotColor = colorScheme.outlineVariant; // future/empty

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          day,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isWeekend ? FontWeight.normal : FontWeight.bold,
            color: isWeekend ? colorScheme.outline : colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 2),
        if (isWeekend)
          Text('-', style: TextStyle(color: colorScheme.outline, fontSize: 11))
        else
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
          ),
      ],
    );
  }

  Widget _buildTodayCell(String day, ColorScheme colorScheme) {
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withValues(alpha: 0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: colorScheme.onPrimary,
            ),
          ),
          const SizedBox(height: 2),
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: AppColors.secondaryFixed,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryRow(
    String month,
    String days,
    String p,
    String a,
    String l,
    String percent,
    bool isCurrent,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                month,
                style: theme.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (isCurrent) ...[
                const SizedBox(width: 6),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryFixed,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Current',
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontSize: 10,
                      color: colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
              ],
              const SizedBox(width: 6),
              Text(
                '($days)',
                style: theme.textTheme.bodySmall?.copyWith(
                  fontSize: 12,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Row(
                children: [
                  _buildIndicator(p, colorScheme.secondary),
                  const SizedBox(width: 4),
                  Text(
                    '•',
                    style: TextStyle(color: colorScheme.outlineVariant),
                  ),
                  const SizedBox(width: 4),
                  _buildIndicator(a, colorScheme.error),
                  const SizedBox(width: 4),
                  Text(
                    '•',
                    style: TextStyle(color: colorScheme.outlineVariant),
                  ),
                  const SizedBox(width: 4),
                  _buildIndicator(l, colorScheme.tertiary),
                ],
              ),
              const SizedBox(width: 12),
              Container(
                width: 40,
                padding: const EdgeInsets.symmetric(vertical: 2),
                decoration: BoxDecoration(
                  color: colorScheme.secondaryContainer.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    percent,
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.secondary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIndicator(String text, Color color) {
    return Row(
      children: [
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 2),
        Text(
          text,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}
