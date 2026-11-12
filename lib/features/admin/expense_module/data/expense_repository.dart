import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_client.dart';

final expenseRepositoryProvider = Provider(
  (ref) => ExpenseRepository(ref.read(dioProvider)),
);

class ExpenseRepository {
  final Dio _dio;

  ExpenseRepository(this._dio);

  // Expense Heads
  Future<List<Map<String, dynamic>>> getExpenseHeads() async {
    final response = await _dio.get('/api/v1/expenses/heads');
    return List<Map<String, dynamic>>.from(response.data);
  }

  Future<Map<String, dynamic>> createExpenseHead(
    Map<String, dynamic> data,
  ) async {
    final response = await _dio.post('/api/v1/expenses/heads', data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> updateExpenseHead(
    int id,
    Map<String, dynamic> data,
  ) async {
    final response = await _dio.put('/api/v1/expenses/heads/$id', data: data);
    return response.data;
  }

  Future<void> deleteExpenseHead(int id) async {
    await _dio.delete('/api/v1/expenses/heads/$id');
  }

  // Expenses
  Future<List<Map<String, dynamic>>> getExpenses() async {
    final response = await _dio.get('/api/v1/expenses');
    return List<Map<String, dynamic>>.from(response.data);
  }

  Future<Map<String, dynamic>> createExpense(Map<String, dynamic> data) async {
    final response = await _dio.post('/api/v1/expenses', data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> updateExpense(
    int id,
    Map<String, dynamic> data,
  ) async {
    final response = await _dio.put('/api/v1/expenses/$id', data: data);
    return response.data;
  }

  Future<void> deleteExpense(int id) async {
    await _dio.delete('/api/v1/expenses/$id');
  }
}
