// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User {

 int get userId; String? get name; String? get role; int? get schoolId; int? get studentId; String get accessToken; String get refreshToken; List<Permission>? get permissions;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.role, role) || other.role == role)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.studentId, studentId) || other.studentId == studentId)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&const DeepCollectionEquality().equals(other.permissions, permissions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,name,role,schoolId,studentId,accessToken,refreshToken,const DeepCollectionEquality().hash(permissions));

@override
String toString() {
  return 'User(userId: $userId, name: $name, role: $role, schoolId: $schoolId, studentId: $studentId, accessToken: $accessToken, refreshToken: $refreshToken, permissions: $permissions)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
 int userId, String? name, String? role, int? schoolId, int? studentId, String accessToken, String refreshToken, List<Permission>? permissions
});




}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? name = freezed,Object? role = freezed,Object? schoolId = freezed,Object? studentId = freezed,Object? accessToken = null,Object? refreshToken = null,Object? permissions = freezed,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,schoolId: freezed == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as int?,studentId: freezed == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as int?,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,permissions: freezed == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<Permission>?,
  ));
}

}


/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _User value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _User value)  $default,){
final _that = this;
switch (_that) {
case _User():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _User value)?  $default,){
final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int userId,  String? name,  String? role,  int? schoolId,  int? studentId,  String accessToken,  String refreshToken,  List<Permission>? permissions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.userId,_that.name,_that.role,_that.schoolId,_that.studentId,_that.accessToken,_that.refreshToken,_that.permissions);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int userId,  String? name,  String? role,  int? schoolId,  int? studentId,  String accessToken,  String refreshToken,  List<Permission>? permissions)  $default,) {final _that = this;
switch (_that) {
case _User():
return $default(_that.userId,_that.name,_that.role,_that.schoolId,_that.studentId,_that.accessToken,_that.refreshToken,_that.permissions);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int userId,  String? name,  String? role,  int? schoolId,  int? studentId,  String accessToken,  String refreshToken,  List<Permission>? permissions)?  $default,) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.userId,_that.name,_that.role,_that.schoolId,_that.studentId,_that.accessToken,_that.refreshToken,_that.permissions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _User extends User {
  const _User({required this.userId, this.name, this.role, this.schoolId, this.studentId, required this.accessToken, required this.refreshToken, final  List<Permission>? permissions}): _permissions = permissions,super._();
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override final  int userId;
@override final  String? name;
@override final  String? role;
@override final  int? schoolId;
@override final  int? studentId;
@override final  String accessToken;
@override final  String refreshToken;
 final  List<Permission>? _permissions;
@override List<Permission>? get permissions {
  final value = _permissions;
  if (value == null) return null;
  if (_permissions is EqualUnmodifiableListView) return _permissions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.role, role) || other.role == role)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.studentId, studentId) || other.studentId == studentId)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&const DeepCollectionEquality().equals(other._permissions, _permissions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,name,role,schoolId,studentId,accessToken,refreshToken,const DeepCollectionEquality().hash(_permissions));

@override
String toString() {
  return 'User(userId: $userId, name: $name, role: $role, schoolId: $schoolId, studentId: $studentId, accessToken: $accessToken, refreshToken: $refreshToken, permissions: $permissions)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
 int userId, String? name, String? role, int? schoolId, int? studentId, String accessToken, String refreshToken, List<Permission>? permissions
});




}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? name = freezed,Object? role = freezed,Object? schoolId = freezed,Object? studentId = freezed,Object? accessToken = null,Object? refreshToken = null,Object? permissions = freezed,}) {
  return _then(_User(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,schoolId: freezed == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as int?,studentId: freezed == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as int?,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,permissions: freezed == permissions ? _self._permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<Permission>?,
  ));
}


}


/// @nodoc
mixin _$Permission {

 String get key; String get scope;
/// Create a copy of Permission
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PermissionCopyWith<Permission> get copyWith => _$PermissionCopyWithImpl<Permission>(this as Permission, _$identity);

  /// Serializes this Permission to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Permission&&(identical(other.key, key) || other.key == key)&&(identical(other.scope, scope) || other.scope == scope));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,scope);

@override
String toString() {
  return 'Permission(key: $key, scope: $scope)';
}


}

