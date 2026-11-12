// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  userId: (json['userId'] as num).toInt(),
  name: json['name'] as String?,
  role: json['role'] as String?,
  schoolId: (json['schoolId'] as num?)?.toInt(),
  studentId: (json['studentId'] as num?)?.toInt(),
  accessToken: json['accessToken'] as String,
  refreshToken: json['refreshToken'] as String,
  permissions: (json['permissions'] as List<dynamic>?)
      ?.map((e) => Permission.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'userId': instance.userId,
  'name': instance.name,
  'role': instance.role,
  'schoolId': instance.schoolId,
  'studentId': instance.studentId,
  'accessToken': instance.accessToken,
  'refreshToken': instance.refreshToken,
  'permissions': instance.permissions,
};

_Permission _$PermissionFromJson(Map<String, dynamic> json) =>
    _Permission(key: json['key'] as String, scope: json['scope'] as String);

Map<String, dynamic> _$PermissionToJson(_Permission instance) =>
    <String, dynamic>{'key': instance.key, 'scope': instance.scope};

_AuthUserResponse _$AuthUserResponseFromJson(Map<String, dynamic> json) =>
    _AuthUserResponse(
      id: (json['id'] as num).toInt(),
      phone: json['phone'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      status: json['status'] as String?,
      newlyCreated: json['newlyCreated'] as bool?,
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

_LoginVerifyResponse _$LoginVerifyResponseFromJson(Map<String, dynamic> json) =>
    _LoginVerifyResponse(
      userId: (json['userId'] as num).toInt(),
      phone: json['phone'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      primaryRole: json['primaryRole'] as String?,
      roles: (json['roles'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      requiresSchoolSelection: json['requiresSchoolSelection'] as bool?,
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      permissions: (json['permissions'] as List<dynamic>?)
          ?.map((e) => Permission.fromJson(e as Map<String, dynamic>))
          .toList(),
      schools: (json['schools'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
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
  'requiresSchoolSelection': instance.requiresSchoolSelection,
  'accessToken': instance.accessToken,
  'refreshToken': instance.refreshToken,
  'permissions': instance.permissions,
  'schools': instance.schools,
};
