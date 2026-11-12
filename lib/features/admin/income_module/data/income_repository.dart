import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_client.dart';

final incomeRepositoryProvider = Provider(
  (ref) => IncomeRepository(ref.read(dioProvider)),
);

class IncomeRepository {
  final Dio _dio;

  IncomeRepository(this._dio);

  // Income Heads
  Future<List<Map<String, dynamic>>> getIncomeHeads() async {
    final response = await _dio.get('/api/v1/income/heads');
    return List<Map<String, dynamic>>.from(response.data);
  }

  Future<Map<String, dynamic>> createIncomeHead(
    Map<String, dynamic> data,
  ) async {
    final response = await _dio.post('/api/v1/income/heads', data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> updateIncomeHead(
    int id,
    Map<String, dynamic> data,
  ) async {
    final response = await _dio.put('/api/v1/income/heads/$id', data: data);
    return response.data;
  }

  Future<void> deleteIncomeHead(int id) async {
    await _dio.delete('/api/v1/income/heads/$id');
  }

  // Incomes
  Future<List<Map<String, dynamic>>> getIncomes() async {
    final response = await _dio.get('/api/v1/income');
    return List<Map<String, dynamic>>.from(response.data);
  }

  Future<Map<String, dynamic>> createIncome(Map<String, dynamic> data) async {
    final response = await _dio.post('/api/v1/income', data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> updateIncome(
    int id,
    Map<String, dynamic> data,
  ) async {
    final response = await _dio.put('/api/v1/income/$id', data: data);
    return response.data;
  }

  Future<void> deleteIncome(int id) async {
    await _dio.delete('/api/v1/income/$id');
  }
}
