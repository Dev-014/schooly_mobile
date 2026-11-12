import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';

class AdminMoreScreen extends StatelessWidget {
  const AdminMoreScreen({super.key});

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
                        hintText: 'Search modules, settings...',
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

            // Admin Profile Card
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(24),
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
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 56,
                        height: 56,
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
                            color: Colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.surfaceContainerLowest,
                              width: 2,
                            ),
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
                              'Principal Sir',
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
                                'Super Admin',
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
                                text: 'Emp ID: A-001',
                                style: TextStyle(
                                  color: colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const TextSpan(text: ' • Management'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: colorScheme.outlineVariant,
                    size: 24,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

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
                  'All Hubs',
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
                  'Students',
                  'Directories & Admission',
                  Icons.school,
                  'Active',
                  AppColors.primaryFixed.withValues(alpha: 0.6),
                  colorScheme.primary,
                  colorScheme.primaryContainer,
                  colorScheme.onPrimaryContainer,
                  theme,
                  colorScheme,
                  onTap: () => context.push('/admin/student'),
                ),
                _buildGridItem(
                  'Academics',
                  'Classes & Sessions',
                  Icons.auto_stories,
                  'Active',
                  AppColors.primaryFixed.withValues(alpha: 0.6),
                  colorScheme.primary,
                  colorScheme.secondaryContainer.withValues(alpha: 0.7),
                  colorScheme.onSecondaryContainer,
                  theme,
                  colorScheme,
                  onTap: () => context.push('/admin/more/academics'),
                ),
                _buildGridItem(
                  'Income',
                  'Fees & Revenue',
                  Icons.account_balance_wallet,
                  'Live',
                  AppColors.tertiaryFixed.withValues(alpha: 0.7),
                  colorScheme.tertiary,
                  colorScheme.secondaryContainer.withValues(alpha: 0.7),
                  colorScheme.onSecondaryContainer,
                  theme,
                  colorScheme,
                  onTap: () => context.push('/admin/more/income'),
                ),
                _buildGridItem(
                  'Expense',
                  'Payments & Bills',
                  Icons.money_off,
                  'Live',
                  colorScheme.errorContainer.withValues(alpha: 0.7),
                  colorScheme.error,
                  colorScheme.secondaryContainer.withValues(alpha: 0.7),
                  colorScheme.onSecondaryContainer,
                  theme,
                  colorScheme,
                  onTap: () => context.push('/admin/more/expense'),
                ),
                _buildGridItem(
                  'HR & Staff',
                  'Payroll & Leave',
                  Icons.groups,
                  'Active',
                  colorScheme.secondaryContainer.withValues(alpha: 0.6),
                  colorScheme.onSecondaryContainer,
                  colorScheme.secondaryContainer,
                  colorScheme.onSecondaryContainer,
                  theme,
                  colorScheme,
                ),
                _buildGridItem(
                  'Transport',
                  'Routes & Vehicles',
                  Icons.directions_bus,
                  '3 Routes',
                  AppColors.tertiaryFixed.withValues(alpha: 0.7),
                  colorScheme.tertiary,
                  AppColors.tertiaryFixed,
                  colorScheme.tertiary,
                  theme,
                  colorScheme,
                ),
                _buildGridItem(
                  'Exams & Results',
                  'Offline Exams, Report Cards',
                  Icons.assignment_ind,
                  'Live',
                  colorScheme.secondaryContainer.withValues(alpha: 0.6),
                  colorScheme.onSecondaryContainer,
                  colorScheme.secondary,
                  colorScheme.onSecondary,
                  theme,
                  colorScheme,
                  onTap: () => context.push('/exams-and-results'),
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
            ),
            const SizedBox(height: 10),
            _buildListItem(
              'Settings',
              'App configurations',
              Icons.tune,
              null,
              theme,
              colorScheme,
            ),
            const SizedBox(height: 10),
            _buildListItem(
              'Notices',
              'Admin Broadcasts',
              Icons.campaign,
              '1 New',
              theme,
              colorScheme,
              hasNotification: true,
            ),

            const SizedBox(height: 24),

            // Footer Actions
            Row(
              children: [
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
