import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_client.dart';

final frontOfficeRepositoryProvider = Provider<FrontOfficeRepository>((ref) {
  return FrontOfficeRepository(ref.watch(dioProvider));
});

class FrontOfficeRepository {
  final Dio _dio;

  FrontOfficeRepository(this._dio);

  // Enquiries
  Future<List<dynamic>> getEnquiries(String schoolId) async {
    final response = await _dio.get(
      '/api/v1/admin/front-office/enquiries',
      queryParameters: {'schoolId': schoolId},
    );
    return (response.data['data'] ?? response.data) as List<dynamic>;
  }

  // Visitors
  Future<List<dynamic>> getVisitors(String schoolId) async {
    final response = await _dio.get(
      '/api/v1/admin/front-office/visitors',
      queryParameters: {'schoolId': schoolId},
    );
    return (response.data['data'] ?? response.data) as List<dynamic>;
  }

  // Gate Passes
  Future<List<dynamic>> getGatePasses(String schoolId) async {
    final response = await _dio.get(
      '/api/v1/admin/front-office/gate-passes',
      queryParameters: {'schoolId': schoolId},
    );
    return (response.data['data'] ?? response.data) as List<dynamic>;
  }

  // Parcels Receive
  Future<List<dynamic>> getParcelsReceive(String schoolId) async {
    final response = await _dio.get(
      '/api/v1/admin/front-office/parcels/receive',
      queryParameters: {'schoolId': schoolId},
    );
    return (response.data['data'] ?? response.data) as List<dynamic>;
  }

  // Parcels Dispatch
  Future<List<dynamic>> getParcelsDispatch(String schoolId) async {
    final response = await _dio.get(
      '/api/v1/admin/front-office/parcels/dispatch',
      queryParameters: {'schoolId': schoolId},
    );
    return (response.data['data'] ?? response.data) as List<dynamic>;
  }

  // Complaints
  Future<List<dynamic>> getComplaints(String schoolId) async {
    final response = await _dio.get(
      '/api/v1/admin/front-office/complaints',
      queryParameters: {'schoolId': schoolId},
    );
    return (response.data['data'] ?? response.data) as List<dynamic>;
  }

  // Create endpoints
  Future<dynamic> createEnquiry(Map<String, dynamic> data) async {
    final response = await _dio.post(
      '/api/v1/admin/front-office/enquiries',
      data: data,
    );
    return response.data['data'] ?? response.data;
  }

  Future<dynamic> createVisitor(Map<String, dynamic> data) async {
    final response = await _dio.post(
      '/api/v1/admin/front-office/visitors',
      data: data,
    );
    return response.data['data'] ?? response.data;
  }

  Future<dynamic> createGatePass(Map<String, dynamic> data) async {
    final response = await _dio.post(
      '/api/v1/admin/front-office/gate-passes',
      data: data,
    );
    return response.data['data'] ?? response.data;
  }

  Future<dynamic> createParcelReceive(Map<String, dynamic> data) async {
    final response = await _dio.post(
      '/api/v1/admin/front-office/parcels/receive',
      data: data,
    );
    return response.data['data'] ?? response.data;
  }

  Future<dynamic> createParcelDispatch(Map<String, dynamic> data) async {
    final response = await _dio.post(
      '/api/v1/admin/front-office/parcels/dispatch',
      data: data,
    );
    return response.data['data'] ?? response.data;
  }

  Future<dynamic> createComplaint(Map<String, dynamic> data) async {
    final response = await _dio.post(
      '/api/v1/admin/front-office/complaints',
      data: data,
    );
    return response.data['data'] ?? response.data;
  }
}
