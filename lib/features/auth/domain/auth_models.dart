import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_models.freezed.dart';
part 'auth_models.g.dart';

@freezed
abstract class LoginRequest with _$LoginRequest {
  const factory LoginRequest({required String phone}) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
}

@freezed
abstract class StudentLoginRequest with _$StudentLoginRequest {
  const factory StudentLoginRequest({
    required String admissionNo,
    String? password,
  }) = _StudentLoginRequest;

  factory StudentLoginRequest.fromJson(Map<String, dynamic> json) =>
      _$StudentLoginRequestFromJson(json);
}

@freezed
abstract class OtpVerifyRequest with _$OtpVerifyRequest {
  const factory OtpVerifyRequest({required String phone, required String otp}) =
      _OtpVerifyRequest;

  factory OtpVerifyRequest.fromJson(Map<String, dynamic> json) =>
      _$OtpVerifyRequestFromJson(json);
}

@freezed
abstract class AuthUserResponse with _$AuthUserResponse {
  const factory AuthUserResponse({
    required int id,
    required String phone,
    String? name,
    String? email,
    required String status,
    required bool newlyCreated,
  }) = _AuthUserResponse;

  factory AuthUserResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthUserResponseFromJson(json);
}

@freezed
abstract class UserSchoolResponse with _$UserSchoolResponse {
  const factory UserSchoolResponse({
    required int schoolId,
    required String schoolName,
    required String schoolCode,
    required String role,
    required String status,
    String? schoolStatus,
  }) = _UserSchoolResponse;

  factory UserSchoolResponse.fromJson(Map<String, dynamic> json) =>
      _$UserSchoolResponseFromJson(json);
}

@freezed
abstract class StudentSummaryDto with _$StudentSummaryDto {
  const factory StudentSummaryDto({
    int? id,
    int? studentId,
    String? name,
    String? studentName,
    String? admissionNo,
    String? admissionNumber,
    String? className,
    String? grade,
    String? section,
    int? schoolId,
    String? schoolName,
  }) = _StudentSummaryDto;

  factory StudentSummaryDto.fromJson(Map<String, dynamic> json) =>
      _$StudentSummaryDtoFromJson(json);
}

@freezed
abstract class PersonaDto with _$PersonaDto {
  const factory PersonaDto({
    required String roleId,
    required String roleName,
    required String archetype,
  }) = _PersonaDto;

  factory PersonaDto.fromJson(Map<String, dynamic> json) =>
      _$PersonaDtoFromJson(json);
}

@freezed
abstract class PermissionDto with _$PermissionDto {
  const factory PermissionDto({required String key, required String scope}) =
      _PermissionDto;

  factory PermissionDto.fromJson(Map<String, dynamic> json) =>
      _$PermissionDtoFromJson(json);
}

@freezed
abstract class LoginVerifyResponse with _$LoginVerifyResponse {
  const factory LoginVerifyResponse({
    required int userId,
    required String phone,
    String? name,
    String? email,
    required String primaryRole,
    required List<String> roles,
    required List<UserSchoolResponse> schools,
    required bool requiresSchoolSelection,
    required bool requiresStudentSelection,
    required List<StudentSummaryDto> students,
    String? accessToken,
    String? refreshToken,
    required List<PermissionDto> permissions,
    List<PersonaDto>? availablePersonas,
    PersonaDto? activePersona,
  }) = _LoginVerifyResponse;

  factory LoginVerifyResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginVerifyResponseFromJson(json);
}

@freezed
abstract class AuthTokenResponse with _$AuthTokenResponse {
  const factory AuthTokenResponse({
    required int userId,
    required String name,
    int? schoolId,
    int? studentId,
    required String role,
    required String accessToken,
    required String refreshToken,
    required List<PermissionDto> permissions,
    List<PersonaDto>? availablePersonas,
    PersonaDto? activePersona,
  }) = _AuthTokenResponse;

  factory AuthTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenResponseFromJson(json);
}
