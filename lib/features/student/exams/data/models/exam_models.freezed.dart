// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exam_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExamScheduleResponse {

 int? get id; int? get schoolId; int? get examSetupId; String? get examName; String? get termName; int? get classId; String? get className; int? get sectionId; String? get sectionName; int? get subjectId; String? get subjectName; String? get subjectCode; DateTime? get examDate; String? get startTime; String? get endTime; String? get roomNumber; double? get fullMarks; double? get passingMarks; String? get instructions; String? get status;
/// Create a copy of ExamScheduleResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExamScheduleResponseCopyWith<ExamScheduleResponse> get copyWith => _$ExamScheduleResponseCopyWithImpl<ExamScheduleResponse>(this as ExamScheduleResponse, _$identity);

  /// Serializes this ExamScheduleResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExamScheduleResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.examSetupId, examSetupId) || other.examSetupId == examSetupId)&&(identical(other.examName, examName) || other.examName == examName)&&(identical(other.termName, termName) || other.termName == termName)&&(identical(other.classId, classId) || other.classId == classId)&&(identical(other.className, className) || other.className == className)&&(identical(other.sectionId, sectionId) || other.sectionId == sectionId)&&(identical(other.sectionName, sectionName) || other.sectionName == sectionName)&&(identical(other.subjectId, subjectId) || other.subjectId == subjectId)&&(identical(other.subjectName, subjectName) || other.subjectName == subjectName)&&(identical(other.subjectCode, subjectCode) || other.subjectCode == subjectCode)&&(identical(other.examDate, examDate) || other.examDate == examDate)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.roomNumber, roomNumber) || other.roomNumber == roomNumber)&&(identical(other.fullMarks, fullMarks) || other.fullMarks == fullMarks)&&(identical(other.passingMarks, passingMarks) || other.passingMarks == passingMarks)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,schoolId,examSetupId,examName,termName,classId,className,sectionId,sectionName,subjectId,subjectName,subjectCode,examDate,startTime,endTime,roomNumber,fullMarks,passingMarks,instructions,status]);

@override
String toString() {
  return 'ExamScheduleResponse(id: $id, schoolId: $schoolId, examSetupId: $examSetupId, examName: $examName, termName: $termName, classId: $classId, className: $className, sectionId: $sectionId, sectionName: $sectionName, subjectId: $subjectId, subjectName: $subjectName, subjectCode: $subjectCode, examDate: $examDate, startTime: $startTime, endTime: $endTime, roomNumber: $roomNumber, fullMarks: $fullMarks, passingMarks: $passingMarks, instructions: $instructions, status: $status)';
}


}