/// @nodoc
abstract mixin class $PermissionCopyWith<$Res>  {
  factory $PermissionCopyWith(Permission value, $Res Function(Permission) _then) = _$PermissionCopyWithImpl;
@useResult
$Res call({
 String key, String scope
});




}
/// @nodoc
class _$PermissionCopyWithImpl<$Res>
    implements $PermissionCopyWith<$Res> {
  _$PermissionCopyWithImpl(this._self, this._then);

  final Permission _self;
  final $Res Function(Permission) _then;

/// Create a copy of Permission
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? scope = null,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Permission].
extension PermissionPatterns on Permission {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Permission value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Permission() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Permission value)  $default,){
final _that = this;
switch (_that) {
case _Permission():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Permission value)?  $default,){
final _that = this;
switch (_that) {
case _Permission() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  String scope)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Permission() when $default != null:
return $default(_that.key,_that.scope);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  String scope)  $default,) {final _that = this;
switch (_that) {
case _Permission():
return $default(_that.key,_that.scope);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  String scope)?  $default,) {final _that = this;
switch (_that) {
case _Permission() when $default != null:
return $default(_that.key,_that.scope);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Permission extends Permission {
  const _Permission({required this.key, required this.scope}): super._();
  factory _Permission.fromJson(Map<String, dynamic> json) => _$PermissionFromJson(json);

@override final  String key;
@override final  String scope;

/// Create a copy of Permission
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PermissionCopyWith<_Permission> get copyWith => __$PermissionCopyWithImpl<_Permission>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PermissionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Permission&&(identical(other.key, key) || other.key == key)&&(identical(other.scope, scope) || other.scope == scope));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,scope);

@override
String toString() {
  return 'Permission(key: $key, scope: $scope)';
}


}

