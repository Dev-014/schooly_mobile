import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/auth/permissions.dart';
import '../../core/auth/user_permissions.dart';
import '../auth/providers/auth_provider.dart';

class _AdminTab {
  final int index;
  final Widget icon;
  final Widget selectedIcon;
  final String label;
  final String? requiredPermission;

  _AdminTab({
    required this.index,
    required this.icon,
    required this.selectedIcon,
    required this.label,
    this.requiredPermission,
  });
}

class AdminShell extends ConsumerWidget {
  final StatefulNavigationShell navigationShell;
  const AdminShell({super.key, required this.navigationShell});

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider);

    final allTabs = [
      _AdminTab(
        index: 0,
        icon: const Icon(Icons.dashboard_outlined),
        selectedIcon: const Icon(Icons.dashboard),
        label: 'Dashboard',
      ),
      _AdminTab(
        index: 1,
        icon: const Icon(Icons.desk_outlined),
        selectedIcon: const Icon(Icons.desk),
        label: 'Front Office',
        requiredPermission: Permissions.frontOffice.visitorBook.view,
      ),
      _AdminTab(
        index: 2,
        icon: const Icon(Icons.school_outlined),
        selectedIcon: const Icon(Icons.school),
        label: 'Students',
        requiredPermission: Permissions.student.student.view,
      ),
      _AdminTab(
        index: 3,
        icon: const Icon(Icons.payments_outlined),
        selectedIcon: const Icon(Icons.payments),
        label: 'Finance',
        requiredPermission: Permissions.fees.feeInvoice.view,
      ),
      _AdminTab(
        index: 4,
        icon: const Icon(Icons.grid_view_outlined),
        selectedIcon: const Icon(Icons.grid_view),
        label: 'More',
      ),
    ];

    final visibleTabs = allTabs.where((tab) {
      if (tab.requiredPermission == null) return true;
      return user?.hasPermission(tab.requiredPermission!) ?? false;
    }).toList();

    // Map navigation shell index back to visible tab index
    int selectedIndex = 0;
    for (int i = 0; i < visibleTabs.length; i++) {
      if (visibleTabs[i].index == navigationShell.currentIndex) {
        selectedIndex = i;
        break;
      }
    }

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) => _goBranch(visibleTabs[index].index),
        destinations: visibleTabs
            .map(
              (tab) => NavigationDestination(
                icon: tab.icon,
                selectedIcon: tab.selectedIcon,
                label: tab.label,
              ),
            )
            .toList(),
      ),
    );
  }
}
