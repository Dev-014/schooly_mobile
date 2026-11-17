import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/parent_models.dart';
import '../data/parent_repository.dart';

/// Provider for list of linked children
final parentChildrenProvider = FutureProvider<List<ParentChild>>((ref) async {
  final repo = ref.watch(parentRepositoryProvider);
  return repo.getChildren();
});

/// StateNotifier to hold and manage the active selected child
class SelectedChildNotifier extends StateNotifier<ParentChild?> {
  SelectedChildNotifier() : super(null);

  bool get hasSelection => state != null;

  void selectChild(ParentChild child) {
    state = child;
  }
}

final selectedChildProvider = StateNotifierProvider<SelectedChildNotifier, ParentChild?>((ref) {
  final notifier = SelectedChildNotifier();

  // Auto-select first child when children list resolves
  ref.listen(parentChildrenProvider, (_, next) {
    next.whenData((children) {
      if (children.isNotEmpty && !notifier.hasSelection) {
        notifier.selectChild(children.first);
      }
    });
  });

  return notifier;
});

/// Fee summary for active child
final childFeeSummaryProvider = FutureProvider.family<ParentFeeSummary, int>((ref, studentId) async {
  final repo = ref.watch(parentRepositoryProvider);
  return repo.getChildFeeSummary(studentId);
});

/// Fee dues / invoices for active child
final childDuesProvider = FutureProvider.family<List<ParentFeeDue>, int>((ref, studentId) async {
  final repo = ref.watch(parentRepositoryProvider);
  return repo.getChildDues(studentId);
});

/// Payment history for active child
final childPaymentsProvider = FutureProvider.family<List<ParentPaymentRecord>, int>((ref, studentId) async {
  final repo = ref.watch(parentRepositoryProvider);
  return repo.getChildPayments(studentId);
});

/// Timetable parameter record
typedef TimetableParams = ({int studentId, int? schoolId, String? dayOfWeek});

/// Timetable for active child
final childTimetableProvider = FutureProvider.family<ParentTimetableResponse, TimetableParams>((ref, params) async {
  final repo = ref.watch(parentRepositoryProvider);
  return repo.getChildTimetable(
    studentId: params.studentId,
    schoolId: params.schoolId,
    dayOfWeek: params.dayOfWeek,
  );
});

/// Attendance parameter record
typedef AttendanceParams = ({int studentId, int? schoolId, String? startDate, String? endDate});

/// Attendance records for active child
final childAttendanceProvider = FutureProvider.family<List<ParentAttendanceRecord>, AttendanceParams>((ref, params) async {
  final repo = ref.watch(parentRepositoryProvider);
  return repo.getChildAttendance(
    studentId: params.studentId,
    schoolId: params.schoolId,
    startDate: params.startDate,
    endDate: params.endDate,
  );
});

/// Homework parameter record
typedef HomeworkParams = ({int studentId, int? schoolId});

/// Homework assignments for active child
final childHomeworkProvider = FutureProvider.family<List<ParentHomeworkAssignment>, HomeworkParams>((ref, params) async {
  final repo = ref.watch(parentRepositoryProvider);
  return repo.getChildHomework(
    studentId: params.studentId,
    schoolId: params.schoolId,
  );
});

/// School CMS events
final schoolEventsProvider = FutureProvider.family<List<ParentCmsEvent>, int?>((ref, schoolId) async {
  final repo = ref.watch(parentRepositoryProvider);
  return repo.getSchoolEvents(schoolId: schoolId);
});

/// Eligible exams for active child
final childEligibleExamsProvider = FutureProvider.family<List<dynamic>, int>((ref, studentId) async {
  final repo = ref.watch(parentRepositoryProvider);
  return repo.getChildEligibleExams(studentId);
});

/// Exam results / report cards for active child
final childExamResultsProvider = FutureProvider.family<List<dynamic>, int>((ref, studentId) async {
  final repo = ref.watch(parentRepositoryProvider);
  return repo.getChildExamResults(studentId);
});
