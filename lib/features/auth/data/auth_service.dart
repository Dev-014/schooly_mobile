import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/api_client.dart';
import '../domain/user.dart';

part 'auth_service.g.dart';

@riverpod
AuthService authService(Ref ref) {
  return AuthService(ref.watch(dioProvider));
}

class AuthService {
  final Dio _dio;

  AuthService(this._dio);

  Map<String, dynamic> _unwrap(dynamic responseData) {
    if (responseData is Map<String, dynamic> &&
        responseData.containsKey('data')) {
      return responseData['data'] as Map<String, dynamic>;
    }
    return responseData as Map<String, dynamic>;
  }

  Future<AuthUserResponse> loginWithPhone(String phone) async {
    final response = await _dio.post('/auth/login', data: {'phone': phone});
    return AuthUserResponse.fromJson(_unwrap(response.data));
  }

  Future<LoginVerifyResponse> verifyOtp(String phone, String otp) async {
    final response = await _dio.post(
      '/auth/verify-otp',
      data: {'phone': phone, 'otp': otp},
    );
    return LoginVerifyResponse.fromJson(_unwrap(response.data));
  }

  Future<User> loginStudentWithCredentials(
    String admissionNo,
    String password,
  ) async {
    final response = await _dio.post(
      '/auth/login/student-credentials',
      data: {'admissionNo': admissionNo, 'password': password},
    );

    // AuthTokenResponse maps closely to our local User model
    return User.fromJson(_unwrap(response.data));
  }
}
