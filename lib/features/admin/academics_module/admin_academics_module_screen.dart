import 'package:flutter/material.dart';
import 'package:schooly_mobile/features/admin/academics_module/admin_class_management_screen.dart';
import 'package:schooly_mobile/features/admin/academics_module/admin_section_management_screen.dart';
import 'package:schooly_mobile/features/admin/academics_module/admin_subject_management_screen.dart';
import 'package:schooly_mobile/features/admin/academics_module/admin_co_curricular_subjects_screen.dart';
import 'package:schooly_mobile/features/admin/academics_module/admin_assign_class_teacher_screen.dart';
import 'package:schooly_mobile/features/admin/academics_module/admin_promote_students_screen.dart';
import 'package:schooly_mobile/features/admin/academics_module/admin_academic_session_setting_screen.dart';

class AdminAcademicsModuleScreen extends StatelessWidget {
  const AdminAcademicsModuleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return DefaultTabController(
      length: 7,
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
                    Icons.auto_stories,
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
                    'Academics',
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
              Tab(text: 'Classes'),
              Tab(text: 'Sections'),
              Tab(text: 'Subjects'),
              Tab(text: 'Co-Curricular'),
              Tab(text: 'Class Teachers'),
              Tab(text: 'Promote'),
              Tab(text: 'Session Settings'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AdminClassManagementScreen(),
            AdminSectionManagementScreen(),
            AdminSubjectManagementScreen(),
            AdminCoCurricularSubjectsScreen(),
            AdminAssignClassTeacherScreen(),
            AdminPromoteStudentsScreen(),
            AdminAcademicSessionSettingScreen(),
          ],
        ),
      ),
    );
  }
}