/// @nodoc
abstract mixin class _$PermissionCopyWith<$Res> implements $PermissionCopyWith<$Res> {
  factory _$PermissionCopyWith(_Permission value, $Res Function(_Permission) _then) = __$PermissionCopyWithImpl;
@override @useResult
$Res call({
 String key, String scope
});




}
/// @nodoc
class __$PermissionCopyWithImpl<$Res>
    implements _$PermissionCopyWith<$Res> {
  __$PermissionCopyWithImpl(this._self, this._then);

  final _Permission _self;
  final $Res Function(_Permission) _then;

/// Create a copy of Permission
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? scope = null,}) {
  return _then(_Permission(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AuthUserResponse {

 int get id; String? get phone; String? get name; String? get email; String? get status; bool? get newlyCreated;
/// Create a copy of AuthUserResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthUserResponseCopyWith<AuthUserResponse> get copyWith => _$AuthUserResponseCopyWithImpl<AuthUserResponse>(this as AuthUserResponse, _$identity);

  /// Serializes this AuthUserResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthUserResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.status, status) || other.status == status)&&(identical(other.newlyCreated, newlyCreated) || other.newlyCreated == newlyCreated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,phone,name,email,status,newlyCreated);

@override
String toString() {
  return 'AuthUserResponse(id: $id, phone: $phone, name: $name, email: $email, status: $status, newlyCreated: $newlyCreated)';
}


}

/// @nodoc
abstract mixin class $AuthUserResponseCopyWith<$Res>  {
  factory $AuthUserResponseCopyWith(AuthUserResponse value, $Res Function(AuthUserResponse) _then) = _$AuthUserResponseCopyWithImpl;
@useResult
$Res call({
 int id, String? phone, String? name, String? email, String? status, bool? newlyCreated
});




}
/// @nodoc
class _$AuthUserResponseCopyWithImpl<$Res>
    implements $AuthUserResponseCopyWith<$Res> {
  _$AuthUserResponseCopyWithImpl(this._self, this._then);

  final AuthUserResponse _self;
  final $Res Function(AuthUserResponse) _then;

/// Create a copy of AuthUserResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? phone = freezed,Object? name = freezed,Object? email = freezed,Object? status = freezed,Object? newlyCreated = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,newlyCreated: freezed == newlyCreated ? _self.newlyCreated : newlyCreated // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthUserResponse].
extension AuthUserResponsePatterns on AuthUserResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthUserResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthUserResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthUserResponse value)  $default,){
final _that = this;
switch (_that) {
case _AuthUserResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthUserResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AuthUserResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String? phone,  String? name,  String? email,  String? status,  bool? newlyCreated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthUserResponse() when $default != null:
return $default(_that.id,_that.phone,_that.name,_that.email,_that.status,_that.newlyCreated);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String? phone,  String? name,  String? email,  String? status,  bool? newlyCreated)  $default,) {final _that = this;
switch (_that) {
case _AuthUserResponse():
return $default(_that.id,_that.phone,_that.name,_that.email,_that.status,_that.newlyCreated);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String? phone,  String? name,  String? email,  String? status,  bool? newlyCreated)?  $default,) {final _that = this;
switch (_that) {
case _AuthUserResponse() when $default != null:
return $default(_that.id,_that.phone,_that.name,_that.email,_that.status,_that.newlyCreated);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthUserResponse implements AuthUserResponse {
  const _AuthUserResponse({required this.id, this.phone, this.name, this.email, this.status, this.newlyCreated});
  factory _AuthUserResponse.fromJson(Map<String, dynamic> json) => _$AuthUserResponseFromJson(json);

@override final  int id;
@override final  String? phone;
@override final  String? name;
@override final  String? email;
@override final  String? status;
@override final  bool? newlyCreated;

/// Create a copy of AuthUserResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthUserResponseCopyWith<_AuthUserResponse> get copyWith => __$AuthUserResponseCopyWithImpl<_AuthUserResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthUserResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthUserResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.status, status) || other.status == status)&&(identical(other.newlyCreated, newlyCreated) || other.newlyCreated == newlyCreated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,phone,name,email,status,newlyCreated);

@override
String toString() {
  return 'AuthUserResponse(id: $id, phone: $phone, name: $name, email: $email, status: $status, newlyCreated: $newlyCreated)';
}


}

/// @nodoc
abstract mixin class _$AuthUserResponseCopyWith<$Res> implements $AuthUserResponseCopyWith<$Res> {
  factory _$AuthUserResponseCopyWith(_AuthUserResponse value, $Res Function(_AuthUserResponse) _then) = __$AuthUserResponseCopyWithImpl;
@override @useResult
$Res call({
 int id, String? phone, String? name, String? email, String? status, bool? newlyCreated
});




}
/// @nodoc
class __$AuthUserResponseCopyWithImpl<$Res>
    implements _$AuthUserResponseCopyWith<$Res> {
  __$AuthUserResponseCopyWithImpl(this._self, this._then);

  final _AuthUserResponse _self;
  final $Res Function(_AuthUserResponse) _then;

/// Create a copy of AuthUserResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? phone = freezed,Object? name = freezed,Object? email = freezed,Object? status = freezed,Object? newlyCreated = freezed,}) {
  return _then(_AuthUserResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,newlyCreated: freezed == newlyCreated ? _self.newlyCreated : newlyCreated // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$LoginVerifyResponse {

 int get userId; String? get phone; String? get name; String? get email; String? get primaryRole; List<String>? get roles; bool? get requiresSchoolSelection; String? get accessToken; String? get refreshToken; List<Permission>? get permissions; List<Map<String, dynamic>>? get schools;
/// Create a copy of LoginVerifyResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginVerifyResponseCopyWith<LoginVerifyResponse> get copyWith => _$LoginVerifyResponseCopyWithImpl<LoginVerifyResponse>(this as LoginVerifyResponse, _$identity);

  /// Serializes this LoginVerifyResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginVerifyResponse&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.primaryRole, primaryRole) || other.primaryRole == primaryRole)&&const DeepCollectionEquality().equals(other.roles, roles)&&(identical(other.requiresSchoolSelection, requiresSchoolSelection) || other.requiresSchoolSelection == requiresSchoolSelection)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&const DeepCollectionEquality().equals(other.permissions, permissions)&&const DeepCollectionEquality().equals(other.schools, schools));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,phone,name,email,primaryRole,const DeepCollectionEquality().hash(roles),requiresSchoolSelection,accessToken,refreshToken,const DeepCollectionEquality().hash(permissions),const DeepCollectionEquality().hash(schools));

@override
String toString() {
  return 'LoginVerifyResponse(userId: $userId, phone: $phone, name: $name, email: $email, primaryRole: $primaryRole, roles: $roles, requiresSchoolSelection: $requiresSchoolSelection, accessToken: $accessToken, refreshToken: $refreshToken, permissions: $permissions, schools: $schools)';
}


}

/// @nodoc
abstract mixin class $LoginVerifyResponseCopyWith<$Res>  {
  factory $LoginVerifyResponseCopyWith(LoginVerifyResponse value, $Res Function(LoginVerifyResponse) _then) = _$LoginVerifyResponseCopyWithImpl;
@useResult
$Res call({
 int userId, String? phone, String? name, String? email, String? primaryRole, List<String>? roles, bool? requiresSchoolSelection, String? accessToken, String? refreshToken, List<Permission>? permissions, List<Map<String, dynamic>>? schools
});




}
/// @nodoc
class _$LoginVerifyResponseCopyWithImpl<$Res>
    implements $LoginVerifyResponseCopyWith<$Res> {
  _$LoginVerifyResponseCopyWithImpl(this._self, this._then);

  final LoginVerifyResponse _self;
  final $Res Function(LoginVerifyResponse) _then;

/// Create a copy of LoginVerifyResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? phone = freezed,Object? name = freezed,Object? email = freezed,Object? primaryRole = freezed,Object? roles = freezed,Object? requiresSchoolSelection = freezed,Object? accessToken = freezed,Object? refreshToken = freezed,Object? permissions = freezed,Object? schools = freezed,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,primaryRole: freezed == primaryRole ? _self.primaryRole : primaryRole // ignore: cast_nullable_to_non_nullable
as String?,roles: freezed == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<String>?,requiresSchoolSelection: freezed == requiresSchoolSelection ? _self.requiresSchoolSelection : requiresSchoolSelection // ignore: cast_nullable_to_non_nullable
as bool?,accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,permissions: freezed == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<Permission>?,schools: freezed == schools ? _self.schools : schools // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>?,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginVerifyResponse].
extension LoginVerifyResponsePatterns on LoginVerifyResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginVerifyResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginVerifyResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginVerifyResponse value)  $default,){
final _that = this;
switch (_that) {
case _LoginVerifyResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginVerifyResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LoginVerifyResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int userId,  String? phone,  String? name,  String? email,  String? primaryRole,  List<String>? roles,  bool? requiresSchoolSelection,  String? accessToken,  String? refreshToken,  List<Permission>? permissions,  List<Map<String, dynamic>>? schools)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginVerifyResponse() when $default != null:
return $default(_that.userId,_that.phone,_that.name,_that.email,_that.primaryRole,_that.roles,_that.requiresSchoolSelection,_that.accessToken,_that.refreshToken,_that.permissions,_that.schools);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int userId,  String? phone,  String? name,  String? email,  String? primaryRole,  List<String>? roles,  bool? requiresSchoolSelection,  String? accessToken,  String? refreshToken,  List<Permission>? permissions,  List<Map<String, dynamic>>? schools)  $default,) {final _that = this;
switch (_that) {
case _LoginVerifyResponse():
return $default(_that.userId,_that.phone,_that.name,_that.email,_that.primaryRole,_that.roles,_that.requiresSchoolSelection,_that.accessToken,_that.refreshToken,_that.permissions,_that.schools);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int userId,  String? phone,  String? name,  String? email,  String? primaryRole,  List<String>? roles,  bool? requiresSchoolSelection,  String? accessToken,  String? refreshToken,  List<Permission>? permissions,  List<Map<String, dynamic>>? schools)?  $default,) {final _that = this;
switch (_that) {
case _LoginVerifyResponse() when $default != null:
return $default(_that.userId,_that.phone,_that.name,_that.email,_that.primaryRole,_that.roles,_that.requiresSchoolSelection,_that.accessToken,_that.refreshToken,_that.permissions,_that.schools);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginVerifyResponse implements LoginVerifyResponse {
  const _LoginVerifyResponse({required this.userId, this.phone, this.name, this.email, this.primaryRole, final  List<String>? roles, this.requiresSchoolSelection, this.accessToken, this.refreshToken, final  List<Permission>? permissions, final  List<Map<String, dynamic>>? schools}): _roles = roles,_permissions = permissions,_schools = schools;
  factory _LoginVerifyResponse.fromJson(Map<String, dynamic> json) => _$LoginVerifyResponseFromJson(json);

@override final  int userId;
@override final  String? phone;
@override final  String? name;
@override final  String? email;
@override final  String? primaryRole;
 final  List<String>? _roles;
@override List<String>? get roles {
  final value = _roles;
  if (value == null) return null;
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  bool? requiresSchoolSelection;
@override final  String? accessToken;
@override final  String? refreshToken;
 final  List<Permission>? _permissions;
@override List<Permission>? get permissions {
  final value = _permissions;
  if (value == null) return null;
  if (_permissions is EqualUnmodifiableListView) return _permissions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Map<String, dynamic>>? _schools;
@override List<Map<String, dynamic>>? get schools {
  final value = _schools;
  if (value == null) return null;
  if (_schools is EqualUnmodifiableListView) return _schools;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of LoginVerifyResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginVerifyResponseCopyWith<_LoginVerifyResponse> get copyWith => __$LoginVerifyResponseCopyWithImpl<_LoginVerifyResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginVerifyResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginVerifyResponse&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.primaryRole, primaryRole) || other.primaryRole == primaryRole)&&const DeepCollectionEquality().equals(other._roles, _roles)&&(identical(other.requiresSchoolSelection, requiresSchoolSelection) || other.requiresSchoolSelection == requiresSchoolSelection)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&const DeepCollectionEquality().equals(other._permissions, _permissions)&&const DeepCollectionEquality().equals(other._schools, _schools));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,phone,name,email,primaryRole,const DeepCollectionEquality().hash(_roles),requiresSchoolSelection,accessToken,refreshToken,const DeepCollectionEquality().hash(_permissions),const DeepCollectionEquality().hash(_schools));

@override
String toString() {
  return 'LoginVerifyResponse(userId: $userId, phone: $phone, name: $name, email: $email, primaryRole: $primaryRole, roles: $roles, requiresSchoolSelection: $requiresSchoolSelection, accessToken: $accessToken, refreshToken: $refreshToken, permissions: $permissions, schools: $schools)';
}


}

/// @nodoc
abstract mixin class _$LoginVerifyResponseCopyWith<$Res> implements $LoginVerifyResponseCopyWith<$Res> {
  factory _$LoginVerifyResponseCopyWith(_LoginVerifyResponse value, $Res Function(_LoginVerifyResponse) _then) = __$LoginVerifyResponseCopyWithImpl;
@override @useResult
$Res call({
 int userId, String? phone, String? name, String? email, String? primaryRole, List<String>? roles, bool? requiresSchoolSelection, String? accessToken, String? refreshToken, List<Permission>? permissions, List<Map<String, dynamic>>? schools
});




}
/// @nodoc
class __$LoginVerifyResponseCopyWithImpl<$Res>
    implements _$LoginVerifyResponseCopyWith<$Res> {
  __$LoginVerifyResponseCopyWithImpl(this._self, this._then);

  final _LoginVerifyResponse _self;
  final $Res Function(_LoginVerifyResponse) _then;

/// Create a copy of LoginVerifyResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? phone = freezed,Object? name = freezed,Object? email = freezed,Object? primaryRole = freezed,Object? roles = freezed,Object? requiresSchoolSelection = freezed,Object? accessToken = freezed,Object? refreshToken = freezed,Object? permissions = freezed,Object? schools = freezed,}) {
  return _then(_LoginVerifyResponse(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,primaryRole: freezed == primaryRole ? _self.primaryRole : primaryRole // ignore: cast_nullable_to_non_nullable
as String?,roles: freezed == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<String>?,requiresSchoolSelection: freezed == requiresSchoolSelection ? _self.requiresSchoolSelection : requiresSchoolSelection // ignore: cast_nullable_to_non_nullable
as bool?,accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,permissions: freezed == permissions ? _self._permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<Permission>?,schools: freezed == schools ? _self._schools : schools // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>?,
  ));
}


}

// dart format on
