import 'package:flutter/material.dart';

import 'package:schooly_mobile/features/admin/finance_module/admin_fee_master_screen.dart';
import 'package:schooly_mobile/features/admin/finance_module/admin_collect_fees_screen.dart';
import 'package:schooly_mobile/features/admin/finance_module/admin_collection_plans_screen.dart';
import 'package:schooly_mobile/features/admin/finance_module/admin_search_due_fees_screen.dart';
import 'package:schooly_mobile/features/admin/finance_module/admin_due_fee_reminders_screen.dart';
import 'package:schooly_mobile/features/admin/finance_module/admin_payment_receipts_screen.dart';

class AdminFinanceModuleScreen extends StatelessWidget {
  const AdminFinanceModuleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          backgroundColor: colorScheme.surfaceContainerLowest,
          elevation: 0,
          scrolledUnderElevation: 0,
          toolbarHeight: 64,
          title: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.primary.withValues(alpha: 0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.school,
                    color: colorScheme.onPrimary,
                    size: 24,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SCHOOLY ADMIN',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    'Finance & Fees',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Badge(
                backgroundColor: colorScheme.error,
                smallSize: 8,
                child: Icon(
                  Icons.notifications_outlined,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              onPressed: () {},
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 8.0),
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.person,
                    color: colorScheme.onPrimaryContainer,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            indicator: BoxDecoration(
              color: colorScheme.primary,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primary.withValues(alpha: 0.25),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: const EdgeInsets.symmetric(
              horizontal: -16,
              vertical: 6,
            ),
            labelColor: colorScheme.onPrimary,
            labelStyle: theme.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelColor: colorScheme.onSurfaceVariant,
            unselectedLabelStyle: theme.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            padding: const EdgeInsets.only(left: 24, bottom: 8),
            labelPadding: const EdgeInsets.symmetric(horizontal: 24),
            dividerColor: Colors.transparent,
            tabs: const [
              Tab(text: 'Fee Master'),
              Tab(text: 'Collect Fees'),
              Tab(text: 'Collection Plans'),
              Tab(text: 'Search Due Fees'),
              Tab(text: 'Due Reminders'),
              Tab(text: 'Receipts'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AdminFeeMasterScreen(),
            AdminCollectFeesScreen(),
            AdminCollectionPlansScreen(),
            AdminSearchDueFeesScreen(),
            AdminDueFeeRemindersScreen(),
            AdminPaymentReceiptsScreen(),
          ],
        ),
      ),
    );
  }
}
