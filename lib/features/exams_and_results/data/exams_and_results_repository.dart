import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_client.dart';

final examsAndResultsRepositoryProvider = Provider<ExamsAndResultsRepository>((
  ref,
) {
  return ExamsAndResultsRepository(ref.watch(dioProvider));
});

class ExamsAndResultsRepository {
  final Dio _dio;

  ExamsAndResultsRepository(this._dio);

  // Exam Setups
  Future<List<dynamic>> getExamSetups(String schoolId) async {
    final response = await _dio.get(
      '/api/v1/admin/exams/setups',
      queryParameters: {'schoolId': schoolId},
    );
    return (response.data['data'] ?? response.data) as List<dynamic>;
  }

  Future<dynamic> createExamSetup(Map<String, dynamic> data) async {
    final response = await _dio.post('/api/v1/admin/exams/setups', data: data);
    return response.data['data'] ?? response.data;
  }

  // Exam Terms
  Future<List<dynamic>> getExamTerms(String schoolId) async {
    final response = await _dio.get(
      '/api/v1/admin/exams/terms',
      queryParameters: {'schoolId': schoolId},
    );
    return (response.data['data'] ?? response.data) as List<dynamic>;
  }

  Future<dynamic> createExamTerm(Map<String, dynamic> data) async {
    final response = await _dio.post('/api/v1/admin/exams/terms', data: data);
    return response.data['data'] ?? response.data;
  }

  Future<dynamic> updateExamTerm(int id, Map<String, dynamic> data) async {
    final response = await _dio.put('/api/v1/admin/exams/terms/$id', data: data);
    return response.data['data'] ?? response.data;
  }

  Future<void> deleteExamTerm(int id) async {
    await _dio.delete('/api/v1/admin/exams/terms/$id');
  }


  // Exam Schedules
  Future<List<dynamic>> getExamSchedules(
    String schoolId, {
    String? examId,
  }) async {
    final Map<String, dynamic> params = {'schoolId': schoolId};
    if (examId != null) params['examId'] = examId;
    final response = await _dio.get(
      '/api/v1/admin/exams/schedules',
      queryParameters: params,
    );
    return (response.data['data'] ?? response.data) as List<dynamic>;
  }

  Future<dynamic> createExamSchedule(Map<String, dynamic> data) async {
    final response = await _dio.post(
      '/api/v1/admin/exams/schedules',
      data: data,
    );
    return response.data['data'] ?? response.data;
  }

  Future<void> deleteExamSchedule(int id) async {
    await _dio.delete('/api/v1/admin/exams/schedules/$id');
  }

  // Exam Marks
  Future<List<dynamic>> getExamMarks(
    String schoolId, {
    String? examId,
    String? classId,
    String? sectionId,
  }) async {
    final Map<String, dynamic> params = {'schoolId': schoolId};
    if (examId != null) params['examId'] = examId;
    if (classId != null) params['classId'] = classId;
    if (sectionId != null) params['sectionId'] = sectionId;

    final response = await _dio.get(
      '/api/v1/admin/exams/marks',
      queryParameters: params,
    );
    return (response.data['data'] ?? response.data) as List<dynamic>;
  }

  Future<dynamic> createExamMarks(Map<String, dynamic> data) async {
    final response = await _dio.post('/api/v1/admin/exams/marks', data: data);
    return response.data['data'] ?? response.data;
  }

  // Exam Grades
  Future<List<dynamic>> getExamGrades(String schoolId) async {
    final response = await _dio.get(
      '/api/v1/admin/exams/grades',
      queryParameters: {'schoolId': schoolId},
    );
    return (response.data['data'] ?? response.data) as List<dynamic>;
  }

  Future<dynamic> createExamGrade(Map<String, dynamic> data) async {
    final response = await _dio.post('/api/v1/admin/exams/grades', data: data);
    return response.data['data'] ?? response.data;
  }

  Future<void> deleteExamGrade(int id) async {
    await _dio.delete('/api/v1/admin/exams/grades/$id');
  }

