import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';

class StudentMoreScreen extends StatelessWidget {
  const StudentMoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

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
                  'More',
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar & Settings
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerLowest,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 4,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search modules, fees, notices...',
                        hintStyle: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: colorScheme.primary,
                          size: 20,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerLowest,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: colorScheme.onSurfaceVariant,
                      size: 20,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Compact Profile Strip Banner
            GestureDetector(
              onTap: () => context.push('/student/profile'),
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primaryFixed.withValues(alpha: 0.4),
                      AppColors.surfaceContainerLowest,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.primaryFixed.withValues(alpha: 0.5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.primary.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: colorScheme.primary.withValues(alpha: 0.2),
                              width: 2,
                            ),
                            image: const DecorationImage(
                              image: NetworkImage(
                                'https://i.pravatar.cc/150?img=11',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              color: colorScheme.secondary,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.surfaceContainerLowest,
                                width: 2,
                              ),
                            ),
                            child: const Icon(
                              Icons.check,
                              color: AppColors.onSecondary,
                              size: 10,
                            ),
                          ),
                        ),
                      ],
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
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: colorScheme.primaryContainer,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  'Class 10-A',
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    fontSize: 9,
                                    color: colorScheme.onPrimaryContainer,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          RichText(
                            text: TextSpan(
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Roll #21',
                                  style: TextStyle(
                                    color: colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const TextSpan(
                                  text: ' • Delhi Public High School',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainerLowest.withValues(
                          alpha: 0.8,
                        ),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.primaryFixed),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Profile',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(
                            Icons.arrow_forward,
                            color: colorScheme.primary,
                            size: 14,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Slim AI Tutor Quick Shortcut Pill
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [colorScheme.primary, colorScheme.primaryContainer],
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.primary.withValues(alpha: 0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.smart_toy,
                      color: Colors.white,
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
                            Text(
                              'Schooly AI Tutor',
                              style: theme.textTheme.labelMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.25),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                '24/7',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 9,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Ask doubts, get solved answers instantly',
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontSize: 11,
                            color: Colors.white.withValues(alpha: 0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.auto_awesome,
                      size: 14,
                      color: colorScheme.primary,
                    ),
                    label: Text(
                      'Ask AI',
                      style: TextStyle(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: const Size(0, 32),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Modules Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Modules & Services',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '12 Hubs',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Grid
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1.6,
              children: [
                _buildGridItem(
                  'Timetable',
                  'Next: Physics 10:30',
                  Icons.schedule,
                  'Active',
                  AppColors.primaryFixed.withValues(alpha: 0.6),
                  colorScheme.primary,
                  colorScheme.secondaryContainer.withValues(alpha: 0.7),
                  colorScheme.onSecondaryContainer,
                  theme,
                  colorScheme,
                  onTap: () => context.go('/student/timetable'),
                ),
                _buildGridItem(
                  'Attendance',
                  '128 / 145 Days',
                  Icons.event_available,
                  '88%',
                  colorScheme.secondaryContainer.withValues(alpha: 0.6),
                  colorScheme.onSecondaryContainer,
                  colorScheme.secondaryContainer,
                  colorScheme.onSecondaryContainer,
                  theme,
                  colorScheme,
                  onTap: () => context.push('/student/attendance'),
                ),
                _buildGridItem(
                  'Homework',
                  'Maths & Biology',
                  Icons.menu_book,
                  '2 Due',
                  AppColors.tertiaryFixed.withValues(alpha: 0.7),
                  colorScheme.tertiary,
                  AppColors.tertiaryFixed,
                  colorScheme.tertiary,
                  theme,
                  colorScheme,
                  onTap: () => context.push('/student/homework'),
                ),
                _buildGridItem(
                  'Exams',
                  'Mid-term Datesheet',
                  Icons.assignment,
                  '28 Sep',
                  AppColors.primaryFixed.withValues(alpha: 0.8),
                  colorScheme.primaryContainer,
                  colorScheme.surfaceContainerHigh,
                  colorScheme.primary,
                  theme,
                  colorScheme,
                  onTap: () => context.go('/student/exams'),
                ),
                _buildGridItem(
                  'Fees & Dues',
                  '₹4,500 due',
                  Icons.account_balance_wallet,
                  'Pending',
                  colorScheme.errorContainer.withValues(alpha: 0.7),
                  colorScheme.error,
                  colorScheme.errorContainer,
                  colorScheme.onErrorContainer,
                  theme,
                  colorScheme,
                ),
                _buildGridItem(
                  'Report Card',
                  'Rank 3 in Class',
                  Icons.workspace_premium,
                  'GPA 9.4',
                  AppColors.secondaryFixed.withValues(alpha: 0.8),
                  colorScheme.onSecondaryContainer,
                  colorScheme.secondaryContainer,
                  colorScheme.onSecondaryContainer,
                  theme,
                  colorScheme,
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Other single items
            _buildListItem(
              'Calendar',
              'Holidays & Events',
              Icons.calendar_month,
              null,
              theme,
              colorScheme,
              onTap: () => context.push('/student/calendar'),
            ),
            const SizedBox(height: 10),
            _buildListItem(
              'School Bus',
              'On Route #14',
              Icons.directions_bus,
              'Live',
              theme,
              colorScheme,
            ),
            const SizedBox(height: 10),
            _buildListItem(
              'Leave',
              'Apply & Status',
              Icons.event_busy,
              null,
              theme,
              colorScheme,
              onTap: () => context.push('/student/leave'),
            ),
            const SizedBox(height: 10),
            _buildListItem(
              'Faculty Chat',
              '1 New Reply',
              Icons.forum,
              null,
              theme,
              colorScheme,
              hasNotification: true,
            ),

            const SizedBox(height: 24),

            // Help & Support Desk
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: colorScheme.surfaceContainer),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.02),
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
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.primaryFixed.withValues(alpha: 0.6),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.support_agent,
                          color: colorScheme.primary,
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Help & Support Desk',
                            style: theme.textTheme.labelMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Toll-Free: 1800-200-9988 (8AM-8PM)',
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontSize: 11,
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.call, size: 14),
                    label: const Text('Call'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.secondary,
                      foregroundColor: colorScheme.onSecondary,
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      minimumSize: const Size(0, 32),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 2,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Footer Actions
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.switch_account,
                      size: 16,
                      color: colorScheme.primary,
                    ),
                    label: Text(
                      'Switch Account',
                      style: TextStyle(color: colorScheme.onSurface),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.surfaceContainerLowest,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.logout,
                      size: 16,
                      color: colorScheme.onErrorContainer,
                    ),
                    label: Text(
                      'Log Out',
                      style: TextStyle(color: colorScheme.onErrorContainer),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.errorContainer,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                'Schooly v2.4.1 • Protected by Cloud ERP',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
                ),
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(
    String title,
    String subtitle,
    IconData icon,
    String badgeText,
    Color iconBg,
    Color iconColor,
    Color badgeBg,
    Color badgeColor,
    ThemeData theme,
    ColorScheme colorScheme, {
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: colorScheme.surfaceContainer),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.02),
              blurRadius: 4,
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
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: iconBg,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: iconColor, size: 20),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: badgeBg,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    badgeText,
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontSize: 10,
                      color: badgeColor,
                      fontWeight: FontWeight.bold,
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
                  style: theme.textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  subtitle,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 11,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(
    String title,
    String subtitle,
    IconData icon,
    String? badgeText,
    ThemeData theme,
    ColorScheme colorScheme, {
    bool hasNotification = false,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: colorScheme.surfaceContainer),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.02),
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
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: colorScheme.primary, size: 20),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontSize: 10,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            if (badgeText != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  badgeText,
                  style: theme.textTheme.labelSmall?.copyWith(
                    fontSize: 10,
                    color: colorScheme.onSecondaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            else if (hasNotification)
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: colorScheme.secondary,
                  shape: BoxShape.circle,
                ),
              )
            else
              Icon(
                Icons.chevron_right,
                color: colorScheme.outlineVariant,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}
