import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../../core/network/api_client.dart';
import 'models/exam_models.dart';

part 'exam_api.g.dart';

@riverpod
ExamApi examApi(ExamApiRef ref) {
  return ExamApi(ref.watch(dioProvider));
}

class ExamApi {
  final Dio _dio;

  ExamApi(this._dio);

  Future<List<ExamScheduleResponse>> getTimetable({int? examSetupId}) async {
    final response = await _dio.get(
      '/student/exams/timetable',
      queryParameters: {if (examSetupId != null) 'examSetupId': examSetupId},
    );
    final List data = response.data['data'];
    return data.map((e) => ExamScheduleResponse.fromJson(e)).toList();
  }

  Future<AdmitCardPreviewResponse> getAdmitCard(int examSetupId) async {
    final response = await _dio.get(
      '/student/exams/admit-card',
      queryParameters: {'examSetupId': examSetupId},
    );
    return AdmitCardPreviewResponse.fromJson(response.data['data']);
  }

  Future<List<StudentReportCardResponse>> getResults() async {
    final response = await _dio.get('/api/v1/student/exams/results');
    final List data = response.data['data'];
    return data.map((e) => StudentReportCardResponse.fromJson(e)).toList();
  }
}
