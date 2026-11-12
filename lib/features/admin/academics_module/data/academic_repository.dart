import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_client.dart';

final academicRepositoryProvider = Provider(
  (ref) => AcademicRepository(ref.read(dioProvider)),
);

class AcademicRepository {
  final Dio _dio;

  AcademicRepository(this._dio);

  // --- Classes ---
  Future<List<Map<String, dynamic>>> getClasses() async {
    final response = await _dio.get('/api/classes');
    final data = response.data is List
        ? response.data
        : (response.data['data'] ?? response.data);
    return List<Map<String, dynamic>>.from(data);
  }

  Future<Map<String, dynamic>> createClass(Map<String, dynamic> data) async {
    final response = await _dio.post('/api/classes', data: data);
    return response.data;
  }

  Future<void> deleteClass(int id) async {
    await _dio.delete('/api/classes/$id');
  }

  // --- Sections ---
  Future<List<Map<String, dynamic>>> getSections() async {
    final response = await _dio.get('/api/academics/sections');
    final data = response.data is List
        ? response.data
        : (response.data['data'] ?? response.data);
    return List<Map<String, dynamic>>.from(data);
  }

  Future<Map<String, dynamic>> createSection(Map<String, dynamic> data) async {
    final response = await _dio.post('/api/academics/sections', data: data);
    return response.data;
  }

  Future<void> deleteSection(int id) async {
    await _dio.delete('/api/academics/sections/$id');
  }

  // --- Subjects ---
  Future<List<Map<String, dynamic>>> getSubjects() async {
    final response = await _dio.get('/api/academics/subjects');
    final data = response.data is List
        ? response.data
        : (response.data['data'] ?? response.data);
    return List<Map<String, dynamic>>.from(data);
  }

  Future<Map<String, dynamic>> createSubject(Map<String, dynamic> data) async {
    final response = await _dio.post('/api/academics/subjects', data: data);
    return response.data;
  }

  Future<void> deleteSubject(int id) async {
    await _dio.delete('/api/academics/subjects/$id');
  }

  // --- Academic Years ---
  Future<List<Map<String, dynamic>>> getAcademicYears() async {
    final response = await _dio.get('/api/academics/years');
    final data = response.data is List
        ? response.data
        : (response.data['data'] ?? response.data);
    return List<Map<String, dynamic>>.from(data);
  }

  Future<Map<String, dynamic>> createAcademicYear(
    Map<String, dynamic> data,
  ) async {
    final response = await _dio.post('/api/academics/years', data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> activateAcademicYear(int id) async {
    final response = await _dio.put('/api/academics/years/$id/activate');
    return response.data;
  }

  Future<void> deleteAcademicYear(int id) async {
    await _dio.delete('/api/academics/years/$id');
  }

  // --- Class Teacher Assignments ---
  Future<List<Map<String, dynamic>>> getClassTeacherAssignments() async {
    final response = await _dio.get('/api/academics/class-teachers');
    final data = response.data is List
        ? response.data
        : (response.data['data'] ?? response.data);
    return List<Map<String, dynamic>>.from(data);
  }

  Future<Map<String, dynamic>> assignClassTeacher(
    Map<String, dynamic> data,
  ) async {
    final response = await _dio.post(
      '/api/academics/class-teachers',
      data: data,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> updateAssignmentStatus(
    int id,
    String status,
  ) async {
    final response = await _dio.put(
      '/api/academics/class-teachers/$id/status',
      queryParameters: {'status': status},
    );
    return response.data;
  }

  // --- Staff ---
  Future<List<Map<String, dynamic>>> getStaff() async {
    final response = await _dio.get('/api/staff');
    final data = response.data is List
        ? response.data
        : (response.data['data'] ?? response.data);
    return List<Map<String, dynamic>>.from(data);
  }
}
