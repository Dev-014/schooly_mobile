import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'tabs/exam_overview_tab.dart';
import 'tabs/exam_subjects_tab.dart';
import 'tabs/exam_classes_tab.dart';
import 'tabs/exam_students_tab.dart';
import 'tabs/exam_schedule_tab.dart';
import 'tabs/exam_attendance_tab.dart';
import 'tabs/exam_marks_tab.dart';
import 'tabs/exam_results_tab.dart';

class ExamWorkspaceScreen extends StatelessWidget {
  final String examId;
  const ExamWorkspaceScreen({super.key, required this.examId});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DefaultTabController(
      length: 8,
      child: Scaffold(
        backgroundColor: theme.colorScheme.surface,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.pop(),
          ),
          title: Text(
            'Exam Workspace',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          backgroundColor: theme.colorScheme.surface,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: TabBar(
              isScrollable: true,
              dividerColor: Colors.transparent,
              indicatorColor: theme.colorScheme.primary,
              indicatorWeight: 3,
              labelColor: theme.colorScheme.primary,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelColor: theme.colorScheme.onSurfaceVariant,
              tabAlignment: TabAlignment.start,
              tabs: const [
                Tab(text: 'Overview'),
                Tab(text: 'Subjects'),
                Tab(text: 'Classes & Sections'),
                Tab(text: 'Students'),
                Tab(text: 'Schedule'),
                Tab(text: 'Attendance'),
                Tab(text: 'Marks'),
                Tab(text: 'Results'),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            ExamOverviewTab(examId: examId),
            ExamSubjectsTab(examId: examId),
            ExamClassesTab(examId: examId),
            ExamStudentsTab(examId: examId),
            ExamScheduleTab(examId: examId),
            ExamAttendanceTab(examId: examId),
            ExamMarksTab(examId: examId),
            ExamResultsTab(examId: examId),
          ],
        ),
      ),
    );
  }
}
