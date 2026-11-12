import 'package:freezed_annotation/freezed_annotation.dart';

part 'exam_models.freezed.dart';
part 'exam_models.g.dart';

@freezed
abstract class ExamScheduleResponse with _$ExamScheduleResponse {
  const factory ExamScheduleResponse({
    int? id,
    int? schoolId,
    int? examSetupId,
    String? examName,
    String? termName,
    int? classId,
    String? className,
    int? sectionId,
    String? sectionName,
    int? subjectId,
    String? subjectName,
    String? subjectCode,
    DateTime? examDate,
    String? startTime,
    String? endTime,
    String? roomNumber,
    double? fullMarks,
    double? passingMarks,
    String? instructions,
    String? status,
  }) = _ExamScheduleResponse;

  factory ExamScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$ExamScheduleResponseFromJson(json);
}

@freezed
abstract class AdmitCardPreviewResponse with _$AdmitCardPreviewResponse {
  const factory AdmitCardPreviewResponse({
    String? schoolName,
    String? schoolCode,
    String? examName,
    String? termName,
    String? candidateName,
    String? rollNumber,
    String? admissionNo,
    String? gradeAndSection,
    String? verificationStatus,
    String? cardNumber,
    String? templateName,
    List<AdmitCardScheduleItem>? schedule,
  }) = _AdmitCardPreviewResponse;

  factory AdmitCardPreviewResponse.fromJson(Map<String, dynamic> json) =>
      _$AdmitCardPreviewResponseFromJson(json);
}

@freezed
abstract class AdmitCardScheduleItem with _$AdmitCardScheduleItem {
  const factory AdmitCardScheduleItem({
    String? subjectName,
    String? subjectCode,
    DateTime? date,
    String? startTime,
    String? endTime,
    String? formattedTime,
    String? roomNumber,
  }) = _AdmitCardScheduleItem;

  factory AdmitCardScheduleItem.fromJson(Map<String, dynamic> json) =>
      _$AdmitCardScheduleItemFromJson(json);
}

@freezed
abstract class StudentReportCardResponse with _$StudentReportCardResponse {
  const factory StudentReportCardResponse({
    int? id,
    int? studentId,
    String? studentName,
    String? rollNo,
    String? admissionNo,
    String? className,
    String? sectionName,
    String? termName,
    String? mode,
    String? templateName,
    double? totalMarks,
    double? maxMarks,
    double? percentage,
    String? grade,
    String? division,
    String? status,
    String? fileUrl,
  }) = _StudentReportCardResponse;

  factory StudentReportCardResponse.fromJson(Map<String, dynamic> json) =>
      _$StudentReportCardResponseFromJson(json);
}
