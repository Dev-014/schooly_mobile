// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) =>
    _LoginRequest(phone: json['phone'] as String);

Map<String, dynamic> _$LoginRequestToJson(_LoginRequest instance) =>
    <String, dynamic>{'phone': instance.phone};

_StudentLoginRequest _$StudentLoginRequestFromJson(Map<String, dynamic> json) =>
    _StudentLoginRequest(
      admissionNo: json['admissionNo'] as String,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$StudentLoginRequestToJson(
  _StudentLoginRequest instance,
) => <String, dynamic>{
  'admissionNo': instance.admissionNo,
  'password': instance.password,
};

_OtpVerifyRequest _$OtpVerifyRequestFromJson(Map<String, dynamic> json) =>
    _OtpVerifyRequest(
      phone: json['phone'] as String,
      otp: json['otp'] as String,
    );

Map<String, dynamic> _$OtpVerifyRequestToJson(_OtpVerifyRequest instance) =>
    <String, dynamic>{'phone': instance.phone, 'otp': instance.otp};

_AuthUserResponse _$AuthUserResponseFromJson(Map<String, dynamic> json) =>
    _AuthUserResponse(
      id: (json['id'] as num).toInt(),
      phone: json['phone'] as String,
      name: json['name'] as String?,
      email: json['email'] as String?,
      status: json['status'] as String,
      newlyCreated: json['newlyCreated'] as bool,
    );

Map<String, dynamic> _$AuthUserResponseToJson(_AuthUserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'name': instance.name,
      'email': instance.email,
      'status': instance.status,
      'newlyCreated': instance.newlyCreated,
    };

_UserSchoolResponse _$UserSchoolResponseFromJson(Map<String, dynamic> json) =>
    _UserSchoolResponse(
      schoolId: (json['schoolId'] as num).toInt(),
      schoolName: json['schoolName'] as String,
      schoolCode: json['schoolCode'] as String,
      role: json['role'] as String,
      status: json['status'] as String,
      schoolStatus: json['schoolStatus'] as String?,
    );

Map<String, dynamic> _$UserSchoolResponseToJson(_UserSchoolResponse instance) =>
    <String, dynamic>{
      'schoolId': instance.schoolId,
      'schoolName': instance.schoolName,
      'schoolCode': instance.schoolCode,
      'role': instance.role,
      'status': instance.status,
      'schoolStatus': instance.schoolStatus,
    };

_StudentSummaryDto _$StudentSummaryDtoFromJson(Map<String, dynamic> json) =>
    _StudentSummaryDto(
      id: (json['id'] as num?)?.toInt(),
      studentId: (json['studentId'] as num?)?.toInt(),
      name: json['name'] as String?,
      studentName: json['studentName'] as String?,
      admissionNo: json['admissionNo'] as String?,
      admissionNumber: json['admissionNumber'] as String?,
      className: json['className'] as String?,
      grade: json['grade'] as String?,
      section: json['section'] as String?,
      schoolId: (json['schoolId'] as num?)?.toInt(),
      schoolName: json['schoolName'] as String?,
    );

Map<String, dynamic> _$StudentSummaryDtoToJson(_StudentSummaryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'studentId': instance.studentId,
      'name': instance.name,
      'studentName': instance.studentName,
      'admissionNo': instance.admissionNo,
      'admissionNumber': instance.admissionNumber,
      'className': instance.className,
      'grade': instance.grade,
      'section': instance.section,
      'schoolId': instance.schoolId,
      'schoolName': instance.schoolName,
    };

_PersonaDto _$PersonaDtoFromJson(Map<String, dynamic> json) => _PersonaDto(
  roleId: json['roleId'] as String,
  roleName: json['roleName'] as String,
  archetype: json['archetype'] as String,
);

Map<String, dynamic> _$PersonaDtoToJson(_PersonaDto instance) =>
    <String, dynamic>{
      'roleId': instance.roleId,
      'roleName': instance.roleName,
      'archetype': instance.archetype,
    };

_PermissionDto _$PermissionDtoFromJson(Map<String, dynamic> json) =>
    _PermissionDto(key: json['key'] as String, scope: json['scope'] as String);

Map<String, dynamic> _$PermissionDtoToJson(_PermissionDto instance) =>
    <String, dynamic>{'key': instance.key, 'scope': instance.scope};

_LoginVerifyResponse _$LoginVerifyResponseFromJson(Map<String, dynamic> json) =>
    _LoginVerifyResponse(
      userId: (json['userId'] as num).toInt(),
      phone: json['phone'] as String,
      name: json['name'] as String?,
      email: json['email'] as String?,
      primaryRole: json['primaryRole'] as String,
      roles: (json['roles'] as List<dynamic>).map((e) => e as String).toList(),
      schools: (json['schools'] as List<dynamic>)
          .map((e) => UserSchoolResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      requiresSchoolSelection: json['requiresSchoolSelection'] as bool,
      requiresStudentSelection: json['requiresStudentSelection'] as bool,
      students: (json['students'] as List<dynamic>)
          .map((e) => StudentSummaryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      permissions: (json['permissions'] as List<dynamic>)
          .map((e) => PermissionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      availablePersonas: (json['availablePersonas'] as List<dynamic>?)
          ?.map((e) => PersonaDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      activePersona: json['activePersona'] == null
          ? null
          : PersonaDto.fromJson(json['activePersona'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginVerifyResponseToJson(
  _LoginVerifyResponse instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'phone': instance.phone,
  'name': instance.name,
  'email': instance.email,
  'primaryRole': instance.primaryRole,
  'roles': instance.roles,
  'schools': instance.schools,
  'requiresSchoolSelection': instance.requiresSchoolSelection,
  'requiresStudentSelection': instance.requiresStudentSelection,
  'students': instance.students,
  'accessToken': instance.accessToken,
  'refreshToken': instance.refreshToken,
  'permissions': instance.permissions,
  'availablePersonas': instance.availablePersonas,
  'activePersona': instance.activePersona,
};

_AuthTokenResponse _$AuthTokenResponseFromJson(Map<String, dynamic> json) =>
    _AuthTokenResponse(
      userId: (json['userId'] as num).toInt(),
      name: json['name'] as String,
      schoolId: (json['schoolId'] as num?)?.toInt(),
      studentId: (json['studentId'] as num?)?.toInt(),
      role: json['role'] as String,
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      permissions: (json['permissions'] as List<dynamic>)
          .map((e) => PermissionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      availablePersonas: (json['availablePersonas'] as List<dynamic>?)
          ?.map((e) => PersonaDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      activePersona: json['activePersona'] == null
          ? null
          : PersonaDto.fromJson(json['activePersona'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthTokenResponseToJson(_AuthTokenResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'schoolId': instance.schoolId,
      'studentId': instance.studentId,
      'role': instance.role,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'permissions': instance.permissions,
      'availablePersonas': instance.availablePersonas,
      'activePersona': instance.activePersona,
    };
