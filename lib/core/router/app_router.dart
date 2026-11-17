import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/providers/auth_provider.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/otp_screen.dart';
import '../../features/student/student_shell.dart';
import '../../features/student/dashboard/student_dashboard_screen.dart';
import '../../features/student/timetable/student_timetable_screen.dart';
import '../../features/student/exams/student_exams_screen.dart';
import '../../features/student/more/student_more_screen.dart';
import '../../features/student/profile/student_profile_screen.dart';
import '../../features/student/leave/student_leave_screen.dart';
import '../../features/student/leave/student_leave_hub_screen.dart';
import '../../features/student/attendance/student_attendance_screen.dart';
import '../../features/student/homework/student_homework_screen.dart';
import '../../features/student/calendar/student_calendar_screen.dart';

import '../../features/admin/admin_shell.dart';
import '../../features/admin/dashboard/admin_dashboard_screen.dart';
import '../../features/admin/student_module/admin_student_module_screen.dart';
import '../../features/admin/front_office_module/admin_front_office_module_screen.dart';
import '../../features/admin/finance_module/admin_finance_module_screen.dart';
import '../../features/admin/more/admin_more_screen.dart';
import '../../features/admin/academics_module/admin_academics_module_screen.dart';
import '../../features/admin/income_module/admin_income_module_screen.dart';
import '../../features/admin/expense_module/admin_expense_module_screen.dart';
import '../../features/exams_and_results/presentation/exams_and_results_module_screen.dart';
import '../../features/exams_and_results/presentation/workspace/exam_workspace_hub_screen.dart';
import '../../features/exams_and_results/presentation/workspace/exam_workspace_screen.dart';
import '../../features/exams_and_results/presentation/screens/term_setup_screen.dart';
import '../../features/exams_and_results/presentation/screens/marks_entry_screen.dart';
import '../../features/exams_and_results/presentation/screens/exam_schedule_screen.dart';
import '../../features/exams_and_results/presentation/screens/admit_card_screen.dart';
import '../../features/exams_and_results/presentation/screens/co_curricular_grades_screen.dart';
import '../../features/exams_and_results/presentation/screens/teacher_remarks_screen.dart';
import '../../features/exams_and_results/presentation/screens/grade_list_screen.dart';
import '../../features/exams_and_results/presentation/screens/division_setup_screen.dart';
import '../../features/exams_and_results/presentation/screens/exam_attendance_screen.dart';
import '../../features/exams_and_results/presentation/screens/report_card_screen.dart';
import '../../features/exams_and_results/presentation/screens/examination_reports_screen.dart';
import '../../features/exams_and_results/presentation/screens/report_generation_screen.dart';
import '../../features/teacher/teacher_shell.dart';
import '../../features/teacher/dashboard/teacher_dashboard_screen.dart';
import '../../features/teacher/homework/teacher_homework_screen.dart';
import '../../features/teacher/leave/teacher_leave_screen.dart';
import '../../features/teacher/leave/teacher_apply_leave_screen.dart';
import '../../features/teacher/payroll/teacher_payroll_screen.dart';
import '../../features/teacher/exam/teacher_exam_module_screen.dart';
import '../../features/teacher/exam/teacher_exam_attendance_screen.dart';
import '../../features/teacher/marks/teacher_marks_entry_screen.dart';
import '../../features/teacher/attendance/teacher_attendance_screen.dart';
import '../../features/teacher/attendance/teacher_my_attendance_screen.dart';
import '../../features/teacher/timetable/teacher_timetable_screen.dart';
import '../../features/teacher/more/teacher_more_screen.dart';
import '../../features/parent/parent_shell.dart';
import '../../features/parent/dashboard/parent_dashboard_screen.dart';
import '../../features/parent/exams/parent_exams_screen.dart';
import '../../features/parent/timetable/parent_timetable_screen.dart';
import '../../features/parent/more/parent_more_screen.dart';
import '../../features/parent/fees/parent_fees_screen.dart';
import '../../features/parent/attendance/parent_attendance_screen.dart';
import '../../features/parent/homework/parent_homework_screen.dart';
import '../../features/parent/ptm/parent_ptm_screen.dart';
import '../../features/parent/calendar/parent_calendar_screen.dart';
import '../../features/staff/staff_shell.dart';
import '../../features/staff/dashboard/staff_dashboard_screen.dart';

