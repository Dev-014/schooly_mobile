import 'package:freezed_annotation/freezed_annotation.dart';

part 'student_admission_model.freezed.dart';

@freezed
abstract class StudentAdmissionFormState with _$StudentAdmissionFormState {
  const factory StudentAdmissionFormState({
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String dob,
    @Default('') String gender,
    @Default('') String aadhaar,
    @Default('') String categoryId,
    @Default('') String academicYearId,
    @Default('') String classId,
    @Default('') String sectionId,
    @Default('') String houseId,
    @Default('') String bloodGroup,
    @Default('') String religion,
    @Default('') String nationality,

    @Default('new') String familyType, // 'new' or 'existing'
    @Default('') String familyId,
    @Default('') String familySearchQuery,

    @Default('') String parentName,
    @Default('') String parentPhone,
    @Default('') String parentEmail,
    @Default('') String relation,
    @Default(false) bool sameAsFather,
    @Default('') String motherName,
    @Default('') String motherPhone,

    @Default('') String previousSchool,
    @Default('') String lastGradeAttended,
    @Default('') String transferCertificateNo,
    @Default('') String pincode,
    @Default('') String city,
    @Default('') String state,

    @Default(false) bool birthCertUploaded,
    @Default('') String birthCertFileName,
  }) = _StudentAdmissionFormState;
}