/// @nodoc
abstract mixin class $ExamScheduleResponseCopyWith<$Res>  {
  factory $ExamScheduleResponseCopyWith(ExamScheduleResponse value, $Res Function(ExamScheduleResponse) _then) = _$ExamScheduleResponseCopyWithImpl;
@useResult
$Res call({
 int? id, int? schoolId, int? examSetupId, String? examName, String? termName, int? classId, String? className, int? sectionId, String? sectionName, int? subjectId, String? subjectName, String? subjectCode, DateTime? examDate, String? startTime, String? endTime, String? roomNumber, double? fullMarks, double? passingMarks, String? instructions, String? status
});




}
/// @nodoc
class _$ExamScheduleResponseCopyWithImpl<$Res>
    implements $ExamScheduleResponseCopyWith<$Res> {
  _$ExamScheduleResponseCopyWithImpl(this._self, this._then);

  final ExamScheduleResponse _self;
  final $Res Function(ExamScheduleResponse) _then;

/// Create a copy of ExamScheduleResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? schoolId = freezed,Object? examSetupId = freezed,Object? examName = freezed,Object? termName = freezed,Object? classId = freezed,Object? className = freezed,Object? sectionId = freezed,Object? sectionName = freezed,Object? subjectId = freezed,Object? subjectName = freezed,Object? subjectCode = freezed,Object? examDate = freezed,Object? startTime = freezed,Object? endTime = freezed,Object? roomNumber = freezed,Object? fullMarks = freezed,Object? passingMarks = freezed,Object? instructions = freezed,Object? status = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,schoolId: freezed == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as int?,examSetupId: freezed == examSetupId ? _self.examSetupId : examSetupId // ignore: cast_nullable_to_non_nullable
as int?,examName: freezed == examName ? _self.examName : examName // ignore: cast_nullable_to_non_nullable
as String?,termName: freezed == termName ? _self.termName : termName // ignore: cast_nullable_to_non_nullable
as String?,classId: freezed == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as int?,className: freezed == className ? _self.className : className // ignore: cast_nullable_to_non_nullable
as String?,sectionId: freezed == sectionId ? _self.sectionId : sectionId // ignore: cast_nullable_to_non_nullable
as int?,sectionName: freezed == sectionName ? _self.sectionName : sectionName // ignore: cast_nullable_to_non_nullable
as String?,subjectId: freezed == subjectId ? _self.subjectId : subjectId // ignore: cast_nullable_to_non_nullable
as int?,subjectName: freezed == subjectName ? _self.subjectName : subjectName // ignore: cast_nullable_to_non_nullable
as String?,subjectCode: freezed == subjectCode ? _self.subjectCode : subjectCode // ignore: cast_nullable_to_non_nullable
as String?,examDate: freezed == examDate ? _self.examDate : examDate // ignore: cast_nullable_to_non_nullable
as DateTime?,startTime: freezed == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String?,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String?,roomNumber: freezed == roomNumber ? _self.roomNumber : roomNumber // ignore: cast_nullable_to_non_nullable
as String?,fullMarks: freezed == fullMarks ? _self.fullMarks : fullMarks // ignore: cast_nullable_to_non_nullable
as double?,passingMarks: freezed == passingMarks ? _self.passingMarks : passingMarks // ignore: cast_nullable_to_non_nullable
as double?,instructions: freezed == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ExamScheduleResponse].
extension ExamScheduleResponsePatterns on ExamScheduleResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExamScheduleResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExamScheduleResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExamScheduleResponse value)  $default,){
final _that = this;
switch (_that) {
case _ExamScheduleResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExamScheduleResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ExamScheduleResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int? schoolId,  int? examSetupId,  String? examName,  String? termName,  int? classId,  String? className,  int? sectionId,  String? sectionName,  int? subjectId,  String? subjectName,  String? subjectCode,  DateTime? examDate,  String? startTime,  String? endTime,  String? roomNumber,  double? fullMarks,  double? passingMarks,  String? instructions,  String? status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExamScheduleResponse() when $default != null:
return $default(_that.id,_that.schoolId,_that.examSetupId,_that.examName,_that.termName,_that.classId,_that.className,_that.sectionId,_that.sectionName,_that.subjectId,_that.subjectName,_that.subjectCode,_that.examDate,_that.startTime,_that.endTime,_that.roomNumber,_that.fullMarks,_that.passingMarks,_that.instructions,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int? schoolId,  int? examSetupId,  String? examName,  String? termName,  int? classId,  String? className,  int? sectionId,  String? sectionName,  int? subjectId,  String? subjectName,  String? subjectCode,  DateTime? examDate,  String? startTime,  String? endTime,  String? roomNumber,  double? fullMarks,  double? passingMarks,  String? instructions,  String? status)  $default,) {final _that = this;
switch (_that) {
case _ExamScheduleResponse():
return $default(_that.id,_that.schoolId,_that.examSetupId,_that.examName,_that.termName,_that.classId,_that.className,_that.sectionId,_that.sectionName,_that.subjectId,_that.subjectName,_that.subjectCode,_that.examDate,_that.startTime,_that.endTime,_that.roomNumber,_that.fullMarks,_that.passingMarks,_that.instructions,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int? schoolId,  int? examSetupId,  String? examName,  String? termName,  int? classId,  String? className,  int? sectionId,  String? sectionName,  int? subjectId,  String? subjectName,  String? subjectCode,  DateTime? examDate,  String? startTime,  String? endTime,  String? roomNumber,  double? fullMarks,  double? passingMarks,  String? instructions,  String? status)?  $default,) {final _that = this;
switch (_that) {
case _ExamScheduleResponse() when $default != null:
return $default(_that.id,_that.schoolId,_that.examSetupId,_that.examName,_that.termName,_that.classId,_that.className,_that.sectionId,_that.sectionName,_that.subjectId,_that.subjectName,_that.subjectCode,_that.examDate,_that.startTime,_that.endTime,_that.roomNumber,_that.fullMarks,_that.passingMarks,_that.instructions,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExamScheduleResponse implements ExamScheduleResponse {
  const _ExamScheduleResponse({this.id, this.schoolId, this.examSetupId, this.examName, this.termName, this.classId, this.className, this.sectionId, this.sectionName, this.subjectId, this.subjectName, this.subjectCode, this.examDate, this.startTime, this.endTime, this.roomNumber, this.fullMarks, this.passingMarks, this.instructions, this.status});
  factory _ExamScheduleResponse.fromJson(Map<String, dynamic> json) => _$ExamScheduleResponseFromJson(json);

@override final  int? id;
@override final  int? schoolId;
@override final  int? examSetupId;
@override final  String? examName;
@override final  String? termName;
@override final  int? classId;
@override final  String? className;
@override final  int? sectionId;
@override final  String? sectionName;
@override final  int? subjectId;
@override final  String? subjectName;
@override final  String? subjectCode;
@override final  DateTime? examDate;
@override final  String? startTime;
@override final  String? endTime;
@override final  String? roomNumber;
@override final  double? fullMarks;
@override final  double? passingMarks;
@override final  String? instructions;
@override final  String? status;

/// Create a copy of ExamScheduleResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExamScheduleResponseCopyWith<_ExamScheduleResponse> get copyWith => __$ExamScheduleResponseCopyWithImpl<_ExamScheduleResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExamScheduleResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExamScheduleResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.examSetupId, examSetupId) || other.examSetupId == examSetupId)&&(identical(other.examName, examName) || other.examName == examName)&&(identical(other.termName, termName) || other.termName == termName)&&(identical(other.classId, classId) || other.classId == classId)&&(identical(other.className, className) || other.className == className)&&(identical(other.sectionId, sectionId) || other.sectionId == sectionId)&&(identical(other.sectionName, sectionName) || other.sectionName == sectionName)&&(identical(other.subjectId, subjectId) || other.subjectId == subjectId)&&(identical(other.subjectName, subjectName) || other.subjectName == subjectName)&&(identical(other.subjectCode, subjectCode) || other.subjectCode == subjectCode)&&(identical(other.examDate, examDate) || other.examDate == examDate)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.roomNumber, roomNumber) || other.roomNumber == roomNumber)&&(identical(other.fullMarks, fullMarks) || other.fullMarks == fullMarks)&&(identical(other.passingMarks, passingMarks) || other.passingMarks == passingMarks)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,schoolId,examSetupId,examName,termName,classId,className,sectionId,sectionName,subjectId,subjectName,subjectCode,examDate,startTime,endTime,roomNumber,fullMarks,passingMarks,instructions,status]);

@override
String toString() {
  return 'ExamScheduleResponse(id: $id, schoolId: $schoolId, examSetupId: $examSetupId, examName: $examName, termName: $termName, classId: $classId, className: $className, sectionId: $sectionId, sectionName: $sectionName, subjectId: $subjectId, subjectName: $subjectName, subjectCode: $subjectCode, examDate: $examDate, startTime: $startTime, endTime: $endTime, roomNumber: $roomNumber, fullMarks: $fullMarks, passingMarks: $passingMarks, instructions: $instructions, status: $status)';
}


}

/// @nodoc
abstract mixin class _$ExamScheduleResponseCopyWith<$Res> implements $ExamScheduleResponseCopyWith<$Res> {
  factory _$ExamScheduleResponseCopyWith(_ExamScheduleResponse value, $Res Function(_ExamScheduleResponse) _then) = __$ExamScheduleResponseCopyWithImpl;
@override @useResult
$Res call({
 int? id, int? schoolId, int? examSetupId, String? examName, String? termName, int? classId, String? className, int? sectionId, String? sectionName, int? subjectId, String? subjectName, String? subjectCode, DateTime? examDate, String? startTime, String? endTime, String? roomNumber, double? fullMarks, double? passingMarks, String? instructions, String? status
});




}
/// @nodoc
class __$ExamScheduleResponseCopyWithImpl<$Res>
    implements _$ExamScheduleResponseCopyWith<$Res> {
  __$ExamScheduleResponseCopyWithImpl(this._self, this._then);

  final _ExamScheduleResponse _self;
  final $Res Function(_ExamScheduleResponse) _then;

/// Create a copy of ExamScheduleResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? schoolId = freezed,Object? examSetupId = freezed,Object? examName = freezed,Object? termName = freezed,Object? classId = freezed,Object? className = freezed,Object? sectionId = freezed,Object? sectionName = freezed,Object? subjectId = freezed,Object? subjectName = freezed,Object? subjectCode = freezed,Object? examDate = freezed,Object? startTime = freezed,Object? endTime = freezed,Object? roomNumber = freezed,Object? fullMarks = freezed,Object? passingMarks = freezed,Object? instructions = freezed,Object? status = freezed,}) {
  return _then(_ExamScheduleResponse(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,schoolId: freezed == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as int?,examSetupId: freezed == examSetupId ? _self.examSetupId : examSetupId // ignore: cast_nullable_to_non_nullable
as int?,examName: freezed == examName ? _self.examName : examName // ignore: cast_nullable_to_non_nullable
as String?,termName: freezed == termName ? _self.termName : termName // ignore: cast_nullable_to_non_nullable
as String?,classId: freezed == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as int?,className: freezed == className ? _self.className : className // ignore: cast_nullable_to_non_nullable
as String?,sectionId: freezed == sectionId ? _self.sectionId : sectionId // ignore: cast_nullable_to_non_nullable
as int?,sectionName: freezed == sectionName ? _self.sectionName : sectionName // ignore: cast_nullable_to_non_nullable
as String?,subjectId: freezed == subjectId ? _self.subjectId : subjectId // ignore: cast_nullable_to_non_nullable
as int?,subjectName: freezed == subjectName ? _self.subjectName : subjectName // ignore: cast_nullable_to_non_nullable
as String?,subjectCode: freezed == subjectCode ? _self.subjectCode : subjectCode // ignore: cast_nullable_to_non_nullable
as String?,examDate: freezed == examDate ? _self.examDate : examDate // ignore: cast_nullable_to_non_nullable
as DateTime?,startTime: freezed == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String?,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String?,roomNumber: freezed == roomNumber ? _self.roomNumber : roomNumber // ignore: cast_nullable_to_non_nullable
as String?,fullMarks: freezed == fullMarks ? _self.fullMarks : fullMarks // ignore: cast_nullable_to_non_nullable
as double?,passingMarks: freezed == passingMarks ? _self.passingMarks : passingMarks // ignore: cast_nullable_to_non_nullable
as double?,instructions: freezed == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AdmitCardPreviewResponse {

 String? get schoolName; String? get schoolCode; String? get examName; String? get termName; String? get candidateName; String? get rollNumber; String? get admissionNo; String? get gradeAndSection; String? get verificationStatus; String? get cardNumber; String? get templateName; List<AdmitCardScheduleItem>? get schedule;
/// Create a copy of AdmitCardPreviewResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdmitCardPreviewResponseCopyWith<AdmitCardPreviewResponse> get copyWith => _$AdmitCardPreviewResponseCopyWithImpl<AdmitCardPreviewResponse>(this as AdmitCardPreviewResponse, _$identity);

  /// Serializes this AdmitCardPreviewResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdmitCardPreviewResponse&&(identical(other.schoolName, schoolName) || other.schoolName == schoolName)&&(identical(other.schoolCode, schoolCode) || other.schoolCode == schoolCode)&&(identical(other.examName, examName) || other.examName == examName)&&(identical(other.termName, termName) || other.termName == termName)&&(identical(other.candidateName, candidateName) || other.candidateName == candidateName)&&(identical(other.rollNumber, rollNumber) || other.rollNumber == rollNumber)&&(identical(other.admissionNo, admissionNo) || other.admissionNo == admissionNo)&&(identical(other.gradeAndSection, gradeAndSection) || other.gradeAndSection == gradeAndSection)&&(identical(other.verificationStatus, verificationStatus) || other.verificationStatus == verificationStatus)&&(identical(other.cardNumber, cardNumber) || other.cardNumber == cardNumber)&&(identical(other.templateName, templateName) || other.templateName == templateName)&&const DeepCollectionEquality().equals(other.schedule, schedule));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolName,schoolCode,examName,termName,candidateName,rollNumber,admissionNo,gradeAndSection,verificationStatus,cardNumber,templateName,const DeepCollectionEquality().hash(schedule));

@override
String toString() {
  return 'AdmitCardPreviewResponse(schoolName: $schoolName, schoolCode: $schoolCode, examName: $examName, termName: $termName, candidateName: $candidateName, rollNumber: $rollNumber, admissionNo: $admissionNo, gradeAndSection: $gradeAndSection, verificationStatus: $verificationStatus, cardNumber: $cardNumber, templateName: $templateName, schedule: $schedule)';
}


}

/// @nodoc
abstract mixin class $AdmitCardPreviewResponseCopyWith<$Res>  {
  factory $AdmitCardPreviewResponseCopyWith(AdmitCardPreviewResponse value, $Res Function(AdmitCardPreviewResponse) _then) = _$AdmitCardPreviewResponseCopyWithImpl;
@useResult
$Res call({
 String? schoolName, String? schoolCode, String? examName, String? termName, String? candidateName, String? rollNumber, String? admissionNo, String? gradeAndSection, String? verificationStatus, String? cardNumber, String? templateName, List<AdmitCardScheduleItem>? schedule
});




}
/// @nodoc
class _$AdmitCardPreviewResponseCopyWithImpl<$Res>
    implements $AdmitCardPreviewResponseCopyWith<$Res> {
  _$AdmitCardPreviewResponseCopyWithImpl(this._self, this._then);

  final AdmitCardPreviewResponse _self;
  final $Res Function(AdmitCardPreviewResponse) _then;

/// Create a copy of AdmitCardPreviewResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schoolName = freezed,Object? schoolCode = freezed,Object? examName = freezed,Object? termName = freezed,Object? candidateName = freezed,Object? rollNumber = freezed,Object? admissionNo = freezed,Object? gradeAndSection = freezed,Object? verificationStatus = freezed,Object? cardNumber = freezed,Object? templateName = freezed,Object? schedule = freezed,}) {
  return _then(_self.copyWith(
schoolName: freezed == schoolName ? _self.schoolName : schoolName // ignore: cast_nullable_to_non_nullable
as String?,schoolCode: freezed == schoolCode ? _self.schoolCode : schoolCode // ignore: cast_nullable_to_non_nullable
as String?,examName: freezed == examName ? _self.examName : examName // ignore: cast_nullable_to_non_nullable
as String?,termName: freezed == termName ? _self.termName : termName // ignore: cast_nullable_to_non_nullable
as String?,candidateName: freezed == candidateName ? _self.candidateName : candidateName // ignore: cast_nullable_to_non_nullable
as String?,rollNumber: freezed == rollNumber ? _self.rollNumber : rollNumber // ignore: cast_nullable_to_non_nullable
as String?,admissionNo: freezed == admissionNo ? _self.admissionNo : admissionNo // ignore: cast_nullable_to_non_nullable
as String?,gradeAndSection: freezed == gradeAndSection ? _self.gradeAndSection : gradeAndSection // ignore: cast_nullable_to_non_nullable
as String?,verificationStatus: freezed == verificationStatus ? _self.verificationStatus : verificationStatus // ignore: cast_nullable_to_non_nullable
as String?,cardNumber: freezed == cardNumber ? _self.cardNumber : cardNumber // ignore: cast_nullable_to_non_nullable
as String?,templateName: freezed == templateName ? _self.templateName : templateName // ignore: cast_nullable_to_non_nullable
as String?,schedule: freezed == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as List<AdmitCardScheduleItem>?,
  ));
}

}


/// Adds pattern-matching-related methods to [AdmitCardPreviewResponse].
extension AdmitCardPreviewResponsePatterns on AdmitCardPreviewResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdmitCardPreviewResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdmitCardPreviewResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdmitCardPreviewResponse value)  $default,){
final _that = this;
switch (_that) {
case _AdmitCardPreviewResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdmitCardPreviewResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AdmitCardPreviewResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? schoolName,  String? schoolCode,  String? examName,  String? termName,  String? candidateName,  String? rollNumber,  String? admissionNo,  String? gradeAndSection,  String? verificationStatus,  String? cardNumber,  String? templateName,  List<AdmitCardScheduleItem>? schedule)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdmitCardPreviewResponse() when $default != null:
return $default(_that.schoolName,_that.schoolCode,_that.examName,_that.termName,_that.candidateName,_that.rollNumber,_that.admissionNo,_that.gradeAndSection,_that.verificationStatus,_that.cardNumber,_that.templateName,_that.schedule);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? schoolName,  String? schoolCode,  String? examName,  String? termName,  String? candidateName,  String? rollNumber,  String? admissionNo,  String? gradeAndSection,  String? verificationStatus,  String? cardNumber,  String? templateName,  List<AdmitCardScheduleItem>? schedule)  $default,) {final _that = this;
switch (_that) {
case _AdmitCardPreviewResponse():
return $default(_that.schoolName,_that.schoolCode,_that.examName,_that.termName,_that.candidateName,_that.rollNumber,_that.admissionNo,_that.gradeAndSection,_that.verificationStatus,_that.cardNumber,_that.templateName,_that.schedule);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? schoolName,  String? schoolCode,  String? examName,  String? termName,  String? candidateName,  String? rollNumber,  String? admissionNo,  String? gradeAndSection,  String? verificationStatus,  String? cardNumber,  String? templateName,  List<AdmitCardScheduleItem>? schedule)?  $default,) {final _that = this;
switch (_that) {
case _AdmitCardPreviewResponse() when $default != null:
return $default(_that.schoolName,_that.schoolCode,_that.examName,_that.termName,_that.candidateName,_that.rollNumber,_that.admissionNo,_that.gradeAndSection,_that.verificationStatus,_that.cardNumber,_that.templateName,_that.schedule);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdmitCardPreviewResponse implements AdmitCardPreviewResponse {
  const _AdmitCardPreviewResponse({this.schoolName, this.schoolCode, this.examName, this.termName, this.candidateName, this.rollNumber, this.admissionNo, this.gradeAndSection, this.verificationStatus, this.cardNumber, this.templateName, final  List<AdmitCardScheduleItem>? schedule}): _schedule = schedule;
  factory _AdmitCardPreviewResponse.fromJson(Map<String, dynamic> json) => _$AdmitCardPreviewResponseFromJson(json);

@override final  String? schoolName;
@override final  String? schoolCode;
@override final  String? examName;
@override final  String? termName;
@override final  String? candidateName;
@override final  String? rollNumber;
@override final  String? admissionNo;
@override final  String? gradeAndSection;
@override final  String? verificationStatus;
@override final  String? cardNumber;
@override final  String? templateName;
 final  List<AdmitCardScheduleItem>? _schedule;
@override List<AdmitCardScheduleItem>? get schedule {
  final value = _schedule;
  if (value == null) return null;
  if (_schedule is EqualUnmodifiableListView) return _schedule;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of AdmitCardPreviewResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdmitCardPreviewResponseCopyWith<_AdmitCardPreviewResponse> get copyWith => __$AdmitCardPreviewResponseCopyWithImpl<_AdmitCardPreviewResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdmitCardPreviewResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdmitCardPreviewResponse&&(identical(other.schoolName, schoolName) || other.schoolName == schoolName)&&(identical(other.schoolCode, schoolCode) || other.schoolCode == schoolCode)&&(identical(other.examName, examName) || other.examName == examName)&&(identical(other.termName, termName) || other.termName == termName)&&(identical(other.candidateName, candidateName) || other.candidateName == candidateName)&&(identical(other.rollNumber, rollNumber) || other.rollNumber == rollNumber)&&(identical(other.admissionNo, admissionNo) || other.admissionNo == admissionNo)&&(identical(other.gradeAndSection, gradeAndSection) || other.gradeAndSection == gradeAndSection)&&(identical(other.verificationStatus, verificationStatus) || other.verificationStatus == verificationStatus)&&(identical(other.cardNumber, cardNumber) || other.cardNumber == cardNumber)&&(identical(other.templateName, templateName) || other.templateName == templateName)&&const DeepCollectionEquality().equals(other._schedule, _schedule));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolName,schoolCode,examName,termName,candidateName,rollNumber,admissionNo,gradeAndSection,verificationStatus,cardNumber,templateName,const DeepCollectionEquality().hash(_schedule));

@override
String toString() {
  return 'AdmitCardPreviewResponse(schoolName: $schoolName, schoolCode: $schoolCode, examName: $examName, termName: $termName, candidateName: $candidateName, rollNumber: $rollNumber, admissionNo: $admissionNo, gradeAndSection: $gradeAndSection, verificationStatus: $verificationStatus, cardNumber: $cardNumber, templateName: $templateName, schedule: $schedule)';
}


}

/// @nodoc
abstract mixin class _$AdmitCardPreviewResponseCopyWith<$Res> implements $AdmitCardPreviewResponseCopyWith<$Res> {
  factory _$AdmitCardPreviewResponseCopyWith(_AdmitCardPreviewResponse value, $Res Function(_AdmitCardPreviewResponse) _then) = __$AdmitCardPreviewResponseCopyWithImpl;
@override @useResult
$Res call({
 String? schoolName, String? schoolCode, String? examName, String? termName, String? candidateName, String? rollNumber, String? admissionNo, String? gradeAndSection, String? verificationStatus, String? cardNumber, String? templateName, List<AdmitCardScheduleItem>? schedule
});




}
/// @nodoc
class __$AdmitCardPreviewResponseCopyWithImpl<$Res>
    implements _$AdmitCardPreviewResponseCopyWith<$Res> {
  __$AdmitCardPreviewResponseCopyWithImpl(this._self, this._then);

  final _AdmitCardPreviewResponse _self;
  final $Res Function(_AdmitCardPreviewResponse) _then;

/// Create a copy of AdmitCardPreviewResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schoolName = freezed,Object? schoolCode = freezed,Object? examName = freezed,Object? termName = freezed,Object? candidateName = freezed,Object? rollNumber = freezed,Object? admissionNo = freezed,Object? gradeAndSection = freezed,Object? verificationStatus = freezed,Object? cardNumber = freezed,Object? templateName = freezed,Object? schedule = freezed,}) {
  return _then(_AdmitCardPreviewResponse(
schoolName: freezed == schoolName ? _self.schoolName : schoolName // ignore: cast_nullable_to_non_nullable
as String?,schoolCode: freezed == schoolCode ? _self.schoolCode : schoolCode // ignore: cast_nullable_to_non_nullable
as String?,examName: freezed == examName ? _self.examName : examName // ignore: cast_nullable_to_non_nullable
as String?,termName: freezed == termName ? _self.termName : termName // ignore: cast_nullable_to_non_nullable
as String?,candidateName: freezed == candidateName ? _self.candidateName : candidateName // ignore: cast_nullable_to_non_nullable
as String?,rollNumber: freezed == rollNumber ? _self.rollNumber : rollNumber // ignore: cast_nullable_to_non_nullable
as String?,admissionNo: freezed == admissionNo ? _self.admissionNo : admissionNo // ignore: cast_nullable_to_non_nullable
as String?,gradeAndSection: freezed == gradeAndSection ? _self.gradeAndSection : gradeAndSection // ignore: cast_nullable_to_non_nullable
as String?,verificationStatus: freezed == verificationStatus ? _self.verificationStatus : verificationStatus // ignore: cast_nullable_to_non_nullable
as String?,cardNumber: freezed == cardNumber ? _self.cardNumber : cardNumber // ignore: cast_nullable_to_non_nullable
as String?,templateName: freezed == templateName ? _self.templateName : templateName // ignore: cast_nullable_to_non_nullable
as String?,schedule: freezed == schedule ? _self._schedule : schedule // ignore: cast_nullable_to_non_nullable
as List<AdmitCardScheduleItem>?,
  ));
}


}


/// @nodoc
mixin _$AdmitCardScheduleItem {

 String? get subjectName; String? get subjectCode; DateTime? get date; String? get startTime; String? get endTime; String? get formattedTime; String? get roomNumber;
/// Create a copy of AdmitCardScheduleItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdmitCardScheduleItemCopyWith<AdmitCardScheduleItem> get copyWith => _$AdmitCardScheduleItemCopyWithImpl<AdmitCardScheduleItem>(this as AdmitCardScheduleItem, _$identity);

  /// Serializes this AdmitCardScheduleItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdmitCardScheduleItem&&(identical(other.subjectName, subjectName) || other.subjectName == subjectName)&&(identical(other.subjectCode, subjectCode) || other.subjectCode == subjectCode)&&(identical(other.date, date) || other.date == date)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.formattedTime, formattedTime) || other.formattedTime == formattedTime)&&(identical(other.roomNumber, roomNumber) || other.roomNumber == roomNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subjectName,subjectCode,date,startTime,endTime,formattedTime,roomNumber);

@override
String toString() {
  return 'AdmitCardScheduleItem(subjectName: $subjectName, subjectCode: $subjectCode, date: $date, startTime: $startTime, endTime: $endTime, formattedTime: $formattedTime, roomNumber: $roomNumber)';
}


}

/// @nodoc
abstract mixin class $AdmitCardScheduleItemCopyWith<$Res>  {
  factory $AdmitCardScheduleItemCopyWith(AdmitCardScheduleItem value, $Res Function(AdmitCardScheduleItem) _then) = _$AdmitCardScheduleItemCopyWithImpl;
@useResult
$Res call({
 String? subjectName, String? subjectCode, DateTime? date, String? startTime, String? endTime, String? formattedTime, String? roomNumber
});




}
/// @nodoc
class _$AdmitCardScheduleItemCopyWithImpl<$Res>
    implements $AdmitCardScheduleItemCopyWith<$Res> {
  _$AdmitCardScheduleItemCopyWithImpl(this._self, this._then);

  final AdmitCardScheduleItem _self;
  final $Res Function(AdmitCardScheduleItem) _then;

/// Create a copy of AdmitCardScheduleItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subjectName = freezed,Object? subjectCode = freezed,Object? date = freezed,Object? startTime = freezed,Object? endTime = freezed,Object? formattedTime = freezed,Object? roomNumber = freezed,}) {
  return _then(_self.copyWith(
subjectName: freezed == subjectName ? _self.subjectName : subjectName // ignore: cast_nullable_to_non_nullable
as String?,subjectCode: freezed == subjectCode ? _self.subjectCode : subjectCode // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,startTime: freezed == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String?,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String?,formattedTime: freezed == formattedTime ? _self.formattedTime : formattedTime // ignore: cast_nullable_to_non_nullable
as String?,roomNumber: freezed == roomNumber ? _self.roomNumber : roomNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AdmitCardScheduleItem].
extension AdmitCardScheduleItemPatterns on AdmitCardScheduleItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdmitCardScheduleItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdmitCardScheduleItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdmitCardScheduleItem value)  $default,){
final _that = this;
switch (_that) {
case _AdmitCardScheduleItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdmitCardScheduleItem value)?  $default,){
final _that = this;
switch (_that) {
case _AdmitCardScheduleItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? subjectName,  String? subjectCode,  DateTime? date,  String? startTime,  String? endTime,  String? formattedTime,  String? roomNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdmitCardScheduleItem() when $default != null:
return $default(_that.subjectName,_that.subjectCode,_that.date,_that.startTime,_that.endTime,_that.formattedTime,_that.roomNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? subjectName,  String? subjectCode,  DateTime? date,  String? startTime,  String? endTime,  String? formattedTime,  String? roomNumber)  $default,) {final _that = this;
switch (_that) {
case _AdmitCardScheduleItem():
return $default(_that.subjectName,_that.subjectCode,_that.date,_that.startTime,_that.endTime,_that.formattedTime,_that.roomNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? subjectName,  String? subjectCode,  DateTime? date,  String? startTime,  String? endTime,  String? formattedTime,  String? roomNumber)?  $default,) {final _that = this;
switch (_that) {
case _AdmitCardScheduleItem() when $default != null:
return $default(_that.subjectName,_that.subjectCode,_that.date,_that.startTime,_that.endTime,_that.formattedTime,_that.roomNumber);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdmitCardScheduleItem implements AdmitCardScheduleItem {
  const _AdmitCardScheduleItem({this.subjectName, this.subjectCode, this.date, this.startTime, this.endTime, this.formattedTime, this.roomNumber});
  factory _AdmitCardScheduleItem.fromJson(Map<String, dynamic> json) => _$AdmitCardScheduleItemFromJson(json);

@override final  String? subjectName;
@override final  String? subjectCode;
@override final  DateTime? date;
@override final  String? startTime;
@override final  String? endTime;
@override final  String? formattedTime;
@override final  String? roomNumber;

/// Create a copy of AdmitCardScheduleItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdmitCardScheduleItemCopyWith<_AdmitCardScheduleItem> get copyWith => __$AdmitCardScheduleItemCopyWithImpl<_AdmitCardScheduleItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdmitCardScheduleItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdmitCardScheduleItem&&(identical(other.subjectName, subjectName) || other.subjectName == subjectName)&&(identical(other.subjectCode, subjectCode) || other.subjectCode == subjectCode)&&(identical(other.date, date) || other.date == date)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.formattedTime, formattedTime) || other.formattedTime == formattedTime)&&(identical(other.roomNumber, roomNumber) || other.roomNumber == roomNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subjectName,subjectCode,date,startTime,endTime,formattedTime,roomNumber);

@override
String toString() {
  return 'AdmitCardScheduleItem(subjectName: $subjectName, subjectCode: $subjectCode, date: $date, startTime: $startTime, endTime: $endTime, formattedTime: $formattedTime, roomNumber: $roomNumber)';
}


}

/// @nodoc
abstract mixin class _$AdmitCardScheduleItemCopyWith<$Res> implements $AdmitCardScheduleItemCopyWith<$Res> {
  factory _$AdmitCardScheduleItemCopyWith(_AdmitCardScheduleItem value, $Res Function(_AdmitCardScheduleItem) _then) = __$AdmitCardScheduleItemCopyWithImpl;
@override @useResult
$Res call({
 String? subjectName, String? subjectCode, DateTime? date, String? startTime, String? endTime, String? formattedTime, String? roomNumber
});




}
/// @nodoc
class __$AdmitCardScheduleItemCopyWithImpl<$Res>
    implements _$AdmitCardScheduleItemCopyWith<$Res> {
  __$AdmitCardScheduleItemCopyWithImpl(this._self, this._then);

  final _AdmitCardScheduleItem _self;
  final $Res Function(_AdmitCardScheduleItem) _then;

/// Create a copy of AdmitCardScheduleItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subjectName = freezed,Object? subjectCode = freezed,Object? date = freezed,Object? startTime = freezed,Object? endTime = freezed,Object? formattedTime = freezed,Object? roomNumber = freezed,}) {
  return _then(_AdmitCardScheduleItem(
subjectName: freezed == subjectName ? _self.subjectName : subjectName // ignore: cast_nullable_to_non_nullable
as String?,subjectCode: freezed == subjectCode ? _self.subjectCode : subjectCode // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,startTime: freezed == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String?,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String?,formattedTime: freezed == formattedTime ? _self.formattedTime : formattedTime // ignore: cast_nullable_to_non_nullable
as String?,roomNumber: freezed == roomNumber ? _self.roomNumber : roomNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$StudentReportCardResponse {

 int? get id; int? get studentId; String? get studentName; String? get rollNo; String? get admissionNo; String? get className; String? get sectionName; String? get termName; String? get mode; String? get templateName; double? get totalMarks; double? get maxMarks; double? get percentage; String? get grade; String? get division; String? get status; String? get fileUrl;
/// Create a copy of StudentReportCardResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentReportCardResponseCopyWith<StudentReportCardResponse> get copyWith => _$StudentReportCardResponseCopyWithImpl<StudentReportCardResponse>(this as StudentReportCardResponse, _$identity);

  /// Serializes this StudentReportCardResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentReportCardResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.studentId, studentId) || other.studentId == studentId)&&(identical(other.studentName, studentName) || other.studentName == studentName)&&(identical(other.rollNo, rollNo) || other.rollNo == rollNo)&&(identical(other.admissionNo, admissionNo) || other.admissionNo == admissionNo)&&(identical(other.className, className) || other.className == className)&&(identical(other.sectionName, sectionName) || other.sectionName == sectionName)&&(identical(other.termName, termName) || other.termName == termName)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.templateName, templateName) || other.templateName == templateName)&&(identical(other.totalMarks, totalMarks) || other.totalMarks == totalMarks)&&(identical(other.maxMarks, maxMarks) || other.maxMarks == maxMarks)&&(identical(other.percentage, percentage) || other.percentage == percentage)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.division, division) || other.division == division)&&(identical(other.status, status) || other.status == status)&&(identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,studentId,studentName,rollNo,admissionNo,className,sectionName,termName,mode,templateName,totalMarks,maxMarks,percentage,grade,division,status,fileUrl);

@override
String toString() {
  return 'StudentReportCardResponse(id: $id, studentId: $studentId, studentName: $studentName, rollNo: $rollNo, admissionNo: $admissionNo, className: $className, sectionName: $sectionName, termName: $termName, mode: $mode, templateName: $templateName, totalMarks: $totalMarks, maxMarks: $maxMarks, percentage: $percentage, grade: $grade, division: $division, status: $status, fileUrl: $fileUrl)';
}


}

/// @nodoc
abstract mixin class $StudentReportCardResponseCopyWith<$Res>  {
  factory $StudentReportCardResponseCopyWith(StudentReportCardResponse value, $Res Function(StudentReportCardResponse) _then) = _$StudentReportCardResponseCopyWithImpl;
@useResult
$Res call({
 int? id, int? studentId, String? studentName, String? rollNo, String? admissionNo, String? className, String? sectionName, String? termName, String? mode, String? templateName, double? totalMarks, double? maxMarks, double? percentage, String? grade, String? division, String? status, String? fileUrl
});




}
/// @nodoc
class _$StudentReportCardResponseCopyWithImpl<$Res>
    implements $StudentReportCardResponseCopyWith<$Res> {
  _$StudentReportCardResponseCopyWithImpl(this._self, this._then);

  final StudentReportCardResponse _self;
  final $Res Function(StudentReportCardResponse) _then;

/// Create a copy of StudentReportCardResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? studentId = freezed,Object? studentName = freezed,Object? rollNo = freezed,Object? admissionNo = freezed,Object? className = freezed,Object? sectionName = freezed,Object? termName = freezed,Object? mode = freezed,Object? templateName = freezed,Object? totalMarks = freezed,Object? maxMarks = freezed,Object? percentage = freezed,Object? grade = freezed,Object? division = freezed,Object? status = freezed,Object? fileUrl = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,studentId: freezed == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as int?,studentName: freezed == studentName ? _self.studentName : studentName // ignore: cast_nullable_to_non_nullable
as String?,rollNo: freezed == rollNo ? _self.rollNo : rollNo // ignore: cast_nullable_to_non_nullable
as String?,admissionNo: freezed == admissionNo ? _self.admissionNo : admissionNo // ignore: cast_nullable_to_non_nullable
as String?,className: freezed == className ? _self.className : className // ignore: cast_nullable_to_non_nullable
as String?,sectionName: freezed == sectionName ? _self.sectionName : sectionName // ignore: cast_nullable_to_non_nullable
as String?,termName: freezed == termName ? _self.termName : termName // ignore: cast_nullable_to_non_nullable
as String?,mode: freezed == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as String?,templateName: freezed == templateName ? _self.templateName : templateName // ignore: cast_nullable_to_non_nullable
as String?,totalMarks: freezed == totalMarks ? _self.totalMarks : totalMarks // ignore: cast_nullable_to_non_nullable
as double?,maxMarks: freezed == maxMarks ? _self.maxMarks : maxMarks // ignore: cast_nullable_to_non_nullable
as double?,percentage: freezed == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as double?,grade: freezed == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as String?,division: freezed == division ? _self.division : division // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,fileUrl: freezed == fileUrl ? _self.fileUrl : fileUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StudentReportCardResponse].
extension StudentReportCardResponsePatterns on StudentReportCardResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentReportCardResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentReportCardResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentReportCardResponse value)  $default,){
final _that = this;
switch (_that) {
case _StudentReportCardResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentReportCardResponse value)?  $default,){
final _that = this;
switch (_that) {
case _StudentReportCardResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int? studentId,  String? studentName,  String? rollNo,  String? admissionNo,  String? className,  String? sectionName,  String? termName,  String? mode,  String? templateName,  double? totalMarks,  double? maxMarks,  double? percentage,  String? grade,  String? division,  String? status,  String? fileUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentReportCardResponse() when $default != null:
return $default(_that.id,_that.studentId,_that.studentName,_that.rollNo,_that.admissionNo,_that.className,_that.sectionName,_that.termName,_that.mode,_that.templateName,_that.totalMarks,_that.maxMarks,_that.percentage,_that.grade,_that.division,_that.status,_that.fileUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int? studentId,  String? studentName,  String? rollNo,  String? admissionNo,  String? className,  String? sectionName,  String? termName,  String? mode,  String? templateName,  double? totalMarks,  double? maxMarks,  double? percentage,  String? grade,  String? division,  String? status,  String? fileUrl)  $default,) {final _that = this;
switch (_that) {
case _StudentReportCardResponse():
return $default(_that.id,_that.studentId,_that.studentName,_that.rollNo,_that.admissionNo,_that.className,_that.sectionName,_that.termName,_that.mode,_that.templateName,_that.totalMarks,_that.maxMarks,_that.percentage,_that.grade,_that.division,_that.status,_that.fileUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int? studentId,  String? studentName,  String? rollNo,  String? admissionNo,  String? className,  String? sectionName,  String? termName,  String? mode,  String? templateName,  double? totalMarks,  double? maxMarks,  double? percentage,  String? grade,  String? division,  String? status,  String? fileUrl)?  $default,) {final _that = this;
switch (_that) {
case _StudentReportCardResponse() when $default != null:
return $default(_that.id,_that.studentId,_that.studentName,_that.rollNo,_that.admissionNo,_that.className,_that.sectionName,_that.termName,_that.mode,_that.templateName,_that.totalMarks,_that.maxMarks,_that.percentage,_that.grade,_that.division,_that.status,_that.fileUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StudentReportCardResponse implements StudentReportCardResponse {
  const _StudentReportCardResponse({this.id, this.studentId, this.studentName, this.rollNo, this.admissionNo, this.className, this.sectionName, this.termName, this.mode, this.templateName, this.totalMarks, this.maxMarks, this.percentage, this.grade, this.division, this.status, this.fileUrl});
  factory _StudentReportCardResponse.fromJson(Map<String, dynamic> json) => _$StudentReportCardResponseFromJson(json);

@override final  int? id;
@override final  int? studentId;
@override final  String? studentName;
@override final  String? rollNo;
@override final  String? admissionNo;
@override final  String? className;
@override final  String? sectionName;
@override final  String? termName;
@override final  String? mode;
@override final  String? templateName;
@override final  double? totalMarks;
@override final  double? maxMarks;
@override final  double? percentage;
@override final  String? grade;
@override final  String? division;
@override final  String? status;
@override final  String? fileUrl;

/// Create a copy of StudentReportCardResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentReportCardResponseCopyWith<_StudentReportCardResponse> get copyWith => __$StudentReportCardResponseCopyWithImpl<_StudentReportCardResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudentReportCardResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentReportCardResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.studentId, studentId) || other.studentId == studentId)&&(identical(other.studentName, studentName) || other.studentName == studentName)&&(identical(other.rollNo, rollNo) || other.rollNo == rollNo)&&(identical(other.admissionNo, admissionNo) || other.admissionNo == admissionNo)&&(identical(other.className, className) || other.className == className)&&(identical(other.sectionName, sectionName) || other.sectionName == sectionName)&&(identical(other.termName, termName) || other.termName == termName)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.templateName, templateName) || other.templateName == templateName)&&(identical(other.totalMarks, totalMarks) || other.totalMarks == totalMarks)&&(identical(other.maxMarks, maxMarks) || other.maxMarks == maxMarks)&&(identical(other.percentage, percentage) || other.percentage == percentage)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.division, division) || other.division == division)&&(identical(other.status, status) || other.status == status)&&(identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,studentId,studentName,rollNo,admissionNo,className,sectionName,termName,mode,templateName,totalMarks,maxMarks,percentage,grade,division,status,fileUrl);

@override
String toString() {
  return 'StudentReportCardResponse(id: $id, studentId: $studentId, studentName: $studentName, rollNo: $rollNo, admissionNo: $admissionNo, className: $className, sectionName: $sectionName, termName: $termName, mode: $mode, templateName: $templateName, totalMarks: $totalMarks, maxMarks: $maxMarks, percentage: $percentage, grade: $grade, division: $division, status: $status, fileUrl: $fileUrl)';
}


}

/// @nodoc
abstract mixin class _$StudentReportCardResponseCopyWith<$Res> implements $StudentReportCardResponseCopyWith<$Res> {
  factory _$StudentReportCardResponseCopyWith(_StudentReportCardResponse value, $Res Function(_StudentReportCardResponse) _then) = __$StudentReportCardResponseCopyWithImpl;
@override @useResult
$Res call({
 int? id, int? studentId, String? studentName, String? rollNo, String? admissionNo, String? className, String? sectionName, String? termName, String? mode, String? templateName, double? totalMarks, double? maxMarks, double? percentage, String? grade, String? division, String? status, String? fileUrl
});




}
/// @nodoc
class __$StudentReportCardResponseCopyWithImpl<$Res>
    implements _$StudentReportCardResponseCopyWith<$Res> {
  __$StudentReportCardResponseCopyWithImpl(this._self, this._then);

  final _StudentReportCardResponse _self;
  final $Res Function(_StudentReportCardResponse) _then;

/// Create a copy of StudentReportCardResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? studentId = freezed,Object? studentName = freezed,Object? rollNo = freezed,Object? admissionNo = freezed,Object? className = freezed,Object? sectionName = freezed,Object? termName = freezed,Object? mode = freezed,Object? templateName = freezed,Object? totalMarks = freezed,Object? maxMarks = freezed,Object? percentage = freezed,Object? grade = freezed,Object? division = freezed,Object? status = freezed,Object? fileUrl = freezed,}) {
  return _then(_StudentReportCardResponse(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,studentId: freezed == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as int?,studentName: freezed == studentName ? _self.studentName : studentName // ignore: cast_nullable_to_non_nullable
as String?,rollNo: freezed == rollNo ? _self.rollNo : rollNo // ignore: cast_nullable_to_non_nullable
as String?,admissionNo: freezed == admissionNo ? _self.admissionNo : admissionNo // ignore: cast_nullable_to_non_nullable
as String?,className: freezed == className ? _self.className : className // ignore: cast_nullable_to_non_nullable
as String?,sectionName: freezed == sectionName ? _self.sectionName : sectionName // ignore: cast_nullable_to_non_nullable
as String?,termName: freezed == termName ? _self.termName : termName // ignore: cast_nullable_to_non_nullable
as String?,mode: freezed == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as String?,templateName: freezed == templateName ? _self.templateName : templateName // ignore: cast_nullable_to_non_nullable
as String?,totalMarks: freezed == totalMarks ? _self.totalMarks : totalMarks // ignore: cast_nullable_to_non_nullable
as double?,maxMarks: freezed == maxMarks ? _self.maxMarks : maxMarks // ignore: cast_nullable_to_non_nullable
as double?,percentage: freezed == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as double?,grade: freezed == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as String?,division: freezed == division ? _self.division : division // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,fileUrl: freezed == fileUrl ? _self.fileUrl : fileUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