part 'app_router.g.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  final authUser = ref.watch(authProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/login',
    redirect: (context, state) {
      final isLoggedIn = authUser != null;
      final isLoggingIn =
          state.uri.path == '/login' || state.uri.path == '/otp';

      if (!isLoggedIn) {
        return isLoggingIn ? null : '/login';
      }

      if (isLoggingIn || state.uri.path == '/') {
        final role = authUser.role?.toUpperCase();
        if (role == 'ADMIN') return '/admin/dashboard';
        if (role == 'TEACHER') return '/teacher/dashboard';
        if (role == 'PARENT') return '/parent/dashboard';
        if (role == 'STAFF') return '/staff/dashboard';
        return '/student/dashboard'; // Default
      }

      return null;
    },
    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(
        path: '/otp',
        builder: (context, state) {
          final phone = state.extra as String? ?? '';
          return OtpScreen(phone: phone);
        },
      ),
      GoRoute(
        path: '/exams-and-results',
        builder: (context, state) => const ExamsAndResultsModuleScreen(),
        routes: [
          GoRoute(path: 'terms', builder: (c, s) => const TermSetupScreen()),
          GoRoute(path: 'marks', builder: (c, s) => const MarksEntryScreen()),
          GoRoute(
            path: 'schedules',
            builder: (c, s) => const ExamScheduleScreen(),
          ),
          GoRoute(
            path: 'admit-cards',
            builder: (c, s) => const AdmitCardScreen(),
          ),
          GoRoute(
            path: 'co-curricular',
            builder: (c, s) => const CoCurricularGradesScreen(),
          ),
          GoRoute(
            path: 'remarks',
            builder: (c, s) => const TeacherRemarksScreen(),
          ),
          GoRoute(path: 'grades', builder: (c, s) => const GradeListScreen()),
          GoRoute(
            path: 'divisions',
            builder: (c, s) => const DivisionSetupScreen(),
          ),
          GoRoute(
            path: 'attendance',
            builder: (c, s) => const ExamAttendanceScreen(),
          ),
          GoRoute(
            path: 'report-cards',
            builder: (c, s) => const ReportCardScreen(),
          ),
          GoRoute(
            path: 'reports',
            builder: (c, s) => const ExaminationReportsScreen(),
          ),
          GoRoute(
            path: 'generate-reports',
            builder: (c, s) => const ReportGenerationScreen(),
          ),
          GoRoute(
            path: 'workspace-hub',
            builder: (c, s) => const ExamWorkspaceHubScreen(),
            routes: [
              GoRoute(
                path: ':examId',
                builder: (c, s) =>
                    ExamWorkspaceScreen(examId: s.pathParameters['examId']!),
              ),
            ],
          ),
        ],
      ),
      // STUDENT SHELL
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return StudentShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/student/dashboard',
                builder: (context, state) => const StudentDashboardScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/student/timetable',
                builder: (context, state) => const StudentTimetableScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/student/exams',
                builder: (context, state) => const StudentExamsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/student/more',
                builder: (context, state) => const StudentMoreScreen(),
              ),
              GoRoute(
                path: '/student/profile',
                builder: (context, state) => const StudentProfileScreen(),
              ),
              GoRoute(
                path: '/student/leave',
                builder: (context, state) => const StudentLeaveHubScreen(),
              ),
              GoRoute(
                path: '/student/leave/apply',
                builder: (context, state) => const StudentLeaveScreen(),
              ),
              GoRoute(
                path: '/student/attendance',
                builder: (context, state) => const StudentAttendanceScreen(),
              ),
              GoRoute(
                path: '/student/homework',
                builder: (context, state) => const StudentHomeworkScreen(),
              ),
              GoRoute(
                path: '/student/calendar',
                builder: (context, state) => const StudentCalendarScreen(),
              ),
            ],
          ),
        ],
      ),
      // ADMIN SHELL
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AdminShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/admin/dashboard',
                builder: (context, state) => const AdminDashboardScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/admin/front-office',
                builder: (context, state) =>
                    const AdminFrontOfficeModuleScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/admin/student',
                builder: (context, state) => const AdminStudentModuleScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/admin/finance',
                builder: (context, state) => const AdminFinanceModuleScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/admin/more',
                builder: (context, state) => const AdminMoreScreen(),
                routes: [
                  GoRoute(
                    path: 'academics',
                    builder: (context, state) =>
                        const AdminAcademicsModuleScreen(),
                  ),
                  GoRoute(
                    path: 'income',
                    builder: (context, state) =>
                        const AdminIncomeModuleScreen(),
                  ),
                  GoRoute(
                    path: 'expense',
                    builder: (context, state) =>
                        const AdminExpenseModuleScreen(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      // TEACHER SHELL
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return TeacherShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/teacher/dashboard',
                builder: (context, state) => const TeacherDashboardScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/teacher/classes',
                builder: (context, state) => const TeacherHomeworkScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/teacher/timetable',
                builder: (context, state) => const TeacherTimetableScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/teacher/more',
                builder: (context, state) => const TeacherMoreScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/teacher/attendance',
        builder: (context, state) => const TeacherAttendanceScreen(),
      ),
      GoRoute(
        path: '/teacher/my-attendance',
        builder: (context, state) => const TeacherMyAttendanceScreen(),
      ),
      GoRoute(
        path: '/teacher/leave',
        builder: (context, state) => const TeacherLeaveScreen(),
      ),
      GoRoute(
        path: '/teacher/apply-leave',
        builder: (context, state) => const TeacherApplyLeaveScreen(),
      ),
      GoRoute(
        path: '/teacher/payroll',
        builder: (context, state) => const TeacherPayrollScreen(),
      ),
      GoRoute(
        path: '/teacher/exam',
        builder: (context, state) => const TeacherExamModuleScreen(),
      ),
      GoRoute(
        path: '/teacher/exam-attendance',
        builder: (context, state) => const TeacherExamAttendanceScreen(),
      ),
      GoRoute(
        path: '/teacher/marks',
        builder: (context, state) => const TeacherMarksEntryScreen(),
      ),
      // PARENT SHELL
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ParentShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/parent/dashboard',
                builder: (context, state) => const ParentDashboardScreen(),
                routes: [
                  GoRoute(
                    path: 'fees',
                    builder: (context, state) => const ParentFeesScreen(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/parent/timetable',
                builder: (context, state) => const ParentTimetableScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/parent/exams',
                builder: (context, state) => const ParentExamsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/parent/more',
                builder: (context, state) => const ParentMoreScreen(),
                routes: [
                  GoRoute(
                    path: 'attendance',
                    builder: (context, state) => const ParentAttendanceScreen(),
                  ),
                  GoRoute(
                    path: 'homework',
                    builder: (context, state) => const ParentHomeworkScreen(),
                  ),
                  GoRoute(
                    path: 'ptm',
                    builder: (context, state) => const ParentPtmScreen(),
                  ),
                  GoRoute(
                    path: 'calendar',
                    builder: (context, state) => const ParentCalendarScreen(),
                  ),
                  GoRoute(
                    path: 'leave',
                    builder: (context, state) => const StudentLeaveHubScreen(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      // STAFF SHELL
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return StaffShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/staff/dashboard',
                builder: (context, state) => const StaffDashboardScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/staff/classes',
                builder: (context, state) =>
                    const Scaffold(body: Center(child: Text('Classes'))),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/staff/timetable',
                builder: (context, state) =>
                    const Scaffold(body: Center(child: Text('Timetable'))),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/staff/more',
                builder: (context, state) =>
                    const Scaffold(body: Center(child: Text('More'))),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
