import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../providers/parent_providers.dart';
import 'child_switcher_sheet.dart';

class ParentMoreScreen extends ConsumerStatefulWidget {
  const ParentMoreScreen({super.key});

  @override
  ConsumerState<ParentMoreScreen> createState() => _ParentMoreScreenState();
}

class _ParentMoreScreenState extends ConsumerState<ParentMoreScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final activeChild = ref.watch(selectedChildProvider);
    final childrenAsync = ref.watch(parentChildrenProvider);
    final children = childrenAsync.value ?? [];

    final effectiveChild = activeChild ?? (children.isNotEmpty ? children.first : null);

    Future<void> openChildSwitcher() async {
      if (children.isEmpty) return;
      final result = await showChildSwitcherSheet(
        context,
        children: children,
        selectedChild: effectiveChild,
      );
      if (result != null) {
        ref.read(selectedChildProvider.notifier).selectChild(result);
      }
    }

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
                  'PARENT PORTAL',
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
            // Profile & Switch Children Strip
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Selected Child',
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Switch button
                        GestureDetector(
                          onTap: openChildSwitcher,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: colorScheme.primary,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.swap_horiz,
                                  color: Colors.white,
                                  size: 14,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Switch',
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    if (effectiveChild == null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          'No child profile linked to this parent account.',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      )
                    else
                      Row(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: colorScheme.primary.withValues(
                                      alpha: 0.2,
                                    ),
                                    width: 2,
                                  ),
                                  color: AppColors.primaryFixed,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  effectiveChild.initials,
                                  style: TextStyle(
                                    color: colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
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
                                      effectiveChild.name,
                                      style: theme.textTheme.titleMedium
                                          ?.copyWith(fontWeight: FontWeight.bold),
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
                                        effectiveChild.className,
                                        style: theme.textTheme.labelSmall
                                            ?.copyWith(
                                              fontSize: 9,
                                              color:
                                                  colorScheme.onPrimaryContainer,
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
                                        text: effectiveChild.rollNumber != null
                                            ? 'Roll #${effectiveChild.rollNumber}'
                                            : 'Adm #${effectiveChild.admissionNo}',
                                        style: TextStyle(
                                          color: colorScheme.primary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' • ${effectiveChild.house ?? "Campus Main"}',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Profile arrow
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
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Modules 2x Grid
            Text(
              'Academic & School Modules',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

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
                  'Today\'s Schedule',
                  Icons.schedule,
                  'Active',
                  AppColors.primaryFixed.withValues(alpha: 0.6),
                  colorScheme.primary,
                  colorScheme.secondaryContainer.withValues(alpha: 0.7),
                  colorScheme.onSecondaryContainer,
                  theme,
                  colorScheme,
                  onTap: () => context.go('/parent/timetable'),
                ),
                _buildGridItem(
                  'Attendance',
                  effectiveChild != null && effectiveChild.attendancePct > 0
                      ? '${effectiveChild.attendancePct}% Rate'
                      : 'Records & Log',
                  Icons.event_available,
                  'Attendance',
                  colorScheme.secondaryContainer.withValues(alpha: 0.6),
                  colorScheme.onSecondaryContainer,
                  colorScheme.secondaryContainer,
                  colorScheme.onSecondaryContainer,
                  theme,
                  colorScheme,
                  onTap: () => context.push('/parent/more/attendance'),
                ),
                _buildGridItem(
                  'Homework',
                  'Assignments & Tasks',
                  Icons.menu_book,
                  'Tasks',
                  AppColors.tertiaryFixed.withValues(alpha: 0.7),
                  colorScheme.tertiary,
                  AppColors.tertiaryFixed,
                  colorScheme.tertiary,
                  theme,
                  colorScheme,
                  onTap: () => context.push('/parent/more/homework'),
                ),
                _buildGridItem(
                  'Exams & Results',
                  'Schedule & Report Cards',
                  Icons.assignment,
                  'Exams',
                  AppColors.primaryFixed.withValues(alpha: 0.8),
                  colorScheme.primaryContainer,
                  colorScheme.surfaceContainerHigh,
                  colorScheme.primary,
                  theme,
                  colorScheme,
                  onTap: () => context.go('/parent/exams'),
                ),
                _buildGridItem(
                  'Fees & Dues',
                  'Invoices & Payments',
                  Icons.account_balance_wallet,
                  'Fees',
                  colorScheme.errorContainer.withValues(alpha: 0.7),
                  colorScheme.error,
                  colorScheme.errorContainer,
                  colorScheme.onErrorContainer,
                  theme,
                  colorScheme,
                  onTap: () => context.push('/parent/dashboard/fees'),
                ),
                _buildGridItem(
                  'Leave',
                  'Apply Leave',
                  Icons.event_busy,
                  'Active',
                  AppColors.secondaryFixed.withValues(alpha: 0.8),
                  colorScheme.onSecondaryContainer,
                  colorScheme.secondaryContainer,
                  colorScheme.onSecondaryContainer,
                  theme,
                  colorScheme,
                  onTap: () => context.push('/parent/more/leave'),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // List items
            _buildListItem(
              'PTM (Parent-Teacher Meeting)',
              'Upcoming Parent Interaction',
              Icons.groups,
              'Upcoming',
              theme,
              colorScheme,
              onTap: () => context.push('/parent/more/ptm'),
            ),
            const SizedBox(height: 10),
            _buildListItem(
              'Calendar',
              'Holidays & School Events',
              Icons.calendar_month,
              null,
              theme,
              colorScheme,
              onTap: () => context.push('/parent/more/calendar'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(
    String title,
    String subtitle,
    IconData icon,
    String? badge,
    Color bgGradientStart,
    Color iconColor,
    Color badgeBg,
    Color badgeTextColor,
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
          border: Border.all(
            color: colorScheme.outlineVariant.withValues(alpha: 0.15),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.02),
              blurRadius: 6,
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
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: bgGradientStart,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: iconColor, size: 20),
                ),
                if (badge != null)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: badgeBg,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      badge,
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                        color: badgeTextColor,
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
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontSize: 10,
                  ),
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
    String? badge,
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
          border: Border.all(
            color: colorScheme.outlineVariant.withValues(alpha: 0.15),
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: colorScheme.primary, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            if (badge != null)
              Container(
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  badge,
                  style: theme.textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            Icon(Icons.chevron_right, color: colorScheme.outlineVariant, size: 20),
          ],
        ),
      ),
    );
  }
}
