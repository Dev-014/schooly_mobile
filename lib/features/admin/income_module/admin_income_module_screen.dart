import 'package:flutter/material.dart';

import 'admin_add_income_screen.dart';
import 'admin_income_head_screen.dart';
import 'admin_search_income_screen.dart';

class AdminIncomeModuleScreen extends StatelessWidget {
  const AdminIncomeModuleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Income Module',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            indicatorColor: colorScheme.primary,
            labelColor: colorScheme.primary,
            unselectedLabelColor: colorScheme.onSurfaceVariant,
            tabs: const [
              Tab(text: 'Add Income'),
              Tab(text: 'Search Income'),
              Tab(text: 'Income Head'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AdminAddIncomeScreen(),
            AdminSearchIncomeScreen(),
            AdminIncomeHeadScreen(),
          ],
        ),
      ),
    );
  }
}
