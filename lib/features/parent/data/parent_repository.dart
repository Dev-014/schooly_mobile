import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_client.dart';
import 'models/parent_models.dart';

final parentRepositoryProvider = Provider<ParentRepository>((ref) {
  return ParentRepository(ref.watch(dioProvider));
});

class ParentRepository {
  final Dio _dio;

  ParentRepository(this._dio);

  List<dynamic> _extractList(dynamic data) {
    if (data == null) return [];
    if (data is List) return data;
    if (data is Map) {
      if (data.containsKey('data') && data['data'] is List) {
        return data['data'] as List<dynamic>;
      }
      if (data.containsKey('content') && data['content'] is List) {
        return data['content'] as List<dynamic>;
      }
    }
    return [];
  }

  Map<String, dynamic> _extractMap(dynamic data) {
    if (data == null) return {};
    if (data is Map<String, dynamic>) {
      if (data.containsKey('data') && data['data'] is Map<String, dynamic>) {
        return data['data'] as Map<String, dynamic>;
      }
      return data;
    }
    return {};
  }

  /// 1. Fetch children linked to authenticated parent
  Future<List<ParentChild>> getChildren() async {
    final response = await _dio.get('/api/v1/parent/children');
    final list = _extractList(response.data);
    return list.map((e) => ParentChild.fromJson(e as Map<String, dynamic>)).toList();
  }

  /// 2. Fetch fee summary for active child
  Future<ParentFeeSummary> getChildFeeSummary(int studentId) async {
    final response = await _dio.get(
      '/api/v1/parent/fees/summary',
      queryParameters: {'studentId': studentId},
    );
    final map = _extractMap(response.data);
    return ParentFeeSummary.fromJson(map);
  }

  /// 3. Fetch active child dues / invoices
  Future<List<ParentFeeDue>> getChildDues(int studentId) async {
    final response = await _dio.get(
      '/api/v1/parent/fees/dues',
      queryParameters: {'studentId': studentId},
    );
    final list = _extractList(response.data);
    return list.map((e) => ParentFeeDue.fromJson(e as Map<String, dynamic>)).toList();
  }

  /// 4. Fetch active child payment receipts
  Future<List<ParentPaymentRecord>> getChildPayments(int studentId, {int page = 0, int size = 20}) async {
    final response = await _dio.get(
      '/api/v1/parent/fees/payments',
      queryParameters: {'studentId': studentId, 'page': page, 'size': size},
    );
    final list = _extractList(response.data);
    return list.map((e) => ParentPaymentRecord.fromJson(e as Map<String, dynamic>)).toList();
  }

  /// 5. Execute online fee payment
  Future<ParentPaymentRecord> executePayment({
    required int studentId,
    required int schoolId,
    required List<int> feeDueIds,
    required double totalAmount,
    required String paymentMethod,
  }) async {
    final response = await _dio.post(
      '/api/v1/finance/payments',
      data: {
        'studentId': studentId,
        'schoolId': schoolId,
        'feeDueIds': feeDueIds,
        'totalAmount': totalAmount,
        'paymentMethod': paymentMethod,
      },
    );
    final map = _extractMap(response.data);
    return ParentPaymentRecord.fromJson(map);
  }

  /// 6. Fetch timetable for child
  Future<ParentTimetableResponse> getChildTimetable({
    required int studentId,
    int? schoolId,
    String? dayOfWeek,
  }) async {
    final queryParams = <String, dynamic>{'studentId': studentId};
    if (schoolId != null) queryParams['schoolId'] = schoolId;
    if (dayOfWeek != null && dayOfWeek.isNotEmpty) queryParams['dayOfWeek'] = dayOfWeek;

    final response = await _dio.get(
      '/api/v1/student/timetable',
      queryParameters: queryParams,
    );
    final map = _extractMap(response.data);
    return ParentTimetableResponse.fromJson(map);
  }

  /// 7. Fetch attendance records for child
  Future<List<ParentAttendanceRecord>> getChildAttendance({
    required int studentId,
    int? schoolId,
    String? startDate,
    String? endDate,
  }) async {
    final queryParams = <String, dynamic>{'studentId': studentId};
    if (schoolId != null) queryParams['schoolId'] = schoolId;
    if (startDate != null) queryParams['startDate'] = startDate;
    if (endDate != null) queryParams['endDate'] = endDate;

    final response = await _dio.get(
      '/api/attendance',
      queryParameters: queryParams,
    );
    final list = _extractList(response.data);
    return list.map((e) => ParentAttendanceRecord.fromJson(e as Map<String, dynamic>)).toList();
  }

  /// 8. Fetch homework assignments for child
  Future<List<ParentHomeworkAssignment>> getChildHomework({
    required int studentId,
    int? schoolId,
  }) async {
    final queryParams = <String, dynamic>{'studentId': studentId};
    if (schoolId != null) queryParams['schoolId'] = schoolId;

    final response = await _dio.get(
      '/api/v1/student/homework',
      queryParameters: queryParams,
    );
    final list = _extractList(response.data);
    return list.map((e) => ParentHomeworkAssignment.fromJson(e as Map<String, dynamic>)).toList();
  }

  /// 9. Fetch school CMS events
  Future<List<ParentCmsEvent>> getSchoolEvents({int? schoolId}) async {
    final queryParams = <String, dynamic>{};
    if (schoolId != null) queryParams['schoolId'] = schoolId;

    final response = await _dio.get(
      '/api/v1/cms/events',
      queryParameters: queryParams.isEmpty ? null : queryParams,
    );
    final list = _extractList(response.data);
    return list.map((e) => ParentCmsEvent.fromJson(e as Map<String, dynamic>)).toList();
  }

  /// 10. Fetch eligible exam terms for child
  Future<List<dynamic>> getChildEligibleExams(int studentId) async {
    final response = await _dio.get(
      '/api/v1/student/exams/eligible-exams',
      queryParameters: {'studentId': studentId},
    );
    return _extractList(response.data);
  }

  /// 11. Fetch exam results / report card for child
  Future<List<dynamic>> getChildExamResults(int studentId) async {
    final response = await _dio.get(
      '/api/v1/student/exams/results',
      queryParameters: {'studentId': studentId},
    );
    return _extractList(response.data);
  }
}
