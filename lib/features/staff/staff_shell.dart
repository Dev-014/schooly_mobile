import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/auth/permissions.dart';
import '../../core/auth/user_permissions.dart';
import '../auth/providers/auth_provider.dart';

class _BottomTab {
  final int index;
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final String? requiredPermission;

  _BottomTab({
    required this.index,
    required this.icon,
    required this.selectedIcon,
    required this.label,
    this.requiredPermission,
  });
}

class StaffShell extends ConsumerWidget {
  final StatefulNavigationShell navigationShell;

  const StaffShell({super.key, required this.navigationShell});

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final user = ref.watch(authProvider);

    final allTabs = [
      _BottomTab(
        index: 0,
        icon: Icons.dashboard_outlined,
        selectedIcon: Icons.dashboard,
        label: 'Home',
      ),
      _BottomTab(
        index: 1,
        icon: Icons.school_outlined,
        selectedIcon: Icons.school,
        label: 'Classes',
        requiredPermission: Permissions.homework.assignment.view,
      ),
      _BottomTab(
        index: 2,
        icon: Icons.calendar_month_outlined,
        selectedIcon: Icons.calendar_month,
        label: 'Timetable',
        requiredPermission: Permissions.academic.timetablePeriod.view,
      ),
      _BottomTab(
        index: 3,
        icon: Icons.widgets_outlined,
        selectedIcon: Icons.widgets,
        label: 'More',
      ),
    ];

    final visibleTabs = allTabs.where((tab) {
      if (tab.requiredPermission == null) return true;
      return user?.hasPermission(tab.requiredPermission!) ?? false;
    }).toList();

    return Scaffold(
      body: navigationShell,
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(top: 24),
        child: FloatingActionButton(
          onPressed: () {
            // Trigger Ask AI (you could add an extra route or a bottom sheet here)
          },
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          shape: const CircleBorder(),
          elevation: 4,
          child: const Icon(Icons.smart_toy, size: 28),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        color: colorScheme.surface.withValues(alpha: 0.95),
        elevation: 8,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (var i = 0; i < visibleTabs.length; i++) ...[
                if (i == visibleTabs.length ~/ 2)
                  const SizedBox(width: 48), // Space for FAB in middle
                _NavBarItem(
                  icon: visibleTabs[i].icon,
                  selectedIcon: visibleTabs[i].selectedIcon,
                  label: visibleTabs[i].label,
                  isSelected:
                      navigationShell.currentIndex == visibleTabs[i].index,
                  onTap: () => _goBranch(visibleTabs[i].index),
                  colorScheme: colorScheme,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final ColorScheme colorScheme;

  const _NavBarItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected
        ? colorScheme.primary
        : colorScheme.onSurfaceVariant;

    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(isSelected ? selectedIcon : icon, color: color, size: 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: color,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
