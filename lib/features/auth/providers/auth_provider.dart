import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/user.dart';
import '../data/auth_service.dart';

part 'auth_provider.g.dart';

@riverpod
class Auth extends _$Auth {
  @override
  User? build() {
    return null;
  }

  Future<void> sendOtp(String phone) async {
    final service = ref.read(authServiceProvider);
    await service.loginWithPhone(phone);
  }

  Future<void> verifyOtp(String phone, String otp) async {
    final service = ref.read(authServiceProvider);
    final response = await service.verifyOtp(phone, otp);

    if (response.accessToken != null) {
      state = User(
        userId: response.userId,
        name: response.name,
        role: response.primaryRole,
        accessToken: response.accessToken!,
        refreshToken: response.refreshToken!,
        permissions: response.permissions,
        schoolId: (response.schools != null && response.schools!.isNotEmpty)
            ? response.schools!.first['schoolId'] as int?
            : null,
      );
    } else if (response.requiresSchoolSelection == true) {
      throw Exception(
        "School selection required. Mobile implementation pending.",
      );
    }
  }

  Future<void> loginStudent(String admissionNo, String password) async {
    final service = ref.read(authServiceProvider);
    final user = await service.loginStudentWithCredentials(
      admissionNo,
      password,
    );
    state = user;
  }

  void logout() {
    state = null;
  }
}

@riverpod
class Rbac extends _$Rbac {
  @override
  bool build() {
    return true;
  }

  bool hasPermission(String permissionKey) {
    final user = ref.read(authProvider);
    if (user == null) return false;

    if (user.role?.toUpperCase() == 'ADMIN') return true;

    return user.permissions?.any(
          (p) => p.key == permissionKey || p.key == 'ALL',
        ) ??
        false;
  }
}