  // Divisions
  Future<List<dynamic>> getExamDivisions(String schoolId) async {
    final response = await _dio.get('/api/v1/admin/exams/divisions', queryParameters: {'schoolId': schoolId});
    return (response.data['data'] ?? response.data) as List<dynamic>;
  }

  Future<dynamic> createExamDivision(Map<String, dynamic> data) async {
    final response = await _dio.post('/api/v1/admin/exams/divisions', data: data);
    return response.data['data'] ?? response.data;
  }

  // Admit Cards
  Future<List<dynamic>> getExamAdmitCards(String schoolId, {String? examId, String? classId}) async {
    final Map<String, dynamic> params = {'schoolId': schoolId};
    if (examId != null && examId.isNotEmpty) params['examId'] = examId;
    if (classId != null && classId.isNotEmpty) params['classId'] = classId;
    
    final response = await _dio.get('/api/v1/admin/exams/admit-cards', queryParameters: params);
    return (response.data['data'] ?? response.data) as List<dynamic>;
  }

  Future<dynamic> generateAdmitCards(Map<String, dynamic> data) async {
    final response = await _dio.post('/api/v1/admin/exams/admit-cards/generate', data: data);
    return response.data['data'] ?? response.data;
  }

  // Workspace V2 Overview
  Future<dynamic> getExamWorkspaceOverview(int examId, String schoolId) async {
    final response = await _dio.get(
      '/api/v1/admin/exams/setups/$examId/workspace/overview',
      queryParameters: {'schoolId': schoolId},
    );
    return response.data['data'] ?? response.data;
  }

  // Workspace V2 Subjects
  Future<List<dynamic>> getExamWorkspaceSubjects(int examId, String schoolId) async {
    final response = await _dio.get(
      '/api/v1/admin/exams/setups/$examId/workspace/subjects',
      queryParameters: {'schoolId': schoolId},
    );
    return (response.data['data'] ?? response.data) as List<dynamic>;
  }

  // Workspace V2 Classes/Applicability
  Future<List<dynamic>> getExamWorkspaceApplicabilities(int examId, String schoolId) async {
    final response = await _dio.get(
      '/api/v1/admin/exams/setups/$examId/workspace/applicability',
      queryParameters: {'schoolId': schoolId},
    );
    return (response.data['data'] ?? response.data) as List<dynamic>;
  }

  // Workspace V2 Students
  Future<List<dynamic>> getExamWorkspaceStudents(int examId, String schoolId) async {
    final response = await _dio.get(
      '/api/v1/admin/exams/setups/$examId/workspace/students',
      queryParameters: {'schoolId': schoolId},
    );
    return (response.data['data'] ?? response.data) as List<dynamic>;
  }

  Future<void> updateStudentStatus(int examId, int studentId, String status, String schoolId, [String? remarks]) async {
    await _dio.put(
      '/api/v1/admin/exams/setups/$examId/workspace/students/$studentId/status',
      data: {'status': status, 'remarks': remarks},
      queryParameters: {'schoolId': schoolId},
    );
  }

  Future<void> addExamSubjects(int examId, List<int> subjectIds, String schoolId) async {
    await _dio.post(
      '/api/v1/admin/exams/setups/$examId/workspace/subjects',
      data: {'subjectIds': subjectIds},
      queryParameters: {'schoolId': schoolId},
    );
  }

  Future<void> removeExamSubject(int examId, int configId, String schoolId) async {
    await _dio.delete(
      '/api/v1/admin/exams/setups/$examId/workspace/subjects/$configId',
      queryParameters: {'schoolId': schoolId},
    );
  }

  Future<void> updateExamSubjectConfig(int examId, int configId, Map<String, dynamic> data, String schoolId) async {
    await _dio.put(
      '/api/v1/admin/exams/setups/$examId/workspace/subjects/$configId',
      data: data,
      queryParameters: {'schoolId': schoolId},
    );
  }

  Future<void> syncExamApplicabilities(int examId, List<Map<String, dynamic>> applicabilities, String schoolId) async {
    await _dio.post(
      '/api/v1/admin/exams/setups/$examId/workspace/applicability',
      data: {'applicabilities': applicabilities},
      queryParameters: {'schoolId': schoolId},
    );
  }
}

