import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/exam_api.dart';
import '../data/models/exam_models.dart';

part 'exam_provider.g.dart';

@riverpod
Future<List<ExamScheduleResponse>> timetable(
  TimetableRef ref, {
  int? examSetupId,
}) async {
  final api = ref.watch(examApiProvider);
  return api.getTimetable(examSetupId: examSetupId);
}

@riverpod
Future<AdmitCardPreviewResponse> admitCard(
  AdmitCardRef ref,
  int examSetupId,
) async {
  final api = ref.watch(examApiProvider);
  return api.getAdmitCard(examSetupId);
}

@riverpod
Future<List<StudentReportCardResponse>> results(ResultsRef ref) async {
  final api = ref.watch(examApiProvider);
  return api.getResults();
}
