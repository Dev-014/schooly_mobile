import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/auth/permissions.dart';
import '../../../core/auth/user_permissions.dart';
import '../../auth/providers/auth_provider.dart';

class ParentDashboardScreen extends ConsumerWidget {
  const ParentDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final user = ref.watch(authProvider);

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
            margin: const EdgeInsets.only(right: 16, left: 8),
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: colorScheme.primary,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primary.withValues(alpha: 0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(Icons.person, color: colorScheme.onPrimary, size: 18),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100), // Account for BottomAppBar
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),

            // 1. Header & Child Switcher Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Good morning, Mayur',
                            style: theme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              letterSpacing: -0.5,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Text('👋', style: TextStyle(fontSize: 20)),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Here is Arun\'s overview for today',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: colorScheme.surfaceContainer),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.02),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: const Color(0xFFCCE5FF), // primary-fixed
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
                          'Arun • 7-A',
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
                ],
              ),
            ),

            const SizedBox(height: 16),

            // 2. Action Needed Minimal Highlight Banner
            if (user?.hasPermission(Permissions.fees.feeInvoice.view) ?? false)
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
                                  const TextSpan(text: 'Fee due in 6 days: '),
                                  TextSpan(
                                    text: '₹4,500',
                                    style: TextStyle(
                                      color: colorScheme.error,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              '2 tasks require attention today',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
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

            if (user?.hasPermission(Permissions.fees.feeInvoice.view) ?? false)
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
                          child: _StatCard(
                            title: 'Attendance',
                            value: '92%',
                            subtitle: ' Good',
                            subtitleColor: const Color(0xFF006E2D), // secondary
                            icon: Icons.verified_user,
                            iconColor: const Color(0xFF006E2D),
                            iconBg: const Color(
                              0xFF7FFC97,
                            ).withValues(alpha: 0.4), // secondary-fixed
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
                          child: _StatCard(
                            title: 'Homework',
                            value: '2 Pending',
                            valueColor: const Color(0xFFA33900), // tertiary
                            icon: Icons.edit_document,
                            iconColor: const Color(0xFFA33900),
                            iconBg: const Color(0xFFFFDBCE), // tertiary-fixed
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
                          child: _StatCard(
                            title: 'Next Exam',
                            value: '28 Sep',
                            subtitle: ' Maths',
                            icon: Icons.event_note,
                            iconColor: colorScheme.primary,
                            iconBg: const Color(
                              0xFFCCE5FF,
                            ).withValues(alpha: 0.6), // primary-fixed
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
                              value: '₹4,500',
                              valueColor: colorScheme.error,
                              subtitle: ' 30 Sep',
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
                          onPressed: () {},
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
                          _ClassItem(
                            time: '09:00 AM',
                            subject: 'Mathematics',
                            details: 'Room 201 • Mrs. R. Gupta',
                            isLive: true,
                          ),
                          const SizedBox(height: 6),
                          _ClassItem(
                            time: '10:00 AM',
                            subject: 'Science',
                            details: 'Room 105 • Mr. V. Nair',
                            isLive: false,
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
                      color: valueColor ?? colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(text: value),
                      if (subtitle != null)
                        TextSpan(
                          text: subtitle,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color:
                                subtitleColor ?? colorScheme.onSurfaceVariant,
                            fontWeight: subtitleColor != null
                                ? FontWeight.w600
                                : FontWeight.normal,
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
              color: iconBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 20),
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
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isLive
            ? const Color(0xFFF2F3FF).withValues(alpha: 0.7)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isLive
                      ? const Color(0xFFCCE5FF).withValues(alpha: 0.5)
                      : colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  time,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: isLive
                        ? colorScheme.primary
                        : colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 12, width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subject,
                    style: theme.textTheme.titleSmall?.copyWith(
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
            ],
          ),
          if (isLive)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xFF7FFC97).withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Live',
                style: TextStyle(
                  color: Color(0xFF006E2D),
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          else
            Icon(
              Icons.chevron_right,
              size: 18,
              color: colorScheme.outlineVariant,
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
  final VoidCallback? onTap;

  const _QuickAccessItem({
    required this.icon,
    required this.label,
    required this.iconColor,
    required this.iconBg,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: theme.textTheme.labelMedium?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
