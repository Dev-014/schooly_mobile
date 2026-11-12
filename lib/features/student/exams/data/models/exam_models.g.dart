// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExamScheduleResponse _$ExamScheduleResponseFromJson(
  Map<String, dynamic> json,
) => _ExamScheduleResponse(
  id: (json['id'] as num?)?.toInt(),
  schoolId: (json['schoolId'] as num?)?.toInt(),
  examSetupId: (json['examSetupId'] as num?)?.toInt(),
  examName: json['examName'] as String?,
  termName: json['termName'] as String?,
  classId: (json['classId'] as num?)?.toInt(),
  className: json['className'] as String?,
  sectionId: (json['sectionId'] as num?)?.toInt(),
  sectionName: json['sectionName'] as String?,
  subjectId: (json['subjectId'] as num?)?.toInt(),
  subjectName: json['subjectName'] as String?,
  subjectCode: json['subjectCode'] as String?,
  examDate: json['examDate'] == null
      ? null
      : DateTime.parse(json['examDate'] as String),
  startTime: json['startTime'] as String?,
  endTime: json['endTime'] as String?,
  roomNumber: json['roomNumber'] as String?,
  fullMarks: (json['fullMarks'] as num?)?.toDouble(),
  passingMarks: (json['passingMarks'] as num?)?.toDouble(),
  instructions: json['instructions'] as String?,
  status: json['status'] as String?,
);

Map<String, dynamic> _$ExamScheduleResponseToJson(
  _ExamScheduleResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'schoolId': instance.schoolId,
  'examSetupId': instance.examSetupId,
  'examName': instance.examName,
  'termName': instance.termName,
  'classId': instance.classId,
  'className': instance.className,
  'sectionId': instance.sectionId,
  'sectionName': instance.sectionName,
  'subjectId': instance.subjectId,
  'subjectName': instance.subjectName,
  'subjectCode': instance.subjectCode,
  'examDate': instance.examDate?.toIso8601String(),
  'startTime': instance.startTime,
  'endTime': instance.endTime,
  'roomNumber': instance.roomNumber,
  'fullMarks': instance.fullMarks,
  'passingMarks': instance.passingMarks,
  'instructions': instance.instructions,
  'status': instance.status,
};

_AdmitCardPreviewResponse _$AdmitCardPreviewResponseFromJson(
  Map<String, dynamic> json,
) => _AdmitCardPreviewResponse(
  schoolName: json['schoolName'] as String?,
  schoolCode: json['schoolCode'] as String?,
  examName: json['examName'] as String?,
  termName: json['termName'] as String?,
  candidateName: json['candidateName'] as String?,
  rollNumber: json['rollNumber'] as String?,
  admissionNo: json['admissionNo'] as String?,
  gradeAndSection: json['gradeAndSection'] as String?,
  verificationStatus: json['verificationStatus'] as String?,
  cardNumber: json['cardNumber'] as String?,
  templateName: json['templateName'] as String?,
  schedule: (json['schedule'] as List<dynamic>?)
      ?.map((e) => AdmitCardScheduleItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AdmitCardPreviewResponseToJson(
  _AdmitCardPreviewResponse instance,
) => <String, dynamic>{
  'schoolName': instance.schoolName,
  'schoolCode': instance.schoolCode,
  'examName': instance.examName,
  'termName': instance.termName,
  'candidateName': instance.candidateName,
  'rollNumber': instance.rollNumber,
  'admissionNo': instance.admissionNo,
  'gradeAndSection': instance.gradeAndSection,
  'verificationStatus': instance.verificationStatus,
  'cardNumber': instance.cardNumber,
  'templateName': instance.templateName,
  'schedule': instance.schedule,
};

_AdmitCardScheduleItem _$AdmitCardScheduleItemFromJson(
  Map<String, dynamic> json,
) => _AdmitCardScheduleItem(
  subjectName: json['subjectName'] as String?,
  subjectCode: json['subjectCode'] as String?,
  date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
  startTime: json['startTime'] as String?,
  endTime: json['endTime'] as String?,
  formattedTime: json['formattedTime'] as String?,
  roomNumber: json['roomNumber'] as String?,
);

Map<String, dynamic> _$AdmitCardScheduleItemToJson(
  _AdmitCardScheduleItem instance,
) => <String, dynamic>{
  'subjectName': instance.subjectName,
  'subjectCode': instance.subjectCode,
  'date': instance.date?.toIso8601String(),
  'startTime': instance.startTime,
  'endTime': instance.endTime,
  'formattedTime': instance.formattedTime,
  'roomNumber': instance.roomNumber,
};

_StudentReportCardResponse _$StudentReportCardResponseFromJson(
  Map<String, dynamic> json,
) => _StudentReportCardResponse(
  id: (json['id'] as num?)?.toInt(),
  studentId: (json['studentId'] as num?)?.toInt(),
  studentName: json['studentName'] as String?,
  rollNo: json['rollNo'] as String?,
  admissionNo: json['admissionNo'] as String?,
  className: json['className'] as String?,
  sectionName: json['sectionName'] as String?,
  termName: json['termName'] as String?,
  mode: json['mode'] as String?,
  templateName: json['templateName'] as String?,
  totalMarks: (json['totalMarks'] as num?)?.toDouble(),
  maxMarks: (json['maxMarks'] as num?)?.toDouble(),
  percentage: (json['percentage'] as num?)?.toDouble(),
  grade: json['grade'] as String?,
  division: json['division'] as String?,
  status: json['status'] as String?,
  fileUrl: json['fileUrl'] as String?,
);

Map<String, dynamic> _$StudentReportCardResponseToJson(
  _StudentReportCardResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'studentId': instance.studentId,
  'studentName': instance.studentName,
  'rollNo': instance.rollNo,
  'admissionNo': instance.admissionNo,
  'className': instance.className,
  'sectionName': instance.sectionName,
  'termName': instance.termName,
  'mode': instance.mode,
  'templateName': instance.templateName,
  'totalMarks': instance.totalMarks,
  'maxMarks': instance.maxMarks,
  'percentage': instance.percentage,
  'grade': instance.grade,
  'division': instance.division,
  'status': instance.status,
  'fileUrl': instance.fileUrl,
};
