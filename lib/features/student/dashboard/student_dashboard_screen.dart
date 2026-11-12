import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/auth/permissions.dart';
import '../../../core/auth/user_permissions.dart';
import '../../auth/providers/auth_provider.dart';

class StudentDashboardScreen extends ConsumerWidget {
  const StudentDashboardScreen({super.key});

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
            Container(
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
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SCHOOLY PORTAL',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                Text(
                  'Home',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Badge(child: Icon(Icons.notifications_outlined)),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.widgets_outlined),
            onPressed: () {},
          ),
          const SizedBox(width: 4),
          const CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Greeting
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Stack(
                      children: [
                        const CircleAvatar(
                          radius: 24,
                          backgroundImage: NetworkImage(
                            'https://i.pravatar.cc/150?img=11',
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 14,
                            height: 14,
                            decoration: BoxDecoration(
                              color: colorScheme.secondary,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: colorScheme.surface,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Hello, Aarav!',
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Text('👋', style: TextStyle(fontSize: 18)),
                          ],
                        ),
                        Text(
                          'Ready to Learn',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            // AI Assistant Prompt Capsule
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: colorScheme.surface,
                    child: Icon(Icons.smart_toy, color: colorScheme.primary),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'How can I assist you?',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant.withValues(
                          alpha: 0.7,
                        ),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: colorScheme.primary,
                    child: Icon(Icons.tune, color: colorScheme.onPrimary),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Current Schedule
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'CURRENT SCHEDULE',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    letterSpacing: 1.2,
                  ),
                ),
                Text(
                  'Grade 10-A',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 148,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: colorScheme.secondary,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                'Active Class',
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.2),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.my_location,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Physics',
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Optics & Waves',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: Colors.white.withValues(alpha: 0.9),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(
                                  Icons.meeting_room,
                                  color: Colors.white.withValues(alpha: 0.8),
                                  size: 14,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Room 204',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: Colors.white.withValues(alpha: 0.8),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    height: 148,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                'Next Class',
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.2),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mathematics',
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Calculus & Graphs',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: Colors.white.withValues(alpha: 0.9),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(
                                  Icons.schedule,
                                  color: Colors.white.withValues(alpha: 0.8),
                                  size: 14,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '11:15 AM',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: Colors.white.withValues(alpha: 0.8),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Motivational Highlight
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Keep Going!',
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Text('🎯'),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "You're doing great! 92% attendance this term. Stay consistent.",
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: colorScheme.secondaryContainer,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  const Text(
                                    '🔥',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '14-day streak',
                                    style: theme.textTheme.labelSmall?.copyWith(
                                      color: colorScheme.onSecondaryContainer,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: colorScheme.primaryContainer.withValues(
                                  alpha: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                'Top 5% in Class',
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: colorScheme.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 64,
                        height: 64,
                        child: CircularProgressIndicator(
                          value: 0.92,
                          strokeWidth: 6,
                          backgroundColor: colorScheme.surfaceContainerHighest,
                          color: colorScheme.primary,
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '92',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '%',
                            style: theme.textTheme.labelSmall?.copyWith(
                              fontSize: 10,
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Quick Actions Bento Grid
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Quick Actions',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(onPressed: () {}, child: const Text('View All')),
              ],
            ),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.3,
              children: [
                if (user?.hasPermission(
                      Permissions.attendance.attendanceRecord.view,
                    ) ??
                    false)
                  _buildGridCard(
                    context,
                    icon: Icons.how_to_reg,
                    iconBg: AppColors.secondaryFixed.withValues(alpha: 0.5),
                    iconColor: colorScheme.secondary,
                    tag: 'Good',
                    tagBg: AppColors.secondaryFixed,
                    tagColor: AppColors.onSecondaryContainer,
                    title: 'Attendance',
                    mainValue: '92%',
                    subText: 'Present: 184 days',
                  ),
                if (user?.hasPermission(Permissions.homework.assignment.view) ??
                    false)
                  _buildGridCard(
                    context,
                    icon: Icons.edit_note,
                    iconBg: AppColors.tertiaryFixed,
                    iconColor: colorScheme.tertiary,
                    tag: 'Action',
                    tagBg: AppColors.tertiaryFixed,
                    tagColor: AppColors.onTertiaryContainer,
                    title: 'Homework',
                    mainValue: '2 Pending',
                    mainValueColor: colorScheme.tertiary,
                    subText: 'Due Tomorrow',
                  ),
                if (user?.hasPermission(Permissions.fees.feeInvoice.view) ??
                    false)
                  _buildGridCard(
                    context,
                    icon: Icons.payments,
                    iconBg: colorScheme.primaryContainer,
                    iconColor: colorScheme.onPrimaryContainer,
                    tag: 'Pay',
                    tagBg: colorScheme.primary,
                    tagColor: colorScheme.onPrimary,
                    title: 'Term Fees',
                    mainValue: '₹12,500',
                    subText: 'Due in 5 days',
                    subTextColor: colorScheme.error,
                  ),
                if (user?.hasPermission(
                      Permissions.academic.timetablePeriod.view,
                    ) ??
                    false)
                  _buildGridCard(
                    context,
                    icon: Icons.calendar_month,
                    iconBg: colorScheme.surfaceContainer,
                    iconColor: colorScheme.onSurfaceVariant,
                    tag: 'Today',
                    tagBg: colorScheme.surfaceContainer,
                    tagColor: colorScheme.onSurfaceVariant,
                    title: 'Timetable',
                    mainValue: '5 Classes',
                    subText: 'Physics up now',
                  ),
                if (user?.hasPermission(
                      Permissions.examsResults.studentExams.viewResults,
                    ) ??
                    false)
                  _buildGridCard(
                    context,
                    icon: Icons.fact_check,
                    iconBg: colorScheme.surfaceContainer,
                    iconColor: colorScheme.onSurfaceVariant,
                    tag: 'Upcoming',
                    tagBg: AppColors.tertiaryFixed,
                    tagColor: AppColors.onTertiaryContainer,
                    title: 'Exams',
                    mainValue: 'Unit Test',
                    subText: 'Starts in 6d',
                    subTextColor: colorScheme.tertiary,
                  ),
                if (user?.hasPermission(
                      Permissions.attendance.attendanceRecord.view,
                    ) ??
                    false)
                  _buildGridCard(
                    context,
                    icon: Icons.flight_takeoff,
                    iconBg: AppColors.secondaryFixed.withValues(alpha: 0.5),
                    iconColor: colorScheme.secondary,
                    tag: 'Clear',
                    tagBg: AppColors.secondaryFixed,
                    tagColor: AppColors.onSecondaryContainer,
                    title: 'Leave Portal',
                    mainValue: '0 Pending',
                    subText: 'All approved',
                    subTextColor: colorScheme.secondary,
                  ),
              ],
            ),
            const SizedBox(height: 24),

            // Today's Alerts
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Today's Alerts",
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: colorScheme.tertiary,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
                TextButton(onPressed: () {}, child: const Text('See All')),
              ],
            ),
            if (user?.hasPermission(Permissions.homework.assignment.view) ??
                false)
              _buildAlertCard(
                context,
                icon: Icons.assignment_late,
                iconColor: colorScheme.tertiary,
                iconBg: AppColors.tertiaryFixed,
                title: 'Math Homework Due',
                subtitle: 'Linear Equations • Chapter 4 Ex. B',
                tag: 'Pending',
                tagBg: AppColors.tertiaryFixed,
                tagColor: AppColors.onTertiaryContainer,
                time: 'Due 24 Sep',
              ),
            const SizedBox(height: 12),
            if (user?.hasPermission(Permissions.communication.message.view) ??
                false)
              _buildAlertCard(
                context,
                icon: Icons.video_camera_front,
                iconColor: colorScheme.primary,
                iconBg: colorScheme.primaryContainer,
                title: 'PTM at 03:00 PM',
                subtitle: 'Quarterly Academic Review',
                tag: 'Online',
                tagBg: colorScheme.primaryContainer,
                tagColor: colorScheme.onPrimaryContainer,
                time: '10 min ago',
              ),
            const SizedBox(height: 12),
            if (user?.hasPermission(Permissions.fees.feeInvoice.view) ?? false)
              _buildAlertCard(
                context,
                icon: Icons.account_balance_wallet,
                iconColor: colorScheme.error,
                iconBg: colorScheme.errorContainer,
                title: 'Fee Installment #2',
                subtitle: 'Tuition & Lab access fees',
                tag: 'Action',
                tagBg: colorScheme.errorContainer,
                tagColor: colorScheme.onErrorContainer,
                time: 'Due in 5d',
              ),
            const SizedBox(height: 12),
            if (user?.hasPermission(Permissions.communication.message.view) ??
                false)
              _buildAlertCard(
                context,
                icon: Icons.campaign,
                iconColor: colorScheme.onSurfaceVariant,
                iconBg: colorScheme.surfaceContainer,
                title: 'Annual Sports Day Trial',
                subtitle: 'Circular #2024-88 published',
                tag: 'Notice',
                tagBg: colorScheme.surfaceContainer,
                tagColor: colorScheme.onSurfaceVariant,
                time: 'Today',
              ),

            const SizedBox(height: 48), // Padding for bottom nav
          ],
        ),
      ),
    );
  }

  Widget _buildGridCard(
    BuildContext context, {
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String tag,
    required Color tagBg,
    required Color tagColor,
    required String title,
    required String mainValue,
    Color? mainValueColor,
    required String subText,
    Color? subTextColor,
  }) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLowest,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: iconBg,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: iconColor, size: 20),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: tagBg,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  tag,
                  style: theme.textTheme.labelSmall?.copyWith(
                    fontSize: 10,
                    color: tagColor,
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                mainValue,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: mainValueColor ?? theme.colorScheme.onSurface,
                ),
              ),
              Text(
                subText,
                style: theme.textTheme.labelSmall?.copyWith(
                  fontSize: 11,
                  color: subTextColor ?? theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAlertCard(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required String title,
    required String subtitle,
    required String tag,
    required Color tagBg,
    required Color tagColor,
    required String time,
  }) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(20),
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
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  subtitle,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: tagBg,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  tag,
                  style: theme.textTheme.labelSmall?.copyWith(
                    fontSize: 10,
                    color: tagColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                time,
                style: theme.textTheme.labelSmall?.copyWith(
                  fontSize: 10,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
