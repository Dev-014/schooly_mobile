import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const User._();
  const factory User({
    required int userId,
    String? name,
    String? role,
    int? schoolId,
    int? studentId,
    required String accessToken,
    required String refreshToken,
    List<Permission>? permissions,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
abstract class Permission with _$Permission {
  const Permission._();
  const factory Permission({required String key, required String scope}) =
      _Permission;

  factory Permission.fromJson(Map<String, dynamic> json) =>
      _$PermissionFromJson(json);
}

@freezed
abstract class AuthUserResponse with _$AuthUserResponse {
  const factory AuthUserResponse({
    required int id,
    String? phone,
    String? name,
    String? email,
    String? status,
    bool? newlyCreated,
  }) = _AuthUserResponse;

  factory AuthUserResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthUserResponseFromJson(json);
}

@freezed
abstract class LoginVerifyResponse with _$LoginVerifyResponse {
  const factory LoginVerifyResponse({
    required int userId,
    String? phone,
    String? name,
    String? email,
    String? primaryRole,
    List<String>? roles,
    bool? requiresSchoolSelection,
    String? accessToken,
    String? refreshToken,
    List<Permission>? permissions,
    List<Map<String, dynamic>>? schools,
  }) = _LoginVerifyResponse;

  factory LoginVerifyResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginVerifyResponseFromJson(json);
}
