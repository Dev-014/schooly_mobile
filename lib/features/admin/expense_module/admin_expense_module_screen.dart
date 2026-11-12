import 'package:flutter/material.dart';

import 'admin_add_expense_screen.dart';
import 'admin_search_expense_screen.dart';
import 'admin_expense_head_screen.dart';

class AdminExpenseModuleScreen extends StatelessWidget {
  const AdminExpenseModuleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Expense Module',
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
              Tab(text: 'Add Expense'),
              Tab(text: 'Search Expense'),
              Tab(text: 'Expense Head'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AdminAddExpenseScreen(),
            AdminSearchExpenseScreen(),
            AdminExpenseHeadScreen(),
          ],
        ),
      ),
    );
  }
}
