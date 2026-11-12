import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ParentShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const ParentShell({super.key, required this.navigationShell});

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: navigationShell,
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(top: 24),
        child: FloatingActionButton(
          onPressed: () {
            // Trigger Ask AI for parent
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
              _NavBarItem(
                icon: Icons.home_outlined,
                selectedIcon: Icons.home,
                label: 'Home',
                isSelected: navigationShell.currentIndex == 0,
                onTap: () => _goBranch(0),
                colorScheme: colorScheme,
              ),
              _NavBarItem(
                icon: Icons.calendar_today_outlined,
                selectedIcon: Icons.calendar_today,
                label: 'Timetable',
                isSelected: navigationShell.currentIndex == 1,
                onTap: () => _goBranch(1),
                colorScheme: colorScheme,
              ),
              const SizedBox(width: 48), // Space for FAB
              _NavBarItem(
                icon: Icons.assignment_outlined,
                selectedIcon: Icons.assignment,
                label: 'Exams',
                isSelected: navigationShell.currentIndex == 2,
                onTap: () => _goBranch(2),
                colorScheme: colorScheme,
              ),
              _NavBarItem(
                icon: Icons.grid_view_outlined,
                selectedIcon: Icons.grid_view,
                label: 'More',
                isSelected: navigationShell.currentIndex == 3,
                onTap: () => _goBranch(3),
                colorScheme: colorScheme,
              ),
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
        : colorScheme.onSurfaceVariant.withValues(alpha: 0.8);

    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: SizedBox(
        width: 60, // Fixed width to ensure even spacing
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: isSelected
                    ? colorScheme.primaryContainer.withValues(alpha: 0.5)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                isSelected ? selectedIcon : icon,
                color: color,
                size: 24,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
