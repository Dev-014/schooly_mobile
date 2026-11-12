import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:schooly_mobile/core/network/api_client.dart';

part 'student_repository.g.dart';

@riverpod
StudentRepository studentRepository(Ref ref) {
  return StudentRepository(ref.watch(dioProvider));
}

class StudentRepository {
  final Dio _dio;

  StudentRepository(this._dio);

  Future<List<dynamic>> getCategories(String schoolId) async {
    final response = await _dio.get(
      '/api/student-categories',
      queryParameters: {'schoolId': schoolId},
    );
    return response.data['data'] ?? response.data;
  }

  Future<List<dynamic>> getHouses(String schoolId) async {
    final response = await _dio.get(
      '/api/student-houses',
      queryParameters: {'schoolId': schoolId},
    );
    return response.data['data'] ?? response.data;
  }

  Future<List<dynamic>> getClasses(String schoolId) async {
    final response = await _dio.get(
      '/api/classes',
      queryParameters: {'schoolId': schoolId},
    );
    return response.data['data'] ?? response.data;
  }

  Future<List<dynamic>> getSections(String schoolId, String classId) async {
    final response = await _dio.get(
      '/api/sections',
      queryParameters: {'schoolId': schoolId, 'classId': classId},
    );
    return response.data['data'] ?? response.data;
  }

  Future<List<dynamic>> getAcademicYears(String schoolId) async {
    final response = await _dio.get(
      '/api/academics/years',
      queryParameters: {'schoolId': schoolId},
    );
    return response.data['data'] ?? response.data;
  }

  Future<List<dynamic>> searchStudents(String schoolId, String query) async {
    final response = await _dio.get(
      '/api/students',
      queryParameters: {'schoolId': schoolId, 'search': query},
    );
    return response.data is List
        ? response.data
        : (response.data['data'] ?? []);
  }

  Future<List<dynamic>> searchFamilies(String query) async {
    final response = await _dio.get(
      '/api/families/search',
      queryParameters: {'q': query},
    );
    return response.data['data'] ?? response.data;
  }

  Future<dynamic> createFamily(String schoolId) async {
    final response = await _dio.post(
      '/api/families',
      data: {'schoolId': schoolId, 'status': 'ACTIVE'},
    );
    return response.data['data'] ?? response.data;
  }

  Future<dynamic> checkDuplicatePhone(String phone) async {
    final response = await _dio.get(
      '/api/students/duplicate-check',
      queryParameters: {'phone': phone},
    );
    return response.data;
  }

  Future<dynamic> getParentByPhone(String phone) async {
    final response = await _dio.get(
      '/api/parents/by-phone',
      queryParameters: {'phone': phone},
    );
    return response.data;
  }

  Future<dynamic> resolvePincode(String pincode) async {
    final response = await _dio.get('/api/location/pincode/$pincode');
    return response.data;
  }

  Future<void> createStudent(Map<String, dynamic> data) async {
    await _dio.post('/api/students', data: data);
  }

  Future<dynamic> createCategory(Map<String, dynamic> data) async {
    final response = await _dio.post('/api/student-categories', data: data);
    return response.data['data'] ?? response.data;
  }

  Future<dynamic> updateCategory(String id, Map<String, dynamic> data) async {
    final response = await _dio.put('/api/student-categories/$id', data: data);
    return response.data['data'] ?? response.data;
  }

  Future<void> deleteCategory(String id, String schoolId) async {
    await _dio.delete(
      '/api/student-categories/$id',
      queryParameters: {'schoolId': schoolId},
    );
  }

  Future<dynamic> createHouse(Map<String, dynamic> data) async {
    final response = await _dio.post('/api/student-houses', data: data);
    return response.data['data'] ?? response.data;
  }

  Future<dynamic> updateHouse(String id, Map<String, dynamic> data) async {
    final response = await _dio.put('/api/student-houses/$id', data: data);
    return response.data['data'] ?? response.data;
  }

  Future<void> deleteHouse(String id, String schoolId) async {
    await _dio.delete(
      '/api/student-houses/$id',
      queryParameters: {'schoolId': schoolId},
    );
  }

  Future<List<dynamic>> getOnlineAdmissions(String schoolId) async {
    final response = await _dio.get(
      '/api/online-admissions',
      queryParameters: {'schoolId': schoolId},
    );
    return (response.data['data'] ?? response.data) as List<dynamic>;
  }

  Future<dynamic> updateOnlineAdmissionStatus(
    String id,
    String status,
    String schoolId,
  ) async {
    final response = await _dio.patch(
      '/api/online-admissions/$id/status',
      data: {'status': status},
      queryParameters: {'schoolId': schoolId},
    );
    return response.data['data'] ?? response.data;
  }

  Future<List<dynamic>> getStudents(String schoolId) async {
    final response = await _dio.get(
      '/api/students',
      queryParameters: {'schoolId': schoolId},
    );
    return (response.data['data'] ?? response.data) as List<dynamic>;
  }

  Future<List<dynamic>> getReferrals(String schoolId) async {
    final response = await _dio.get(
      '/api/student-referrals',
      queryParameters: {'schoolId': schoolId},
    );
    return (response.data['data'] ?? response.data) as List<dynamic>;
  }

  Future<dynamic> createReferral(Map<String, dynamic> data) async {
    final response = await _dio.post('/api/student-referrals', data: data);
    return response.data['data'] ?? response.data;
  }

  Future<List<dynamic>> getSiblings(
    String primaryStudentId,
    String schoolId,
  ) async {
    final response = await _dio.get(
      '/api/student-siblings/$primaryStudentId',
      queryParameters: {'schoolId': schoolId},
    );
    return (response.data['data'] ?? response.data) as List<dynamic>;
  }

  Future<dynamic> linkSibling(Map<String, dynamic> data) async {
    final response = await _dio.post('/api/student-siblings', data: data);
    return response.data['data'] ?? response.data;
  }

  Future<void> unlinkSibling(String id, String schoolId) async {
    await _dio.delete(
      '/api/student-siblings/$id',
      queryParameters: {'schoolId': schoolId},
    );
  }

  Future<Map<String, dynamic>> promoteStudents(
    Map<String, dynamic> data,
  ) async {
    final response = await _dio.post('/api/students/promote', data: data);
    return response.data;
  }
}
