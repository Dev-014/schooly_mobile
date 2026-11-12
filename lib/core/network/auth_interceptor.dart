import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../features/auth/providers/auth_provider.dart';

part 'auth_interceptor.g.dart';

@riverpod
AuthInterceptor authInterceptor(Ref ref) {
  return AuthInterceptor(ref);
}

class AuthInterceptor extends Interceptor {
  final Ref ref;

  AuthInterceptor(this.ref);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final user = ref.read(authProvider);
    if (user != null && user.accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer ${user.accessToken}';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      // Handle unauthorized (e.g. refresh token or logout)
    }
    handler.next(err);
  }
}
