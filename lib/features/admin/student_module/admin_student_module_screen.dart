import 'package:flutter/material.dart';

import 'admin_student_information_screen.dart';
import 'admin_student_admission_screen.dart';
import 'admin_online_admission_screen.dart';
import 'admin_student_houses_screen.dart';
import 'admin_student_reports_screen.dart';
import 'admin_link_sibling_screen.dart';
import 'admin_student_referral_screen.dart';
import 'admin_student_category_screen.dart';

class AdminStudentModuleScreen extends StatelessWidget {
  const AdminStudentModuleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DefaultTabController(
      length: 8,
      child: Scaffold(
        backgroundColor: theme.colorScheme.surface,
        appBar: AppBar(
          title: const Text(
            'Students',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          backgroundColor: theme.colorScheme.surface,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(bottom: 12),
              child: TabBar(
                isScrollable: true,
                dividerColor: Colors.transparent,
                indicator: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(24),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: theme.colorScheme.onPrimary,
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                unselectedLabelColor: theme.colorScheme.onSurfaceVariant,
                unselectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
                tabAlignment: TabAlignment.start,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                tabs: const [
                  Tab(text: 'Information'),
                  Tab(text: 'Admission'),
                  Tab(text: 'Online Adm'),
                  Tab(text: 'Houses'),
                  Tab(text: 'Reports'),
                  Tab(text: 'Link Sibling'),
                  Tab(text: 'Referral'),
                  Tab(text: 'Category'),
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            AdminStudentInformationScreen(),
            AdminStudentAdmissionScreen(),
            AdminOnlineAdmissionScreen(),
            AdminStudentHousesScreen(),
            AdminStudentReportsScreen(),
            AdminLinkSiblingScreen(),
            AdminStudentReferralScreen(),
            AdminStudentCategoryScreen(),
          ],
        ),
      ),
    );
  }
}
