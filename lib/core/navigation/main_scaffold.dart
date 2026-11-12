import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../theme/app_colors.dart';

class MainScaffold extends ConsumerStatefulWidget {
  final Widget child;

  const MainScaffold({super.key, required this.child});

  @override
  ConsumerState<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends ConsumerState<MainScaffold> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).matchedLocation;
    if (location.startsWith('/attendance')) return 1;
    if (location.startsWith('/fees')) return 2;
    return 0; // Default to Dashboard
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/attendance');
        break;
      case 2:
        context.go('/fees');
        break;
      case 3:
        _scaffoldKey.currentState?.openEndDrawer();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _calculateSelectedIndex(context);

    return Scaffold(
      key: _scaffoldKey,
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex == 3
            ? 0
            : currentIndex, // Keep visual selection when drawer opens
        onDestinationSelected: (index) => _onItemTapped(index, context),
        backgroundColor: Colors.white,
        elevation: 10,
        indicatorColor: AppColors.primaryContainer.withOpacity(0.2),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.how_to_reg_outlined),
            selectedIcon: Icon(Icons.how_to_reg),
            label: 'Attendance',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_balance_wallet_outlined),
            selectedIcon: Icon(Icons.account_balance_wallet),
            label: 'Fees',
          ),
          NavigationDestination(icon: Icon(Icons.menu), label: 'Menu'),
        ],
      ),
      endDrawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: AppColors.primary),
                accountName: const Text('Admin User'),
                accountEmail: const Text('admin@schooly.com'),
                currentAccountPicture: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.school, color: AppColors.primary),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    _DrawerItem(
                      icon: Icons.people_outline,
                      title: 'Students',
                      onTap: () {},
                    ),
                    _DrawerItem(
                      icon: Icons.badge_outlined,
                      title: 'HR & Staff',
                      onTap: () {},
                    ),
                    _DrawerItem(
                      icon: Icons.school_outlined,
                      title: 'Academics',
                      onTap: () {},
                    ),
                    _DrawerItem(
                      icon: Icons.grading_outlined,
                      title: 'Exams & Results',
                      onTap: () {},
                    ),
                    _DrawerItem(
                      icon: Icons.meeting_room_outlined,
                      title: 'Front Office',
                      onTap: () {},
                    ),
                    const Divider(),
                    _DrawerItem(
                      icon: Icons.account_balance_outlined,
                      title: 'Income & Expense',
                      onTap: () {},
                    ),
                    _DrawerItem(
                      icon: Icons.chat_outlined,
                      title: 'Communication',
                      onTap: () {},
                    ),
                    _DrawerItem(
                      icon: Icons.settings_outlined,
                      title: 'Settings',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.onSurfaceVariant),
      title: Text(title, style: Theme.of(context).textTheme.titleSmall),
      onTap: () {
        Scaffold.of(context).closeEndDrawer();
        onTap();
      },
    );
  }
}
