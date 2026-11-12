import 'package:flutter/material.dart';

import 'admin_admission_enquiry_screen.dart';
import 'admin_visitor_book_screen.dart';
import 'admin_gate_pass_screen.dart';
import 'admin_parcel_receive_screen.dart';
import 'admin_parcel_dispatch_screen.dart';
import 'admin_complaints_screen.dart';

class AdminFrontOfficeModuleScreen extends StatelessWidget {
  const AdminFrontOfficeModuleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DefaultTabController(
      length: 8,
      child: Scaffold(
        backgroundColor: theme.colorScheme.surface,
        appBar: AppBar(
          title: const Text(
            'Front Office',
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
                  Tab(text: 'Admission Enquiry'),
                  Tab(text: 'Visitor Book'),
                  Tab(text: 'Gate Pass'),
                  Tab(text: 'Parcel Receive'),
                  Tab(text: 'Parcel Dispatch'),
                  Tab(text: 'Complaints'),
                  Tab(text: 'Entrance Exam'),
                  Tab(text: 'Setup Front Office'),
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            AdminAdmissionEnquiryScreen(),
            AdminVisitorBookScreen(),
            AdminGatePassScreen(),
            AdminParcelReceiveScreen(),
            AdminParcelDispatchScreen(),
            AdminComplaintsScreen(),
            Scaffold(body: Center(child: Text('Entrance Exam'))),
            Scaffold(body: Center(child: Text('Setup Front Office'))),
          ],
        ),
      ),
    );
  }
}
