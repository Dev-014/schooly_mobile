// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginRequest {

 String get phone;
/// Create a copy of LoginRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginRequestCopyWith<LoginRequest> get copyWith => _$LoginRequestCopyWithImpl<LoginRequest>(this as LoginRequest, _$identity);

  /// Serializes this LoginRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginRequest&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phone);

@override
String toString() {
  return 'LoginRequest(phone: $phone)';
}


}

/// @nodoc
abstract mixin class $LoginRequestCopyWith<$Res>  {
  factory $LoginRequestCopyWith(LoginRequest value, $Res Function(LoginRequest) _then) = _$LoginRequestCopyWithImpl;
@useResult
$Res call({
 String phone
});




}
/// @nodoc
class _$LoginRequestCopyWithImpl<$Res>
    implements $LoginRequestCopyWith<$Res> {
  _$LoginRequestCopyWithImpl(this._self, this._then);

  final LoginRequest _self;
  final $Res Function(LoginRequest) _then;

/// Create a copy of LoginRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phone = null,}) {
  return _then(_self.copyWith(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginRequest].
extension LoginRequestPatterns on LoginRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginRequest value)  $default,){
final _that = this;
switch (_that) {
case _LoginRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginRequest value)?  $default,){
final _that = this;
switch (_that) {
case _LoginRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String phone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginRequest() when $default != null:
return $default(_that.phone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String phone)  $default,) {final _that = this;
switch (_that) {
case _LoginRequest():
return $default(_that.phone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String phone)?  $default,) {final _that = this;
switch (_that) {
case _LoginRequest() when $default != null:
return $default(_that.phone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginRequest implements LoginRequest {
  const _LoginRequest({required this.phone});
  factory _LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);

@override final  String phone;

/// Create a copy of LoginRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginRequestCopyWith<_LoginRequest> get copyWith => __$LoginRequestCopyWithImpl<_LoginRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginRequest&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phone);

@override
String toString() {
  return 'LoginRequest(phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$LoginRequestCopyWith<$Res> implements $LoginRequestCopyWith<$Res> {
  factory _$LoginRequestCopyWith(_LoginRequest value, $Res Function(_LoginRequest) _then) = __$LoginRequestCopyWithImpl;
@override @useResult
$Res call({
 String phone
});




}
/// @nodoc
class __$LoginRequestCopyWithImpl<$Res>
    implements _$LoginRequestCopyWith<$Res> {
  __$LoginRequestCopyWithImpl(this._self, this._then);

  final _LoginRequest _self;
  final $Res Function(_LoginRequest) _then;

/// Create a copy of LoginRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phone = null,}) {
  return _then(_LoginRequest(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$StudentLoginRequest {

 String get admissionNo; String? get password;
/// Create a copy of StudentLoginRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentLoginRequestCopyWith<StudentLoginRequest> get copyWith => _$StudentLoginRequestCopyWithImpl<StudentLoginRequest>(this as StudentLoginRequest, _$identity);

  /// Serializes this StudentLoginRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentLoginRequest&&(identical(other.admissionNo, admissionNo) || other.admissionNo == admissionNo)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,admissionNo,password);

@override
String toString() {
  return 'StudentLoginRequest(admissionNo: $admissionNo, password: $password)';
}


}

/// @nodoc
abstract mixin class $StudentLoginRequestCopyWith<$Res>  {
  factory $StudentLoginRequestCopyWith(StudentLoginRequest value, $Res Function(StudentLoginRequest) _then) = _$StudentLoginRequestCopyWithImpl;
@useResult
$Res call({
 String admissionNo, String? password
});




}
/// @nodoc
class _$StudentLoginRequestCopyWithImpl<$Res>
    implements $StudentLoginRequestCopyWith<$Res> {
  _$StudentLoginRequestCopyWithImpl(this._self, this._then);

  final StudentLoginRequest _self;
  final $Res Function(StudentLoginRequest) _then;

/// Create a copy of StudentLoginRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? admissionNo = null,Object? password = freezed,}) {
  return _then(_self.copyWith(
admissionNo: null == admissionNo ? _self.admissionNo : admissionNo // ignore: cast_nullable_to_non_nullable
as String,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StudentLoginRequest].
extension StudentLoginRequestPatterns on StudentLoginRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentLoginRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentLoginRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentLoginRequest value)  $default,){
final _that = this;
switch (_that) {
case _StudentLoginRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentLoginRequest value)?  $default,){
final _that = this;
switch (_that) {
case _StudentLoginRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String admissionNo,  String? password)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentLoginRequest() when $default != null:
return $default(_that.admissionNo,_that.password);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String admissionNo,  String? password)  $default,) {final _that = this;
switch (_that) {
case _StudentLoginRequest():
return $default(_that.admissionNo,_that.password);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String admissionNo,  String? password)?  $default,) {final _that = this;
switch (_that) {
case _StudentLoginRequest() when $default != null:
return $default(_that.admissionNo,_that.password);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StudentLoginRequest implements StudentLoginRequest {
  const _StudentLoginRequest({required this.admissionNo, this.password});
  factory _StudentLoginRequest.fromJson(Map<String, dynamic> json) => _$StudentLoginRequestFromJson(json);

@override final  String admissionNo;
@override final  String? password;

/// Create a copy of StudentLoginRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentLoginRequestCopyWith<_StudentLoginRequest> get copyWith => __$StudentLoginRequestCopyWithImpl<_StudentLoginRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudentLoginRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentLoginRequest&&(identical(other.admissionNo, admissionNo) || other.admissionNo == admissionNo)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,admissionNo,password);

@override
String toString() {
  return 'StudentLoginRequest(admissionNo: $admissionNo, password: $password)';
}


}

/// @nodoc
abstract mixin class _$StudentLoginRequestCopyWith<$Res> implements $StudentLoginRequestCopyWith<$Res> {
  factory _$StudentLoginRequestCopyWith(_StudentLoginRequest value, $Res Function(_StudentLoginRequest) _then) = __$StudentLoginRequestCopyWithImpl;
@override @useResult
$Res call({
 String admissionNo, String? password
});




}
/// @nodoc
class __$StudentLoginRequestCopyWithImpl<$Res>
    implements _$StudentLoginRequestCopyWith<$Res> {
  __$StudentLoginRequestCopyWithImpl(this._self, this._then);

  final _StudentLoginRequest _self;
  final $Res Function(_StudentLoginRequest) _then;

/// Create a copy of StudentLoginRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? admissionNo = null,Object? password = freezed,}) {
  return _then(_StudentLoginRequest(
admissionNo: null == admissionNo ? _self.admissionNo : admissionNo // ignore: cast_nullable_to_non_nullable
as String,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$OtpVerifyRequest {

 String get phone; String get otp;
/// Create a copy of OtpVerifyRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OtpVerifyRequestCopyWith<OtpVerifyRequest> get copyWith => _$OtpVerifyRequestCopyWithImpl<OtpVerifyRequest>(this as OtpVerifyRequest, _$identity);

  /// Serializes this OtpVerifyRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OtpVerifyRequest&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.otp, otp) || other.otp == otp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phone,otp);

@override
String toString() {
  return 'OtpVerifyRequest(phone: $phone, otp: $otp)';
}


}

/// @nodoc
abstract mixin class $OtpVerifyRequestCopyWith<$Res>  {
  factory $OtpVerifyRequestCopyWith(OtpVerifyRequest value, $Res Function(OtpVerifyRequest) _then) = _$OtpVerifyRequestCopyWithImpl;
@useResult
$Res call({
 String phone, String otp
});




}
/// @nodoc
class _$OtpVerifyRequestCopyWithImpl<$Res>
    implements $OtpVerifyRequestCopyWith<$Res> {
  _$OtpVerifyRequestCopyWithImpl(this._self, this._then);

  final OtpVerifyRequest _self;
  final $Res Function(OtpVerifyRequest) _then;

/// Create a copy of OtpVerifyRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phone = null,Object? otp = null,}) {
  return _then(_self.copyWith(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OtpVerifyRequest].
extension OtpVerifyRequestPatterns on OtpVerifyRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OtpVerifyRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OtpVerifyRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OtpVerifyRequest value)  $default,){
final _that = this;
switch (_that) {
case _OtpVerifyRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OtpVerifyRequest value)?  $default,){
final _that = this;
switch (_that) {
case _OtpVerifyRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String phone,  String otp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OtpVerifyRequest() when $default != null:
return $default(_that.phone,_that.otp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String phone,  String otp)  $default,) {final _that = this;
switch (_that) {
case _OtpVerifyRequest():
return $default(_that.phone,_that.otp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String phone,  String otp)?  $default,) {final _that = this;
switch (_that) {
case _OtpVerifyRequest() when $default != null:
return $default(_that.phone,_that.otp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OtpVerifyRequest implements OtpVerifyRequest {
  const _OtpVerifyRequest({required this.phone, required this.otp});
  factory _OtpVerifyRequest.fromJson(Map<String, dynamic> json) => _$OtpVerifyRequestFromJson(json);

@override final  String phone;
@override final  String otp;

/// Create a copy of OtpVerifyRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OtpVerifyRequestCopyWith<_OtpVerifyRequest> get copyWith => __$OtpVerifyRequestCopyWithImpl<_OtpVerifyRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OtpVerifyRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OtpVerifyRequest&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.otp, otp) || other.otp == otp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phone,otp);

@override
String toString() {
  return 'OtpVerifyRequest(phone: $phone, otp: $otp)';
}


}

/// @nodoc
abstract mixin class _$OtpVerifyRequestCopyWith<$Res> implements $OtpVerifyRequestCopyWith<$Res> {
  factory _$OtpVerifyRequestCopyWith(_OtpVerifyRequest value, $Res Function(_OtpVerifyRequest) _then) = __$OtpVerifyRequestCopyWithImpl;
@override @useResult
$Res call({
 String phone, String otp
});




}
/// @nodoc
class __$OtpVerifyRequestCopyWithImpl<$Res>
    implements _$OtpVerifyRequestCopyWith<$Res> {
  __$OtpVerifyRequestCopyWithImpl(this._self, this._then);

  final _OtpVerifyRequest _self;
  final $Res Function(_OtpVerifyRequest) _then;

/// Create a copy of OtpVerifyRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phone = null,Object? otp = null,}) {
  return _then(_OtpVerifyRequest(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AuthUserResponse {

 int get id; String get phone; String? get name; String? get email; String get status; bool get newlyCreated;
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
 int id, String phone, String? name, String? email, String status, bool newlyCreated
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? phone = null,Object? name = freezed,Object? email = freezed,Object? status = null,Object? newlyCreated = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,newlyCreated: null == newlyCreated ? _self.newlyCreated : newlyCreated // ignore: cast_nullable_to_non_nullable
as bool,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String phone,  String? name,  String? email,  String status,  bool newlyCreated)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String phone,  String? name,  String? email,  String status,  bool newlyCreated)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String phone,  String? name,  String? email,  String status,  bool newlyCreated)?  $default,) {final _that = this;
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
  const _AuthUserResponse({required this.id, required this.phone, this.name, this.email, required this.status, required this.newlyCreated});
  factory _AuthUserResponse.fromJson(Map<String, dynamic> json) => _$AuthUserResponseFromJson(json);

@override final  int id;
@override final  String phone;
@override final  String? name;
@override final  String? email;
@override final  String status;
@override final  bool newlyCreated;

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
 int id, String phone, String? name, String? email, String status, bool newlyCreated
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? phone = null,Object? name = freezed,Object? email = freezed,Object? status = null,Object? newlyCreated = null,}) {
  return _then(_AuthUserResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,newlyCreated: null == newlyCreated ? _self.newlyCreated : newlyCreated // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$UserSchoolResponse {

 int get schoolId; String get schoolName; String get schoolCode; String get role; String get status; String? get schoolStatus;
/// Create a copy of UserSchoolResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSchoolResponseCopyWith<UserSchoolResponse> get copyWith => _$UserSchoolResponseCopyWithImpl<UserSchoolResponse>(this as UserSchoolResponse, _$identity);

  /// Serializes this UserSchoolResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSchoolResponse&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.schoolName, schoolName) || other.schoolName == schoolName)&&(identical(other.schoolCode, schoolCode) || other.schoolCode == schoolCode)&&(identical(other.role, role) || other.role == role)&&(identical(other.status, status) || other.status == status)&&(identical(other.schoolStatus, schoolStatus) || other.schoolStatus == schoolStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,schoolName,schoolCode,role,status,schoolStatus);

@override
String toString() {
  return 'UserSchoolResponse(schoolId: $schoolId, schoolName: $schoolName, schoolCode: $schoolCode, role: $role, status: $status, schoolStatus: $schoolStatus)';
}


}

/// @nodoc
abstract mixin class $UserSchoolResponseCopyWith<$Res>  {
  factory $UserSchoolResponseCopyWith(UserSchoolResponse value, $Res Function(UserSchoolResponse) _then) = _$UserSchoolResponseCopyWithImpl;
@useResult
$Res call({
 int schoolId, String schoolName, String schoolCode, String role, String status, String? schoolStatus
});




}
/// @nodoc
class _$UserSchoolResponseCopyWithImpl<$Res>
    implements $UserSchoolResponseCopyWith<$Res> {
  _$UserSchoolResponseCopyWithImpl(this._self, this._then);

  final UserSchoolResponse _self;
  final $Res Function(UserSchoolResponse) _then;

/// Create a copy of UserSchoolResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schoolId = null,Object? schoolName = null,Object? schoolCode = null,Object? role = null,Object? status = null,Object? schoolStatus = freezed,}) {
  return _then(_self.copyWith(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as int,schoolName: null == schoolName ? _self.schoolName : schoolName // ignore: cast_nullable_to_non_nullable
as String,schoolCode: null == schoolCode ? _self.schoolCode : schoolCode // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,schoolStatus: freezed == schoolStatus ? _self.schoolStatus : schoolStatus // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserSchoolResponse].
extension UserSchoolResponsePatterns on UserSchoolResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserSchoolResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserSchoolResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserSchoolResponse value)  $default,){
final _that = this;
switch (_that) {
case _UserSchoolResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserSchoolResponse value)?  $default,){
final _that = this;
switch (_that) {
case _UserSchoolResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int schoolId,  String schoolName,  String schoolCode,  String role,  String status,  String? schoolStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserSchoolResponse() when $default != null:
return $default(_that.schoolId,_that.schoolName,_that.schoolCode,_that.role,_that.status,_that.schoolStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int schoolId,  String schoolName,  String schoolCode,  String role,  String status,  String? schoolStatus)  $default,) {final _that = this;
switch (_that) {
case _UserSchoolResponse():
return $default(_that.schoolId,_that.schoolName,_that.schoolCode,_that.role,_that.status,_that.schoolStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int schoolId,  String schoolName,  String schoolCode,  String role,  String status,  String? schoolStatus)?  $default,) {final _that = this;
switch (_that) {
case _UserSchoolResponse() when $default != null:
return $default(_that.schoolId,_that.schoolName,_that.schoolCode,_that.role,_that.status,_that.schoolStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserSchoolResponse implements UserSchoolResponse {
  const _UserSchoolResponse({required this.schoolId, required this.schoolName, required this.schoolCode, required this.role, required this.status, this.schoolStatus});
  factory _UserSchoolResponse.fromJson(Map<String, dynamic> json) => _$UserSchoolResponseFromJson(json);

@override final  int schoolId;
@override final  String schoolName;
@override final  String schoolCode;
@override final  String role;
@override final  String status;
@override final  String? schoolStatus;

/// Create a copy of UserSchoolResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserSchoolResponseCopyWith<_UserSchoolResponse> get copyWith => __$UserSchoolResponseCopyWithImpl<_UserSchoolResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserSchoolResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserSchoolResponse&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.schoolName, schoolName) || other.schoolName == schoolName)&&(identical(other.schoolCode, schoolCode) || other.schoolCode == schoolCode)&&(identical(other.role, role) || other.role == role)&&(identical(other.status, status) || other.status == status)&&(identical(other.schoolStatus, schoolStatus) || other.schoolStatus == schoolStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,schoolName,schoolCode,role,status,schoolStatus);

@override
String toString() {
  return 'UserSchoolResponse(schoolId: $schoolId, schoolName: $schoolName, schoolCode: $schoolCode, role: $role, status: $status, schoolStatus: $schoolStatus)';
}


}

/// @nodoc
abstract mixin class _$UserSchoolResponseCopyWith<$Res> implements $UserSchoolResponseCopyWith<$Res> {
  factory _$UserSchoolResponseCopyWith(_UserSchoolResponse value, $Res Function(_UserSchoolResponse) _then) = __$UserSchoolResponseCopyWithImpl;
@override @useResult
$Res call({
 int schoolId, String schoolName, String schoolCode, String role, String status, String? schoolStatus
});




}
/// @nodoc
class __$UserSchoolResponseCopyWithImpl<$Res>
    implements _$UserSchoolResponseCopyWith<$Res> {
  __$UserSchoolResponseCopyWithImpl(this._self, this._then);

  final _UserSchoolResponse _self;
  final $Res Function(_UserSchoolResponse) _then;

/// Create a copy of UserSchoolResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schoolId = null,Object? schoolName = null,Object? schoolCode = null,Object? role = null,Object? status = null,Object? schoolStatus = freezed,}) {
  return _then(_UserSchoolResponse(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as int,schoolName: null == schoolName ? _self.schoolName : schoolName // ignore: cast_nullable_to_non_nullable
as String,schoolCode: null == schoolCode ? _self.schoolCode : schoolCode // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,schoolStatus: freezed == schoolStatus ? _self.schoolStatus : schoolStatus // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$StudentSummaryDto {

 int? get id; int? get studentId; String? get name; String? get studentName; String? get admissionNo; String? get admissionNumber; String? get className; String? get grade; String? get section; int? get schoolId; String? get schoolName;
/// Create a copy of StudentSummaryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentSummaryDtoCopyWith<StudentSummaryDto> get copyWith => _$StudentSummaryDtoCopyWithImpl<StudentSummaryDto>(this as StudentSummaryDto, _$identity);

  /// Serializes this StudentSummaryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentSummaryDto&&(identical(other.id, id) || other.id == id)&&(identical(other.studentId, studentId) || other.studentId == studentId)&&(identical(other.name, name) || other.name == name)&&(identical(other.studentName, studentName) || other.studentName == studentName)&&(identical(other.admissionNo, admissionNo) || other.admissionNo == admissionNo)&&(identical(other.admissionNumber, admissionNumber) || other.admissionNumber == admissionNumber)&&(identical(other.className, className) || other.className == className)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.section, section) || other.section == section)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.schoolName, schoolName) || other.schoolName == schoolName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,studentId,name,studentName,admissionNo,admissionNumber,className,grade,section,schoolId,schoolName);

@override
String toString() {
  return 'StudentSummaryDto(id: $id, studentId: $studentId, name: $name, studentName: $studentName, admissionNo: $admissionNo, admissionNumber: $admissionNumber, className: $className, grade: $grade, section: $section, schoolId: $schoolId, schoolName: $schoolName)';
}


}

/// @nodoc
abstract mixin class $StudentSummaryDtoCopyWith<$Res>  {
  factory $StudentSummaryDtoCopyWith(StudentSummaryDto value, $Res Function(StudentSummaryDto) _then) = _$StudentSummaryDtoCopyWithImpl;
@useResult
$Res call({
 int? id, int? studentId, String? name, String? studentName, String? admissionNo, String? admissionNumber, String? className, String? grade, String? section, int? schoolId, String? schoolName
});




}
/// @nodoc
class _$StudentSummaryDtoCopyWithImpl<$Res>
    implements $StudentSummaryDtoCopyWith<$Res> {
  _$StudentSummaryDtoCopyWithImpl(this._self, this._then);

  final StudentSummaryDto _self;
  final $Res Function(StudentSummaryDto) _then;

/// Create a copy of StudentSummaryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? studentId = freezed,Object? name = freezed,Object? studentName = freezed,Object? admissionNo = freezed,Object? admissionNumber = freezed,Object? className = freezed,Object? grade = freezed,Object? section = freezed,Object? schoolId = freezed,Object? schoolName = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,studentId: freezed == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,studentName: freezed == studentName ? _self.studentName : studentName // ignore: cast_nullable_to_non_nullable
as String?,admissionNo: freezed == admissionNo ? _self.admissionNo : admissionNo // ignore: cast_nullable_to_non_nullable
as String?,admissionNumber: freezed == admissionNumber ? _self.admissionNumber : admissionNumber // ignore: cast_nullable_to_non_nullable
as String?,className: freezed == className ? _self.className : className // ignore: cast_nullable_to_non_nullable
as String?,grade: freezed == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as String?,section: freezed == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as String?,schoolId: freezed == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as int?,schoolName: freezed == schoolName ? _self.schoolName : schoolName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StudentSummaryDto].
extension StudentSummaryDtoPatterns on StudentSummaryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentSummaryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentSummaryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentSummaryDto value)  $default,){
final _that = this;
switch (_that) {
case _StudentSummaryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentSummaryDto value)?  $default,){
final _that = this;
switch (_that) {
case _StudentSummaryDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int? studentId,  String? name,  String? studentName,  String? admissionNo,  String? admissionNumber,  String? className,  String? grade,  String? section,  int? schoolId,  String? schoolName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentSummaryDto() when $default != null:
return $default(_that.id,_that.studentId,_that.name,_that.studentName,_that.admissionNo,_that.admissionNumber,_that.className,_that.grade,_that.section,_that.schoolId,_that.schoolName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int? studentId,  String? name,  String? studentName,  String? admissionNo,  String? admissionNumber,  String? className,  String? grade,  String? section,  int? schoolId,  String? schoolName)  $default,) {final _that = this;
switch (_that) {
case _StudentSummaryDto():
return $default(_that.id,_that.studentId,_that.name,_that.studentName,_that.admissionNo,_that.admissionNumber,_that.className,_that.grade,_that.section,_that.schoolId,_that.schoolName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int? studentId,  String? name,  String? studentName,  String? admissionNo,  String? admissionNumber,  String? className,  String? grade,  String? section,  int? schoolId,  String? schoolName)?  $default,) {final _that = this;
switch (_that) {
case _StudentSummaryDto() when $default != null:
return $default(_that.id,_that.studentId,_that.name,_that.studentName,_that.admissionNo,_that.admissionNumber,_that.className,_that.grade,_that.section,_that.schoolId,_that.schoolName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StudentSummaryDto implements StudentSummaryDto {
  const _StudentSummaryDto({this.id, this.studentId, this.name, this.studentName, this.admissionNo, this.admissionNumber, this.className, this.grade, this.section, this.schoolId, this.schoolName});
  factory _StudentSummaryDto.fromJson(Map<String, dynamic> json) => _$StudentSummaryDtoFromJson(json);

@override final  int? id;
@override final  int? studentId;
@override final  String? name;
@override final  String? studentName;
@override final  String? admissionNo;
@override final  String? admissionNumber;
@override final  String? className;
@override final  String? grade;
@override final  String? section;
@override final  int? schoolId;
@override final  String? schoolName;

/// Create a copy of StudentSummaryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentSummaryDtoCopyWith<_StudentSummaryDto> get copyWith => __$StudentSummaryDtoCopyWithImpl<_StudentSummaryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudentSummaryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentSummaryDto&&(identical(other.id, id) || other.id == id)&&(identical(other.studentId, studentId) || other.studentId == studentId)&&(identical(other.name, name) || other.name == name)&&(identical(other.studentName, studentName) || other.studentName == studentName)&&(identical(other.admissionNo, admissionNo) || other.admissionNo == admissionNo)&&(identical(other.admissionNumber, admissionNumber) || other.admissionNumber == admissionNumber)&&(identical(other.className, className) || other.className == className)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.section, section) || other.section == section)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.schoolName, schoolName) || other.schoolName == schoolName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,studentId,name,studentName,admissionNo,admissionNumber,className,grade,section,schoolId,schoolName);

@override
String toString() {
  return 'StudentSummaryDto(id: $id, studentId: $studentId, name: $name, studentName: $studentName, admissionNo: $admissionNo, admissionNumber: $admissionNumber, className: $className, grade: $grade, section: $section, schoolId: $schoolId, schoolName: $schoolName)';
}


}

/// @nodoc
abstract mixin class _$StudentSummaryDtoCopyWith<$Res> implements $StudentSummaryDtoCopyWith<$Res> {
  factory _$StudentSummaryDtoCopyWith(_StudentSummaryDto value, $Res Function(_StudentSummaryDto) _then) = __$StudentSummaryDtoCopyWithImpl;
@override @useResult
$Res call({
 int? id, int? studentId, String? name, String? studentName, String? admissionNo, String? admissionNumber, String? className, String? grade, String? section, int? schoolId, String? schoolName
});




}
/// @nodoc
class __$StudentSummaryDtoCopyWithImpl<$Res>
    implements _$StudentSummaryDtoCopyWith<$Res> {
  __$StudentSummaryDtoCopyWithImpl(this._self, this._then);

  final _StudentSummaryDto _self;
  final $Res Function(_StudentSummaryDto) _then;

/// Create a copy of StudentSummaryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? studentId = freezed,Object? name = freezed,Object? studentName = freezed,Object? admissionNo = freezed,Object? admissionNumber = freezed,Object? className = freezed,Object? grade = freezed,Object? section = freezed,Object? schoolId = freezed,Object? schoolName = freezed,}) {
  return _then(_StudentSummaryDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,studentId: freezed == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,studentName: freezed == studentName ? _self.studentName : studentName // ignore: cast_nullable_to_non_nullable
as String?,admissionNo: freezed == admissionNo ? _self.admissionNo : admissionNo // ignore: cast_nullable_to_non_nullable
as String?,admissionNumber: freezed == admissionNumber ? _self.admissionNumber : admissionNumber // ignore: cast_nullable_to_non_nullable
as String?,className: freezed == className ? _self.className : className // ignore: cast_nullable_to_non_nullable
as String?,grade: freezed == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as String?,section: freezed == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as String?,schoolId: freezed == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as int?,schoolName: freezed == schoolName ? _self.schoolName : schoolName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PersonaDto {

 String get roleId; String get roleName; String get archetype;
/// Create a copy of PersonaDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PersonaDtoCopyWith<PersonaDto> get copyWith => _$PersonaDtoCopyWithImpl<PersonaDto>(this as PersonaDto, _$identity);

  /// Serializes this PersonaDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PersonaDto&&(identical(other.roleId, roleId) || other.roleId == roleId)&&(identical(other.roleName, roleName) || other.roleName == roleName)&&(identical(other.archetype, archetype) || other.archetype == archetype));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,roleId,roleName,archetype);

@override
String toString() {
  return 'PersonaDto(roleId: $roleId, roleName: $roleName, archetype: $archetype)';
}


}

/// @nodoc
abstract mixin class $PersonaDtoCopyWith<$Res>  {
  factory $PersonaDtoCopyWith(PersonaDto value, $Res Function(PersonaDto) _then) = _$PersonaDtoCopyWithImpl;
@useResult
$Res call({
 String roleId, String roleName, String archetype
});




}
/// @nodoc
class _$PersonaDtoCopyWithImpl<$Res>
    implements $PersonaDtoCopyWith<$Res> {
  _$PersonaDtoCopyWithImpl(this._self, this._then);

  final PersonaDto _self;
  final $Res Function(PersonaDto) _then;

/// Create a copy of PersonaDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? roleId = null,Object? roleName = null,Object? archetype = null,}) {
  return _then(_self.copyWith(
roleId: null == roleId ? _self.roleId : roleId // ignore: cast_nullable_to_non_nullable
as String,roleName: null == roleName ? _self.roleName : roleName // ignore: cast_nullable_to_non_nullable
as String,archetype: null == archetype ? _self.archetype : archetype // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PersonaDto].
extension PersonaDtoPatterns on PersonaDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PersonaDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PersonaDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PersonaDto value)  $default,){
final _that = this;
switch (_that) {
case _PersonaDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PersonaDto value)?  $default,){
final _that = this;
switch (_that) {
case _PersonaDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String roleId,  String roleName,  String archetype)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PersonaDto() when $default != null:
return $default(_that.roleId,_that.roleName,_that.archetype);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String roleId,  String roleName,  String archetype)  $default,) {final _that = this;
switch (_that) {
case _PersonaDto():
return $default(_that.roleId,_that.roleName,_that.archetype);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String roleId,  String roleName,  String archetype)?  $default,) {final _that = this;
switch (_that) {
case _PersonaDto() when $default != null:
return $default(_that.roleId,_that.roleName,_that.archetype);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PersonaDto implements PersonaDto {
  const _PersonaDto({required this.roleId, required this.roleName, required this.archetype});
  factory _PersonaDto.fromJson(Map<String, dynamic> json) => _$PersonaDtoFromJson(json);

@override final  String roleId;
@override final  String roleName;
@override final  String archetype;

/// Create a copy of PersonaDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PersonaDtoCopyWith<_PersonaDto> get copyWith => __$PersonaDtoCopyWithImpl<_PersonaDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PersonaDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PersonaDto&&(identical(other.roleId, roleId) || other.roleId == roleId)&&(identical(other.roleName, roleName) || other.roleName == roleName)&&(identical(other.archetype, archetype) || other.archetype == archetype));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,roleId,roleName,archetype);

@override
String toString() {
  return 'PersonaDto(roleId: $roleId, roleName: $roleName, archetype: $archetype)';
}


}

/// @nodoc
abstract mixin class _$PersonaDtoCopyWith<$Res> implements $PersonaDtoCopyWith<$Res> {
  factory _$PersonaDtoCopyWith(_PersonaDto value, $Res Function(_PersonaDto) _then) = __$PersonaDtoCopyWithImpl;
@override @useResult
$Res call({
 String roleId, String roleName, String archetype
});




}
/// @nodoc
class __$PersonaDtoCopyWithImpl<$Res>
    implements _$PersonaDtoCopyWith<$Res> {
  __$PersonaDtoCopyWithImpl(this._self, this._then);

  final _PersonaDto _self;
  final $Res Function(_PersonaDto) _then;

/// Create a copy of PersonaDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? roleId = null,Object? roleName = null,Object? archetype = null,}) {
  return _then(_PersonaDto(
roleId: null == roleId ? _self.roleId : roleId // ignore: cast_nullable_to_non_nullable
as String,roleName: null == roleName ? _self.roleName : roleName // ignore: cast_nullable_to_non_nullable
as String,archetype: null == archetype ? _self.archetype : archetype // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PermissionDto {

 String get key; String get scope;
/// Create a copy of PermissionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PermissionDtoCopyWith<PermissionDto> get copyWith => _$PermissionDtoCopyWithImpl<PermissionDto>(this as PermissionDto, _$identity);

  /// Serializes this PermissionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PermissionDto&&(identical(other.key, key) || other.key == key)&&(identical(other.scope, scope) || other.scope == scope));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,scope);

@override
String toString() {
  return 'PermissionDto(key: $key, scope: $scope)';
}


}

/// @nodoc
abstract mixin class $PermissionDtoCopyWith<$Res>  {
  factory $PermissionDtoCopyWith(PermissionDto value, $Res Function(PermissionDto) _then) = _$PermissionDtoCopyWithImpl;
@useResult
$Res call({
 String key, String scope
});




}
/// @nodoc
class _$PermissionDtoCopyWithImpl<$Res>
    implements $PermissionDtoCopyWith<$Res> {
  _$PermissionDtoCopyWithImpl(this._self, this._then);

  final PermissionDto _self;
  final $Res Function(PermissionDto) _then;

/// Create a copy of PermissionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? scope = null,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PermissionDto].
extension PermissionDtoPatterns on PermissionDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PermissionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PermissionDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PermissionDto value)  $default,){
final _that = this;
switch (_that) {
case _PermissionDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PermissionDto value)?  $default,){
final _that = this;
switch (_that) {
case _PermissionDto() when $default != null:
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
case _PermissionDto() when $default != null:
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
case _PermissionDto():
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
case _PermissionDto() when $default != null:
return $default(_that.key,_that.scope);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PermissionDto implements PermissionDto {
  const _PermissionDto({required this.key, required this.scope});
  factory _PermissionDto.fromJson(Map<String, dynamic> json) => _$PermissionDtoFromJson(json);

@override final  String key;
@override final  String scope;

/// Create a copy of PermissionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PermissionDtoCopyWith<_PermissionDto> get copyWith => __$PermissionDtoCopyWithImpl<_PermissionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PermissionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PermissionDto&&(identical(other.key, key) || other.key == key)&&(identical(other.scope, scope) || other.scope == scope));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,scope);

@override
String toString() {
  return 'PermissionDto(key: $key, scope: $scope)';
}


}

/// @nodoc
abstract mixin class _$PermissionDtoCopyWith<$Res> implements $PermissionDtoCopyWith<$Res> {
  factory _$PermissionDtoCopyWith(_PermissionDto value, $Res Function(_PermissionDto) _then) = __$PermissionDtoCopyWithImpl;
@override @useResult
$Res call({
 String key, String scope
});




}
/// @nodoc
class __$PermissionDtoCopyWithImpl<$Res>
    implements _$PermissionDtoCopyWith<$Res> {
  __$PermissionDtoCopyWithImpl(this._self, this._then);

  final _PermissionDto _self;
  final $Res Function(_PermissionDto) _then;

/// Create a copy of PermissionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? scope = null,}) {
  return _then(_PermissionDto(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$LoginVerifyResponse {

 int get userId; String get phone; String? get name; String? get email; String get primaryRole; List<String> get roles; List<UserSchoolResponse> get schools; bool get requiresSchoolSelection; bool get requiresStudentSelection; List<StudentSummaryDto> get students; String? get accessToken; String? get refreshToken; List<PermissionDto> get permissions; List<PersonaDto>? get availablePersonas; PersonaDto? get activePersona;
/// Create a copy of LoginVerifyResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginVerifyResponseCopyWith<LoginVerifyResponse> get copyWith => _$LoginVerifyResponseCopyWithImpl<LoginVerifyResponse>(this as LoginVerifyResponse, _$identity);

  /// Serializes this LoginVerifyResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginVerifyResponse&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.primaryRole, primaryRole) || other.primaryRole == primaryRole)&&const DeepCollectionEquality().equals(other.roles, roles)&&const DeepCollectionEquality().equals(other.schools, schools)&&(identical(other.requiresSchoolSelection, requiresSchoolSelection) || other.requiresSchoolSelection == requiresSchoolSelection)&&(identical(other.requiresStudentSelection, requiresStudentSelection) || other.requiresStudentSelection == requiresStudentSelection)&&const DeepCollectionEquality().equals(other.students, students)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&const DeepCollectionEquality().equals(other.permissions, permissions)&&const DeepCollectionEquality().equals(other.availablePersonas, availablePersonas)&&(identical(other.activePersona, activePersona) || other.activePersona == activePersona));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,phone,name,email,primaryRole,const DeepCollectionEquality().hash(roles),const DeepCollectionEquality().hash(schools),requiresSchoolSelection,requiresStudentSelection,const DeepCollectionEquality().hash(students),accessToken,refreshToken,const DeepCollectionEquality().hash(permissions),const DeepCollectionEquality().hash(availablePersonas),activePersona);

@override
String toString() {
  return 'LoginVerifyResponse(userId: $userId, phone: $phone, name: $name, email: $email, primaryRole: $primaryRole, roles: $roles, schools: $schools, requiresSchoolSelection: $requiresSchoolSelection, requiresStudentSelection: $requiresStudentSelection, students: $students, accessToken: $accessToken, refreshToken: $refreshToken, permissions: $permissions, availablePersonas: $availablePersonas, activePersona: $activePersona)';
}


}

/// @nodoc
abstract mixin class $LoginVerifyResponseCopyWith<$Res>  {
  factory $LoginVerifyResponseCopyWith(LoginVerifyResponse value, $Res Function(LoginVerifyResponse) _then) = _$LoginVerifyResponseCopyWithImpl;
@useResult
$Res call({
 int userId, String phone, String? name, String? email, String primaryRole, List<String> roles, List<UserSchoolResponse> schools, bool requiresSchoolSelection, bool requiresStudentSelection, List<StudentSummaryDto> students, String? accessToken, String? refreshToken, List<PermissionDto> permissions, List<PersonaDto>? availablePersonas, PersonaDto? activePersona
});


$PersonaDtoCopyWith<$Res>? get activePersona;

}
/// @nodoc
class _$LoginVerifyResponseCopyWithImpl<$Res>
    implements $LoginVerifyResponseCopyWith<$Res> {
  _$LoginVerifyResponseCopyWithImpl(this._self, this._then);

  final LoginVerifyResponse _self;
  final $Res Function(LoginVerifyResponse) _then;

/// Create a copy of LoginVerifyResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? phone = null,Object? name = freezed,Object? email = freezed,Object? primaryRole = null,Object? roles = null,Object? schools = null,Object? requiresSchoolSelection = null,Object? requiresStudentSelection = null,Object? students = null,Object? accessToken = freezed,Object? refreshToken = freezed,Object? permissions = null,Object? availablePersonas = freezed,Object? activePersona = freezed,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,primaryRole: null == primaryRole ? _self.primaryRole : primaryRole // ignore: cast_nullable_to_non_nullable
as String,roles: null == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<String>,schools: null == schools ? _self.schools : schools // ignore: cast_nullable_to_non_nullable
as List<UserSchoolResponse>,requiresSchoolSelection: null == requiresSchoolSelection ? _self.requiresSchoolSelection : requiresSchoolSelection // ignore: cast_nullable_to_non_nullable
as bool,requiresStudentSelection: null == requiresStudentSelection ? _self.requiresStudentSelection : requiresStudentSelection // ignore: cast_nullable_to_non_nullable
as bool,students: null == students ? _self.students : students // ignore: cast_nullable_to_non_nullable
as List<StudentSummaryDto>,accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,permissions: null == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<PermissionDto>,availablePersonas: freezed == availablePersonas ? _self.availablePersonas : availablePersonas // ignore: cast_nullable_to_non_nullable
as List<PersonaDto>?,activePersona: freezed == activePersona ? _self.activePersona : activePersona // ignore: cast_nullable_to_non_nullable
as PersonaDto?,
  ));
}
/// Create a copy of LoginVerifyResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonaDtoCopyWith<$Res>? get activePersona {
    if (_self.activePersona == null) {
    return null;
  }

  return $PersonaDtoCopyWith<$Res>(_self.activePersona!, (value) {
    return _then(_self.copyWith(activePersona: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int userId,  String phone,  String? name,  String? email,  String primaryRole,  List<String> roles,  List<UserSchoolResponse> schools,  bool requiresSchoolSelection,  bool requiresStudentSelection,  List<StudentSummaryDto> students,  String? accessToken,  String? refreshToken,  List<PermissionDto> permissions,  List<PersonaDto>? availablePersonas,  PersonaDto? activePersona)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginVerifyResponse() when $default != null:
return $default(_that.userId,_that.phone,_that.name,_that.email,_that.primaryRole,_that.roles,_that.schools,_that.requiresSchoolSelection,_that.requiresStudentSelection,_that.students,_that.accessToken,_that.refreshToken,_that.permissions,_that.availablePersonas,_that.activePersona);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int userId,  String phone,  String? name,  String? email,  String primaryRole,  List<String> roles,  List<UserSchoolResponse> schools,  bool requiresSchoolSelection,  bool requiresStudentSelection,  List<StudentSummaryDto> students,  String? accessToken,  String? refreshToken,  List<PermissionDto> permissions,  List<PersonaDto>? availablePersonas,  PersonaDto? activePersona)  $default,) {final _that = this;
switch (_that) {
case _LoginVerifyResponse():
return $default(_that.userId,_that.phone,_that.name,_that.email,_that.primaryRole,_that.roles,_that.schools,_that.requiresSchoolSelection,_that.requiresStudentSelection,_that.students,_that.accessToken,_that.refreshToken,_that.permissions,_that.availablePersonas,_that.activePersona);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int userId,  String phone,  String? name,  String? email,  String primaryRole,  List<String> roles,  List<UserSchoolResponse> schools,  bool requiresSchoolSelection,  bool requiresStudentSelection,  List<StudentSummaryDto> students,  String? accessToken,  String? refreshToken,  List<PermissionDto> permissions,  List<PersonaDto>? availablePersonas,  PersonaDto? activePersona)?  $default,) {final _that = this;
switch (_that) {
case _LoginVerifyResponse() when $default != null:
return $default(_that.userId,_that.phone,_that.name,_that.email,_that.primaryRole,_that.roles,_that.schools,_that.requiresSchoolSelection,_that.requiresStudentSelection,_that.students,_that.accessToken,_that.refreshToken,_that.permissions,_that.availablePersonas,_that.activePersona);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginVerifyResponse implements LoginVerifyResponse {
  const _LoginVerifyResponse({required this.userId, required this.phone, this.name, this.email, required this.primaryRole, required final  List<String> roles, required final  List<UserSchoolResponse> schools, required this.requiresSchoolSelection, required this.requiresStudentSelection, required final  List<StudentSummaryDto> students, this.accessToken, this.refreshToken, required final  List<PermissionDto> permissions, final  List<PersonaDto>? availablePersonas, this.activePersona}): _roles = roles,_schools = schools,_students = students,_permissions = permissions,_availablePersonas = availablePersonas;
  factory _LoginVerifyResponse.fromJson(Map<String, dynamic> json) => _$LoginVerifyResponseFromJson(json);

@override final  int userId;
@override final  String phone;
@override final  String? name;
@override final  String? email;
@override final  String primaryRole;
 final  List<String> _roles;
@override List<String> get roles {
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roles);
}

 final  List<UserSchoolResponse> _schools;
@override List<UserSchoolResponse> get schools {
  if (_schools is EqualUnmodifiableListView) return _schools;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_schools);
}

@override final  bool requiresSchoolSelection;
@override final  bool requiresStudentSelection;
 final  List<StudentSummaryDto> _students;
@override List<StudentSummaryDto> get students {
  if (_students is EqualUnmodifiableListView) return _students;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_students);
}

@override final  String? accessToken;
@override final  String? refreshToken;
 final  List<PermissionDto> _permissions;
@override List<PermissionDto> get permissions {
  if (_permissions is EqualUnmodifiableListView) return _permissions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_permissions);
}

 final  List<PersonaDto>? _availablePersonas;
@override List<PersonaDto>? get availablePersonas {
  final value = _availablePersonas;
  if (value == null) return null;
  if (_availablePersonas is EqualUnmodifiableListView) return _availablePersonas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  PersonaDto? activePersona;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginVerifyResponse&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.primaryRole, primaryRole) || other.primaryRole == primaryRole)&&const DeepCollectionEquality().equals(other._roles, _roles)&&const DeepCollectionEquality().equals(other._schools, _schools)&&(identical(other.requiresSchoolSelection, requiresSchoolSelection) || other.requiresSchoolSelection == requiresSchoolSelection)&&(identical(other.requiresStudentSelection, requiresStudentSelection) || other.requiresStudentSelection == requiresStudentSelection)&&const DeepCollectionEquality().equals(other._students, _students)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&const DeepCollectionEquality().equals(other._permissions, _permissions)&&const DeepCollectionEquality().equals(other._availablePersonas, _availablePersonas)&&(identical(other.activePersona, activePersona) || other.activePersona == activePersona));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,phone,name,email,primaryRole,const DeepCollectionEquality().hash(_roles),const DeepCollectionEquality().hash(_schools),requiresSchoolSelection,requiresStudentSelection,const DeepCollectionEquality().hash(_students),accessToken,refreshToken,const DeepCollectionEquality().hash(_permissions),const DeepCollectionEquality().hash(_availablePersonas),activePersona);

@override
String toString() {
  return 'LoginVerifyResponse(userId: $userId, phone: $phone, name: $name, email: $email, primaryRole: $primaryRole, roles: $roles, schools: $schools, requiresSchoolSelection: $requiresSchoolSelection, requiresStudentSelection: $requiresStudentSelection, students: $students, accessToken: $accessToken, refreshToken: $refreshToken, permissions: $permissions, availablePersonas: $availablePersonas, activePersona: $activePersona)';
}


}

/// @nodoc
abstract mixin class _$LoginVerifyResponseCopyWith<$Res> implements $LoginVerifyResponseCopyWith<$Res> {
  factory _$LoginVerifyResponseCopyWith(_LoginVerifyResponse value, $Res Function(_LoginVerifyResponse) _then) = __$LoginVerifyResponseCopyWithImpl;
@override @useResult
$Res call({
 int userId, String phone, String? name, String? email, String primaryRole, List<String> roles, List<UserSchoolResponse> schools, bool requiresSchoolSelection, bool requiresStudentSelection, List<StudentSummaryDto> students, String? accessToken, String? refreshToken, List<PermissionDto> permissions, List<PersonaDto>? availablePersonas, PersonaDto? activePersona
});


@override $PersonaDtoCopyWith<$Res>? get activePersona;

}
/// @nodoc
class __$LoginVerifyResponseCopyWithImpl<$Res>
    implements _$LoginVerifyResponseCopyWith<$Res> {
  __$LoginVerifyResponseCopyWithImpl(this._self, this._then);

  final _LoginVerifyResponse _self;
  final $Res Function(_LoginVerifyResponse) _then;

/// Create a copy of LoginVerifyResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? phone = null,Object? name = freezed,Object? email = freezed,Object? primaryRole = null,Object? roles = null,Object? schools = null,Object? requiresSchoolSelection = null,Object? requiresStudentSelection = null,Object? students = null,Object? accessToken = freezed,Object? refreshToken = freezed,Object? permissions = null,Object? availablePersonas = freezed,Object? activePersona = freezed,}) {
  return _then(_LoginVerifyResponse(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,primaryRole: null == primaryRole ? _self.primaryRole : primaryRole // ignore: cast_nullable_to_non_nullable
as String,roles: null == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<String>,schools: null == schools ? _self._schools : schools // ignore: cast_nullable_to_non_nullable
as List<UserSchoolResponse>,requiresSchoolSelection: null == requiresSchoolSelection ? _self.requiresSchoolSelection : requiresSchoolSelection // ignore: cast_nullable_to_non_nullable
as bool,requiresStudentSelection: null == requiresStudentSelection ? _self.requiresStudentSelection : requiresStudentSelection // ignore: cast_nullable_to_non_nullable
as bool,students: null == students ? _self._students : students // ignore: cast_nullable_to_non_nullable
as List<StudentSummaryDto>,accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,permissions: null == permissions ? _self._permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<PermissionDto>,availablePersonas: freezed == availablePersonas ? _self._availablePersonas : availablePersonas // ignore: cast_nullable_to_non_nullable
as List<PersonaDto>?,activePersona: freezed == activePersona ? _self.activePersona : activePersona // ignore: cast_nullable_to_non_nullable
as PersonaDto?,
  ));
}

/// Create a copy of LoginVerifyResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonaDtoCopyWith<$Res>? get activePersona {
    if (_self.activePersona == null) {
    return null;
  }

  return $PersonaDtoCopyWith<$Res>(_self.activePersona!, (value) {
    return _then(_self.copyWith(activePersona: value));
  });
}
}


/// @nodoc
mixin _$AuthTokenResponse {

 int get userId; String get name; int? get schoolId; int? get studentId; String get role; String get accessToken; String get refreshToken; List<PermissionDto> get permissions; List<PersonaDto>? get availablePersonas; PersonaDto? get activePersona;
/// Create a copy of AuthTokenResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthTokenResponseCopyWith<AuthTokenResponse> get copyWith => _$AuthTokenResponseCopyWithImpl<AuthTokenResponse>(this as AuthTokenResponse, _$identity);

  /// Serializes this AuthTokenResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthTokenResponse&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.studentId, studentId) || other.studentId == studentId)&&(identical(other.role, role) || other.role == role)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&const DeepCollectionEquality().equals(other.permissions, permissions)&&const DeepCollectionEquality().equals(other.availablePersonas, availablePersonas)&&(identical(other.activePersona, activePersona) || other.activePersona == activePersona));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,name,schoolId,studentId,role,accessToken,refreshToken,const DeepCollectionEquality().hash(permissions),const DeepCollectionEquality().hash(availablePersonas),activePersona);

@override
String toString() {
  return 'AuthTokenResponse(userId: $userId, name: $name, schoolId: $schoolId, studentId: $studentId, role: $role, accessToken: $accessToken, refreshToken: $refreshToken, permissions: $permissions, availablePersonas: $availablePersonas, activePersona: $activePersona)';
}


}

/// @nodoc
abstract mixin class $AuthTokenResponseCopyWith<$Res>  {
  factory $AuthTokenResponseCopyWith(AuthTokenResponse value, $Res Function(AuthTokenResponse) _then) = _$AuthTokenResponseCopyWithImpl;
@useResult
$Res call({
 int userId, String name, int? schoolId, int? studentId, String role, String accessToken, String refreshToken, List<PermissionDto> permissions, List<PersonaDto>? availablePersonas, PersonaDto? activePersona
});


$PersonaDtoCopyWith<$Res>? get activePersona;

}
/// @nodoc
class _$AuthTokenResponseCopyWithImpl<$Res>
    implements $AuthTokenResponseCopyWith<$Res> {
  _$AuthTokenResponseCopyWithImpl(this._self, this._then);

  final AuthTokenResponse _self;
  final $Res Function(AuthTokenResponse) _then;

/// Create a copy of AuthTokenResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? name = null,Object? schoolId = freezed,Object? studentId = freezed,Object? role = null,Object? accessToken = null,Object? refreshToken = null,Object? permissions = null,Object? availablePersonas = freezed,Object? activePersona = freezed,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,schoolId: freezed == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as int?,studentId: freezed == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as int?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,permissions: null == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<PermissionDto>,availablePersonas: freezed == availablePersonas ? _self.availablePersonas : availablePersonas // ignore: cast_nullable_to_non_nullable
as List<PersonaDto>?,activePersona: freezed == activePersona ? _self.activePersona : activePersona // ignore: cast_nullable_to_non_nullable
as PersonaDto?,
  ));
}
/// Create a copy of AuthTokenResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonaDtoCopyWith<$Res>? get activePersona {
    if (_self.activePersona == null) {
    return null;
  }

  return $PersonaDtoCopyWith<$Res>(_self.activePersona!, (value) {
    return _then(_self.copyWith(activePersona: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuthTokenResponse].
extension AuthTokenResponsePatterns on AuthTokenResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthTokenResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthTokenResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthTokenResponse value)  $default,){
final _that = this;
switch (_that) {
case _AuthTokenResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthTokenResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AuthTokenResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int userId,  String name,  int? schoolId,  int? studentId,  String role,  String accessToken,  String refreshToken,  List<PermissionDto> permissions,  List<PersonaDto>? availablePersonas,  PersonaDto? activePersona)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthTokenResponse() when $default != null:
return $default(_that.userId,_that.name,_that.schoolId,_that.studentId,_that.role,_that.accessToken,_that.refreshToken,_that.permissions,_that.availablePersonas,_that.activePersona);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int userId,  String name,  int? schoolId,  int? studentId,  String role,  String accessToken,  String refreshToken,  List<PermissionDto> permissions,  List<PersonaDto>? availablePersonas,  PersonaDto? activePersona)  $default,) {final _that = this;
switch (_that) {
case _AuthTokenResponse():
return $default(_that.userId,_that.name,_that.schoolId,_that.studentId,_that.role,_that.accessToken,_that.refreshToken,_that.permissions,_that.availablePersonas,_that.activePersona);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int userId,  String name,  int? schoolId,  int? studentId,  String role,  String accessToken,  String refreshToken,  List<PermissionDto> permissions,  List<PersonaDto>? availablePersonas,  PersonaDto? activePersona)?  $default,) {final _that = this;
switch (_that) {
case _AuthTokenResponse() when $default != null:
return $default(_that.userId,_that.name,_that.schoolId,_that.studentId,_that.role,_that.accessToken,_that.refreshToken,_that.permissions,_that.availablePersonas,_that.activePersona);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthTokenResponse implements AuthTokenResponse {
  const _AuthTokenResponse({required this.userId, required this.name, this.schoolId, this.studentId, required this.role, required this.accessToken, required this.refreshToken, required final  List<PermissionDto> permissions, final  List<PersonaDto>? availablePersonas, this.activePersona}): _permissions = permissions,_availablePersonas = availablePersonas;
  factory _AuthTokenResponse.fromJson(Map<String, dynamic> json) => _$AuthTokenResponseFromJson(json);

@override final  int userId;
@override final  String name;
@override final  int? schoolId;
@override final  int? studentId;
@override final  String role;
@override final  String accessToken;
@override final  String refreshToken;
 final  List<PermissionDto> _permissions;
@override List<PermissionDto> get permissions {
  if (_permissions is EqualUnmodifiableListView) return _permissions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_permissions);
}

 final  List<PersonaDto>? _availablePersonas;
@override List<PersonaDto>? get availablePersonas {
  final value = _availablePersonas;
  if (value == null) return null;
  if (_availablePersonas is EqualUnmodifiableListView) return _availablePersonas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  PersonaDto? activePersona;

/// Create a copy of AuthTokenResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthTokenResponseCopyWith<_AuthTokenResponse> get copyWith => __$AuthTokenResponseCopyWithImpl<_AuthTokenResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthTokenResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthTokenResponse&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.studentId, studentId) || other.studentId == studentId)&&(identical(other.role, role) || other.role == role)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&const DeepCollectionEquality().equals(other._permissions, _permissions)&&const DeepCollectionEquality().equals(other._availablePersonas, _availablePersonas)&&(identical(other.activePersona, activePersona) || other.activePersona == activePersona));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,name,schoolId,studentId,role,accessToken,refreshToken,const DeepCollectionEquality().hash(_permissions),const DeepCollectionEquality().hash(_availablePersonas),activePersona);

@override
String toString() {
  return 'AuthTokenResponse(userId: $userId, name: $name, schoolId: $schoolId, studentId: $studentId, role: $role, accessToken: $accessToken, refreshToken: $refreshToken, permissions: $permissions, availablePersonas: $availablePersonas, activePersona: $activePersona)';
}


}

/// @nodoc
abstract mixin class _$AuthTokenResponseCopyWith<$Res> implements $AuthTokenResponseCopyWith<$Res> {
  factory _$AuthTokenResponseCopyWith(_AuthTokenResponse value, $Res Function(_AuthTokenResponse) _then) = __$AuthTokenResponseCopyWithImpl;
@override @useResult
$Res call({
 int userId, String name, int? schoolId, int? studentId, String role, String accessToken, String refreshToken, List<PermissionDto> permissions, List<PersonaDto>? availablePersonas, PersonaDto? activePersona
});


@override $PersonaDtoCopyWith<$Res>? get activePersona;

}
/// @nodoc
class __$AuthTokenResponseCopyWithImpl<$Res>
    implements _$AuthTokenResponseCopyWith<$Res> {
  __$AuthTokenResponseCopyWithImpl(this._self, this._then);

  final _AuthTokenResponse _self;
  final $Res Function(_AuthTokenResponse) _then;

/// Create a copy of AuthTokenResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? name = null,Object? schoolId = freezed,Object? studentId = freezed,Object? role = null,Object? accessToken = null,Object? refreshToken = null,Object? permissions = null,Object? availablePersonas = freezed,Object? activePersona = freezed,}) {
  return _then(_AuthTokenResponse(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,schoolId: freezed == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as int?,studentId: freezed == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as int?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,permissions: null == permissions ? _self._permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<PermissionDto>,availablePersonas: freezed == availablePersonas ? _self._availablePersonas : availablePersonas // ignore: cast_nullable_to_non_nullable
as List<PersonaDto>?,activePersona: freezed == activePersona ? _self.activePersona : activePersona // ignore: cast_nullable_to_non_nullable
as PersonaDto?,
  ));
}

/// Create a copy of AuthTokenResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonaDtoCopyWith<$Res>? get activePersona {
    if (_self.activePersona == null) {
    return null;
  }

  return $PersonaDtoCopyWith<$Res>(_self.activePersona!, (value) {
    return _then(_self.copyWith(activePersona: value));
  });
}
}

// dart format on
