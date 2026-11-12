import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/api_client.dart';
import '../domain/auth_models.dart';

part 'auth_api.g.dart';

@riverpod
AuthApi authApi(AuthApiRef ref) {
  return AuthApi(ref.watch(dioProvider));
}

class AuthApi {
  final Dio _dio;

  AuthApi(this._dio);

  Future<AuthUserResponse> login(LoginRequest request) async {
    final response = await _dio.post('/auth/login', data: request.toJson());
    return AuthUserResponse.fromJson(response.data);
  }

  Future<AuthTokenResponse> loginStudentWithCredentials(
    StudentLoginRequest request,
  ) async {
    final response = await _dio.post(
      '/auth/login/student-credentials',
      data: request.toJson(),
    );
    return AuthTokenResponse.fromJson(response.data);
  }

  Future<LoginVerifyResponse> verifyOtp(OtpVerifyRequest request) async {
    final response = await _dio.post(
      '/auth/verify-otp',
      data: request.toJson(),
    );
    return LoginVerifyResponse.fromJson(response.data);
  }

  Future<void> logout() async {
    await _dio.post('/auth/logout');
  }
}
