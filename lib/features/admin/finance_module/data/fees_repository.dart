import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_client.dart';

final feesRepositoryProvider = Provider<FeesRepository>((ref) {
  return FeesRepository(ref.watch(dioProvider));
});

class FeesRepository {
  final Dio _dio;

  FeesRepository(this._dio);

  List<dynamic> _extractList(dynamic data) {
    if (data == null) return [];
    if (data is List) return data;
    if (data is Map) {
      if (data.containsKey('content') && data['content'] is List) {
        return data['content'] as List<dynamic>;
      }
      if (data.containsKey('data') && data['data'] is List) {
        return data['data'] as List<dynamic>;
      }
    }
    return [];
  }

  Future<List<dynamic>> getCategories(String schoolId) async {
    final response = await _dio.get(
      '/api/v1/fee-masters/categories',
      queryParameters: {'schoolId': schoolId},
    );
    return _extractList(response.data);
  }

  Future<dynamic> createCategory(
    Map<String, dynamic> data,
    String schoolId,
  ) async {
    final response = await _dio.post(
      '/api/v1/fee-masters/categories',
      data: data,
      queryParameters: {'schoolId': schoolId},
    );
    return response.data['data'] ?? response.data;
  }

  Future<List<dynamic>> getStructures(String schoolId) async {
    final response = await _dio.get(
      '/api/v1/fee-masters/structures',
      queryParameters: {'schoolId': schoolId},
    );
    return _extractList(response.data);
  }

  Future<dynamic> createStructure(
    Map<String, dynamic> data,
    String schoolId,
  ) async {
    final response = await _dio.post(
      '/api/v1/fee-masters/structures',
      data: data,
      queryParameters: {'schoolId': schoolId},
    );
    return response.data['data'] ?? response.data;
  }

  Future<List<dynamic>> getCollectionPlans(String schoolId) async {
    final response = await _dio.get(
      '/api/v1/finance/collection-plans',
      queryParameters: {'schoolId': schoolId},
    );
    return _extractList(response.data);
  }

  Future<dynamic> createCollectionPlan(
    Map<String, dynamic> data,
    String schoolId,
  ) async {
    final response = await _dio.post(
      '/api/v1/finance/collection-plans',
      data: data,
      queryParameters: {'schoolId': schoolId},
    );
    return response.data['data'] ?? response.data;
  }

  Future<List<dynamic>> getFeeRecords(String schoolId) async {
    final response = await _dio.get(
      '/api/v1/finance/fee-records',
      queryParameters: {'schoolId': schoolId},
    );
    return _extractList(response.data);
  }

  Future<dynamic> getFeeStats(String schoolId) async {
    final response = await _dio.get(
      '/api/v1/finance/fee-records/stats',
      queryParameters: {'schoolId': schoolId},
    );
    return response.data['data'] ?? response.data;
  }

  Future<List<dynamic>> getStudentDues(
    String studentId,
    String schoolId, {
    String? status,
  }) async {
    final Map<String, dynamic> params = {'schoolId': schoolId};
    if (status != null) params['statuses'] = status;
    final response = await _dio.get(
      '/api/v1/finance/students/$studentId/dues',
      queryParameters: params,
    );
    return _extractList(response.data);
  }

  Future<List<dynamic>> getPayments(String schoolId) async {
    final response = await _dio.get(
      '/api/v1/finance/payments',
      queryParameters: {'schoolId': schoolId},
    );
    return _extractList(response.data);
  }
}
