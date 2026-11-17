import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../data/models/parent_models.dart';
import '../providers/parent_providers.dart';
import '../more/child_switcher_sheet.dart';

class ParentAttendanceScreen extends ConsumerStatefulWidget {
  const ParentAttendanceScreen({super.key});

  @override
  ConsumerState<ParentAttendanceScreen> createState() => _ParentAttendanceScreenState();
}

class _ParentAttendanceScreenState extends ConsumerState<ParentAttendanceScreen> {
  late DateTime _selectedMonth;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _selectedMonth = DateTime(now.year, now.month, 1);
  }

  void _previousMonth() {
    setState(() {
      _selectedMonth = DateTime(_selectedMonth.year, _selectedMonth.month - 1, 1);
    });
  }

  void _nextMonth() {
    setState(() {
      _selectedMonth = DateTime(_selectedMonth.year, _selectedMonth.month + 1, 1);
    });
  }

  String _formatMonthYear(DateTime date) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return '${months[date.month - 1]} ${date.year}';
  }

  String _formatDateIso(DateTime date) {
    final y = date.year.toString().padLeft(4, '0');
    final m = date.month.toString().padLeft(2, '0');
    final d = date.day.toString().padLeft(2, '0');
    return '$y-$m-$d';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final activeChild = ref.watch(selectedChildProvider);
    final childrenAsync = ref.watch(parentChildrenProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        scrolledUnderElevation: 1,
        title: Text(
          'Attendance Records',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: childrenAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.error_outline, size: 48, color: colorScheme.error),
                const SizedBox(height: 12),
                Text(
                  'Failed to load wards',
                  style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  err.toString(),
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant),
                ),
                const SizedBox(height: 16),
                FilledButton.tonal(
                  onPressed: () => ref.invalidate(parentChildrenProvider),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
        data: (children) {
          if (children.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.family_restroom, size: 56, color: colorScheme.outlineVariant),
                    const SizedBox(height: 16),
                    Text(
                      'No Wards Found',
                      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'No students are currently linked to this parent account.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
            );
          }

          final effectiveChild = activeChild ?? children.first;

          // Compute start and end dates for the selected month
          final startDate = DateTime(_selectedMonth.year, _selectedMonth.month, 1);
          final lastDayInt = DateTime(_selectedMonth.year, _selectedMonth.month + 1, 0).day;
          final endDate = DateTime(_selectedMonth.year, _selectedMonth.month, lastDayInt);

          final attendanceParams = (
            studentId: effectiveChild.studentId,
            schoolId: effectiveChild.schoolId,
            startDate: _formatDateIso(startDate),
            endDate: _formatDateIso(endDate),
          );

          final attendanceAsync = ref.watch(childAttendanceProvider(attendanceParams));

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Child Selection Card
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: colorScheme.primaryContainer,
                        child: Text(
                          effectiveChild.initials,
                          style: TextStyle(
                            color: colorScheme.onPrimaryContainer,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              effectiveChild.name,
                              style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${effectiveChild.className} • Adm: ${effectiveChild.admissionNo}',
                              style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant),
                            ),
                          ],
                        ),
                      ),
                      if (children.length > 1)
                        TextButton.icon(
                          onPressed: () async {
                            final selected = await showChildSwitcherSheet(
                              context,
                              children: children,
                              selectedChild: effectiveChild,
                            );
                            if (selected != null) {
                              ref.read(selectedChildProvider.notifier).selectChild(selected);
                            }
                          },
                          icon: const Icon(Icons.swap_horiz, size: 16),
                          label: const Text('Switch'),
                        ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // 2. Month Selector & Rate Header
                attendanceAsync.when(
                  loading: () => const Center(
                    child: Padding(
                      padding: EdgeInsets.all(32.0),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  error: (err, _) => Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: colorScheme.errorContainer.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: colorScheme.error.withValues(alpha: 0.4)),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.warning_amber_rounded, color: colorScheme.error),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Failed to load attendance: $err',
                            style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.error),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.refresh),
                          onPressed: () => ref.invalidate(childAttendanceProvider(attendanceParams)),
                        ),
                      ],
                    ),
                  ),
                  data: (records) {
                    final recordMap = <int, ParentAttendanceRecord>{};
                    for (final r in records) {
                      final parsed = DateTime.tryParse(r.attendanceDate);
                      if (parsed != null && parsed.year == _selectedMonth.year && parsed.month == _selectedMonth.month) {
                        recordMap[parsed.day] = r;
                      }
                    }

                    int presentCount = 0;
                    int absentCount = 0;
                    int lateCount = 0;
                    int excusedCount = 0;

                    for (final r in recordMap.values) {
                      final st = r.status.toUpperCase();
                      if (st == 'PRESENT') {
                        presentCount++;
                      } else if (st == 'ABSENT') {
                        absentCount++;
                      } else if (st == 'LATE') {
                        lateCount++;
                      } else if (st == 'EXCUSED' || st == 'LEAVE') {
                        excusedCount++;
                      }
                    }

                    final totalMarked = presentCount + absentCount + lateCount + excusedCount;
                    final attendancePct = totalMarked > 0
                        ? (((presentCount + lateCount) / totalMarked) * 100).round()
                        : 0;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Month Navigation Bar
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.chevron_left),
                                  onPressed: _previousMonth,
                                ),
                                Text(
                                  _formatMonthYear(_selectedMonth),
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.chevron_right),
                                  onPressed: _nextMonth,
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: colorScheme.primaryContainer,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                totalMarked > 0 ? '$attendancePct% Rate' : 'N/A',
                                style: theme.textTheme.labelMedium?.copyWith(
                                  color: colorScheme.onPrimaryContainer,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        // Summary Statistics Chips
                        Row(
                          children: [
                            Expanded(
                              child: _buildMetricTile(
                                label: 'Present',
                                count: presentCount,
                                color: Colors.green,
                                icon: Icons.check_circle_outline,
                                context: context,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: _buildMetricTile(
                                label: 'Absent',
                                count: absentCount,
                                color: Colors.red,
                                icon: Icons.cancel_outlined,
                                context: context,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: _buildMetricTile(
                                label: 'Late/Leave',
                                count: lateCount + excusedCount,
                                color: Colors.orange,
                                icon: Icons.schedule_outlined,
                                context: context,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // Dynamic Monthly Calendar Grid
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceContainerLowest,
                            borderRadius: BorderRadius.circular(20),
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
                              // Weekday headers (M, T, W, T, F, S, S)
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
                                            color: colorScheme.onSurfaceVariant,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                              const SizedBox(height: 12),

                              // Dynamic Day Grid
                              _buildCalendarGrid(
                                month: _selectedMonth,
                                recordMap: recordMap,
                                colorScheme: colorScheme,
                                theme: theme,
                              ),
                            ],
                          ),
                        ),

                        if (records.isEmpty) ...[
                          const SizedBox(height: 16),
                          Center(
                            child: Text(
                              'No attendance entries found for this month.',
                              style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant),
                            ),
                          ),
                        ],
                      ],
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildMetricTile({
    required String label,
    required int count,
    required Color color,
    required IconData icon,
    required BuildContext context,
  }) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  count.toString(),
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                Text(
                  label,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarGrid({
    required DateTime month,
    required Map<int, ParentAttendanceRecord> recordMap,
    required ColorScheme colorScheme,
    required ThemeData theme,
  }) {
    final firstWeekday = DateTime(month.year, month.month, 1).weekday; // 1 = Mon, 7 = Sun
    final daysInMonth = DateTime(month.year, month.month + 1, 0).day;

    final cells = <Widget>[];

    // Leading empty slots
    for (int i = 1; i < firstWeekday; i++) {
      cells.add(const SizedBox());
    }

    // Days of the month
    final now = DateTime.now();
    final isCurrentMonth = now.year == month.year && now.month == month.month;

    for (int day = 1; day <= daysInMonth; day++) {
      final record = recordMap[day];
      final isToday = isCurrentMonth && now.day == day;

      Color? bgColor;
      Color textColor = colorScheme.onSurface;
      String statusInitial = '';

      if (record != null) {
        final st = record.status.toUpperCase();
        if (st == 'PRESENT') {
          bgColor = Colors.green.withValues(alpha: 0.15);
          textColor = Colors.green.shade800;
          statusInitial = 'P';
        } else if (st == 'ABSENT') {
          bgColor = Colors.red.withValues(alpha: 0.15);
          textColor = Colors.red.shade800;
          statusInitial = 'A';
        } else if (st == 'LATE') {
          bgColor = Colors.orange.withValues(alpha: 0.15);
          textColor = Colors.orange.shade800;
          statusInitial = 'L';
        } else if (st == 'EXCUSED' || st == 'LEAVE') {
          bgColor = Colors.blue.withValues(alpha: 0.15);
          textColor = Colors.blue.shade800;
          statusInitial = 'E';
        }
      }

      cells.add(
        Container(
          decoration: BoxDecoration(
            color: bgColor ?? (isToday ? colorScheme.primaryContainer.withValues(alpha: 0.4) : Colors.transparent),
            borderRadius: BorderRadius.circular(8),
            border: isToday
                ? Border.all(color: colorScheme.primary, width: 1.5)
                : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$day',
                style: theme.textTheme.labelMedium?.copyWith(
                  fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                  color: textColor,
                ),
              ),
              if (statusInitial.isNotEmpty) ...[
                const SizedBox(height: 2),
                Text(
                  statusInitial,
                  style: theme.textTheme.labelSmall?.copyWith(
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ],
            ],
          ),
        ),
      );
    }

    return GridView.count(
      crossAxisCount: 7,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.0,
      mainAxisSpacing: 6,
      crossAxisSpacing: 6,
      children: cells,
    );
  }
}
