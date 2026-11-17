import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/auth/permissions.dart';
import '../../../core/auth/user_permissions.dart';
import '../../auth/providers/auth_provider.dart';
import '../providers/parent_providers.dart';
import '../more/child_switcher_sheet.dart';

class ParentDashboardScreen extends ConsumerWidget {
  const ParentDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final user = ref.watch(authProvider);
    final activeChild = ref.watch(selectedChildProvider);
    final childrenAsync = ref.watch(parentChildrenProvider);

    final todayDay = const [
      'MONDAY',
      'TUESDAY',
      'WEDNESDAY',
      'THURSDAY',
      'FRIDAY',
      'SATURDAY',
      'SUNDAY'
    ][DateTime.now().weekday - 1];

    final feeSummaryAsync = activeChild != null
        ? ref.watch(childFeeSummaryProvider(activeChild.studentId))
        : null;
    final timetableAsync = activeChild != null
        ? ref.watch(childTimetableProvider((
            studentId: activeChild.studentId,
            schoolId: activeChild.schoolId,
            dayOfWeek: todayDay,
          )))
        : null;
    final homeworkAsync = activeChild != null
        ? ref.watch(childHomeworkProvider((
            studentId: activeChild.studentId,
            schoolId: activeChild.schoolId,
          )))
        : null;
    final pendingFee = feeSummaryAsync?.value?.pendingAmount ?? 0.0;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: colorScheme.surface.withValues(alpha: 0.85),
        elevation: 0,
        scrolledUnderElevation: 1,
        title: Row(
          children: [
            Image.network(
              'https://lh3.googleusercontent.com/aida/AEtjO1VhmYOOgfjA8H4EWrvi20LrXSc2KriGgLNrcG8lnpaje84tI8QE36rdXfvRWvEgxrrNQv27CuyUp1XlHwhUY7FlWhfs6L6VCzJF1jH4HPltVZkGtOrnuQij9ZcuZapCQNVPEWtmZrySiZDZxYqhJX7Ibt6wyJHlGS1YG1M2qegNL5oXVkKDkzXx1dmmv2NnRr5fHnp9bR164btk2sUnIiUvpKPy72ljU4rY7fxFz4jNdy3mxheX9z6305R9',
              height: 32,
              errorBuilder: (context, error, stackTrace) => Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.school,
                  color: colorScheme.onPrimaryContainer,
                  size: 24,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Schooly',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.5,
                  ),
                ),
                Text(
                  'PARENT PORTAL',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Stack(
              children: [
                Icon(
                  Icons.notifications_none,
                  color: colorScheme.onSurfaceVariant,
                ),
                Positioned(
                  right: 2,
                  top: 2,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: colorScheme.error,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: colorScheme.surface,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {},
          ),
          Container(
            margin: const EdgeInsets.only(right: 16, left: 4),
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: colorScheme.primary,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.person,
              color: colorScheme.onPrimary,
              size: 18,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 120),
        child: Column(
          children: [
            // 1. Parent Hero Greeting & Ward Switcher
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Back,',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      Text(
                        user?.name ?? 'Parent Portal',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () async {
                      final children = childrenAsync.value ?? [];
                      if (children.isNotEmpty) {
                        final selected = await showChildSwitcherSheet(
                          context,
                          children: children,
                          selectedChild: activeChild,
                        );
                        if (selected != null) {
                          ref.read(selectedChildProvider.notifier).selectChild(selected);
                        }
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: colorScheme.surfaceContainer,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.04),
                            blurRadius: 4,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: const BoxDecoration(
                              color: Color(0xFFCCE5FF),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.face,
                              size: 16,
                              color: colorScheme.primary,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            activeChild != null
                                ? '${activeChild.name.split(' ').first} • ${activeChild.className}'
                                : 'Select Child',
                            style: theme.textTheme.labelMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(
                            Icons.arrow_drop_down,
                            size: 16,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // 2. Action Needed Minimal Highlight Banner (Only if pending fee exists)
            if ((user?.hasPermission(Permissions.fees.feeInvoice.view) ?? false) && pendingFee > 0)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.errorContainer.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: colorScheme.errorContainer),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.02),
                        blurRadius: 8,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: colorScheme.error,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.priority_high,
                          size: 18,
                          color: colorScheme.onError,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: theme.textTheme.labelMedium?.copyWith(
                                  color: colorScheme.onSurface,
                                  fontWeight: FontWeight.w600,
                                ),
                                children: [
                                  const TextSpan(text: 'Fee due: '),
                                  TextSpan(
                                    text: '₹${pendingFee.toStringAsFixed(0)}',
                                    style: TextStyle(
                                      color: colorScheme.error,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              feeSummaryAsync?.value?.nextDueDate != null
                                  ? 'Due by ${feeSummaryAsync!.value!.nextDueDate}'
                                  : 'Action required for this term',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => context.push('/parent/dashboard/fees'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorScheme.primary,
                          foregroundColor: colorScheme.onPrimary,
                          elevation: 2,
                          shadowColor: colorScheme.primary.withValues(
                            alpha: 0.2,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          minimumSize: Size.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: const Text(
                          'Pay',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            if ((user?.hasPermission(Permissions.fees.feeInvoice.view) ?? false) && pendingFee > 0)
              const SizedBox(height: 24),

            // 3. At a Glance (2x2 Grid)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'At a Glance',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Today',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      if (user?.hasPermission(
                            Permissions.attendance.attendanceRecord.view,
                          ) ??
                          false)
                        Expanded(
                          child: GestureDetector(
                            onTap: () => context.push('/parent/more/attendance'),
                            child: _StatCard(
                              title: 'Attendance',
                              value: activeChild != null && activeChild.attendancePct > 0
                                  ? '${activeChild.attendancePct}%'
                                  : 'N/A',
                              subtitle: (activeChild?.attendancePct ?? 0) >= 75 ? ' Good' : ' Low',
                              subtitleColor: const Color(0xFF006E2D),
                              icon: Icons.verified_user,
                              iconColor: const Color(0xFF006E2D),
                              iconBg: const Color(
                                0xFF7FFC97,
                              ).withValues(alpha: 0.4),
                            ),
                          ),
                        ),
                      if ((user?.hasPermission(
                                Permissions.attendance.attendanceRecord.view,
                              ) ??
                              false) &&
                          (user?.hasPermission(
                                Permissions.homework.assignment.view,
                              ) ??
                              false))
                        const SizedBox(width: 10),
                      if (user?.hasPermission(
                            Permissions.homework.assignment.view,
                          ) ??
                          false)
                        Expanded(
                          child: GestureDetector(
                            onTap: () => context.push('/parent/more/homework'),
                            child: _StatCard(
                              title: 'Homework',
                              value: homeworkAsync?.value != null
                                  ? '${homeworkAsync!.value!.where((h) => !h.isSubmitted).length} Pending'
                                  : '0 Pending',
                              valueColor: const Color(0xFFA33900),
                              icon: Icons.edit_document,
                              iconColor: const Color(0xFFA33900),
                              iconBg: const Color(0xFFFFDBCE),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      if (user?.hasPermission(
                            Permissions.examsResults.studentExams.viewTimetable,
                          ) ??
                          false)
                        Expanded(
                          child: GestureDetector(
                            onTap: () => context.go('/parent/exams'),
                            child: _StatCard(
                              title: 'Next Exam',
                              value: 'Exams & Results',
                              subtitle: ' View Schedule',
                              icon: Icons.event_note,
                              iconColor: colorScheme.primary,
                              iconBg: const Color(
                                0xFFCCE5FF,
                              ).withValues(alpha: 0.6),
                            ),
                          ),
                        ),
                      if ((user?.hasPermission(
                                Permissions
                                    .examsResults
                                    .studentExams
                                    .viewTimetable,
                              ) ??
                              false) &&
                          (user?.hasPermission(
                                Permissions.fees.feeInvoice.view,
                              ) ??
                              false))
                        const SizedBox(width: 10),
                      if (user?.hasPermission(
                            Permissions.fees.feeInvoice.view,
                          ) ??
                          false)
                        Expanded(
                          child: GestureDetector(
                            onTap: () => context.push('/parent/dashboard/fees'),
                            child: _StatCard(
                              title: 'Fee Due',
                              value: '₹${pendingFee.toStringAsFixed(0)}',
                              valueColor: colorScheme.error,
                              subtitle: pendingFee > 0
                                  ? (feeSummaryAsync?.value?.nextDueDate != null
                                      ? ' Due: ${feeSummaryAsync!.value!.nextDueDate}'
                                      : ' Pending')
                                  : ' Fully Paid',
                              icon: Icons.payments,
                              iconColor: colorScheme.error,
                              iconBg: colorScheme.errorContainer,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 4. Today's Classes
            if (user?.hasPermission(
                  Permissions.academic.timetablePeriod.view,
                ) ??
                false)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.schedule,
                              size: 18,
                              color: colorScheme.primary,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'Today\'s Classes',
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () => context.go('/parent/timetable'),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            foregroundColor: colorScheme.primary,
                          ),
                          child: const Text(
                            'View All',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: colorScheme.surfaceContainer.withValues(
                            alpha: 0.5,
                          ),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.02),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          if (timetableAsync?.value != null && timetableAsync!.value!.entries.isNotEmpty)
                            ...timetableAsync.value!.entries.take(2).map((item) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 6),
                                child: _ClassItem(
                                  time: '${item.startTime} - ${item.endTime}',
                                  subject: item.subjectName,
                                  details: '${item.roomNumber.isNotEmpty ? "Room ${item.roomNumber} • " : ""}${item.teacherName}',
                                  isLive: item.status == 'Ongoing' || item.status == 'ACTIVE',
                                ),
                              );
                            })
                          else
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                'No classes scheduled for today',
                                style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            if (user?.hasPermission(
                  Permissions.academic.timetablePeriod.view,
                ) ??
                false)
              const SizedBox(height: 24),

            // 5. Quick Access
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Quick Access',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      if (user?.hasPermission(
                            Permissions.homework.assignment.view,
                          ) ??
                          false)
                        Expanded(
                          child: _QuickAccessItem(
                            icon: Icons.menu_book,
                            label: 'Homework',
                            iconColor: colorScheme.primary,
                            iconBg: const Color(
                              0xFFCCE5FF,
                            ).withValues(alpha: 0.5),
                            onTap: () => context.push('/parent/more/homework'),
                          ),
                        ),
                      if ((user?.hasPermission(
                                Permissions.homework.assignment.view,
                              ) ??
                              false) &&
                          (user?.hasPermission(
                                Permissions.fees.feeInvoice.view,
                              ) ??
                              false))
                        const SizedBox(width: 10),
                      if (user?.hasPermission(
                            Permissions.fees.feeInvoice.view,
                          ) ??
                          false)
                        Expanded(
                          child: _QuickAccessItem(
                            icon: Icons.payments,
                            label: 'Fees',
                            iconColor: colorScheme.error,
                            iconBg: colorScheme.errorContainer,
                            onTap: () => context.push('/parent/dashboard/fees'),
                          ),
                        ),
                      if ((user?.hasPermission(
                                Permissions.fees.feeInvoice.view,
                              ) ??
                              false) &&
                          (user?.hasPermission(
                                Permissions.attendance.attendanceRecord.view,
                              ) ??
                              false))
                        const SizedBox(width: 10),
                      if (user?.hasPermission(
                            Permissions.attendance.attendanceRecord.view,
                          ) ??
                          false)
                        Expanded(
                          child: _QuickAccessItem(
                            icon: Icons.event_busy,
                            label: 'Leave',
                            iconColor: const Color(0xFFA33900),
                            iconBg: const Color(0xFFFFDBCE),
                            onTap: () => context.push('/parent/more/leave'),
                          ),
                        ),
                      if ((user?.hasPermission(
                                Permissions.attendance.attendanceRecord.view,
                              ) ??
                              false) &&
                          (user?.hasPermission(
                                Permissions.academic.timetablePeriod.view,
                              ) ??
                              false))
                        const SizedBox(width: 10),
                      if (user?.hasPermission(
                            Permissions.academic.timetablePeriod.view,
                          ) ??
                          false)
                        Expanded(
                          child: _QuickAccessItem(
                            icon: Icons.calendar_month,
                            label: 'Timetable',
                            iconColor: const Color(0xFF006E2D),
                            iconBg: const Color(
                              0xFF7FFC97,
                            ).withValues(alpha: 0.5),
                            onTap: () => context.go('/parent/timetable'),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final Color? valueColor;
  final String? subtitle;
  final Color? subtitleColor;
  final IconData icon;
  final Color iconColor;
  final Color iconBg;

  const _StatCard({
    required this.title,
    required this.value,
    this.valueColor,
    this.subtitle,
    this.subtitleColor,
    required this.icon,
    required this.iconColor,
    required this.iconBg,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.surfaceContainer.withValues(alpha: 0.5),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 2),
                RichText(
                  text: TextSpan(
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: valueColor ?? colorScheme.onSurface,
                    ),
                    children: [
                      TextSpan(text: value),
                      if (subtitle != null)
                        TextSpan(
                          text: subtitle,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: subtitleColor ?? colorScheme.onSurfaceVariant,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconColor, size: 18),
          ),
        ],
      ),
    );
  }
}

class _ClassItem extends StatelessWidget {
  final String time;
  final String subject;
  final String details;
  final bool isLive;

  const _ClassItem({
    required this.time,
    required this.subject,
    required this.details,
    required this.isLive,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: isLive ? colorScheme.primaryContainer.withValues(alpha: 0.3) : AppColors.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isLive ? colorScheme.primary.withValues(alpha: 0.3) : Colors.transparent,
        ),
      ),
      child: Row(
        children: [
          Text(
            time,
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: isLive ? colorScheme.primary : colorScheme.onSurface,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subject,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
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
          if (isLive)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: colorScheme.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'LIVE',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _QuickAccessItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColor;
  final Color iconBg;
  final VoidCallback onTap;

  const _QuickAccessItem({
    required this.icon,
    required this.label,
    required this.iconColor,
    required this.iconBg,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.02),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: iconBg,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: theme.textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
