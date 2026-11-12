import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../auth/providers/auth_provider.dart';
import '../data/exams_and_results_repository.dart';

final examSetupsProvider = FutureProvider<List<dynamic>>((ref) async {
  final user = ref.watch(authProvider);
  if (user?.schoolId == null) return [];
  final repo = ref.watch(examsAndResultsRepositoryProvider);
  return repo.getExamSetups(user!.schoolId!.toString());
});

final examTermsProvider = FutureProvider<List<dynamic>>((ref) async {
  final user = ref.watch(authProvider);
  if (user?.schoolId == null) return [];
  final repo = ref.watch(examsAndResultsRepositoryProvider);
  return repo.getExamTerms(user!.schoolId!.toString());
});

final examSchedulesProvider = FutureProvider.family<List<dynamic>, String>((ref, examId) async {
  final user = ref.watch(authProvider);
  if (user?.schoolId == null) return [];
  final repo = ref.watch(examsAndResultsRepositoryProvider);
  return repo.getExamSchedules(
    user!.schoolId!.toString(),
    examId: examId.isNotEmpty ? examId : null,
  );
});

typedef ExamMarksParams = ({String? examId, String? classId, String? sectionId});

final examMarksProvider = FutureProvider.family<List<dynamic>, ExamMarksParams>((ref, params) async {
  final user = ref.watch(authProvider);
  if (user?.schoolId == null) return [];
  final repo = ref.watch(examsAndResultsRepositoryProvider);
  
  return repo.getExamMarks(
    user!.schoolId!.toString(),
    examId: params.examId,
    classId: params.classId,
    sectionId: params.sectionId,
  );
});

final examGradesProvider = FutureProvider<List<dynamic>>((ref) async {
  final user = ref.watch(authProvider);
  if (user?.schoolId == null) return [];
  final repo = ref.watch(examsAndResultsRepositoryProvider);
  return repo.getExamGrades(user!.schoolId!.toString());
});

final examDivisionsProvider = FutureProvider<List<dynamic>>((ref) async {
  final user = ref.watch(authProvider);
  if (user?.schoolId == null) return [];
  final repo = ref.watch(examsAndResultsRepositoryProvider);
  return repo.getExamDivisions(user!.schoolId!.toString());
});

typedef ExamAdmitCardParams = ({String? examId, String? classId});

final examAdmitCardsProvider = FutureProvider.family<List<dynamic>, ExamAdmitCardParams>((ref, params) async {
  final user = ref.watch(authProvider);
  if (user?.schoolId == null) return [];
  final repo = ref.watch(examsAndResultsRepositoryProvider);
  return repo.getExamAdmitCards(
    user!.schoolId!.toString(),
    examId: params.examId,
    classId: params.classId,
  );
});

final examWorkspaceOverviewProvider = FutureProvider.family<dynamic, int>((ref, examId) async {
  final user = ref.watch(authProvider);
  if (user?.schoolId == null) return null;
  final repo = ref.watch(examsAndResultsRepositoryProvider);
  return repo.getExamWorkspaceOverview(examId, user!.schoolId!.toString());
});

final examWorkspaceSubjectsProvider = FutureProvider.family<List<dynamic>, int>((ref, examId) async {
  final user = ref.watch(authProvider);
  if (user?.schoolId == null) return [];
  final repo = ref.watch(examsAndResultsRepositoryProvider);
  return repo.getExamWorkspaceSubjects(examId, user!.schoolId!.toString());
});

final examWorkspaceApplicabilitiesProvider = FutureProvider.family<List<dynamic>, int>((ref, examId) async {
  final user = ref.watch(authProvider);
  if (user?.schoolId == null) return [];
  final repo = ref.watch(examsAndResultsRepositoryProvider);
  return repo.getExamWorkspaceApplicabilities(examId, user!.schoolId!.toString());
});

final examWorkspaceStudentsProvider = FutureProvider.family<List<dynamic>, int>((ref, examId) async {
  final user = ref.watch(authProvider);
  if (user?.schoolId == null) return [];
  final repo = ref.watch(examsAndResultsRepositoryProvider);
  return repo.getExamWorkspaceStudents(examId, user!.schoolId!.toString());
});
