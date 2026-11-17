/// Represents a linked child of the authenticated parent.
class ParentChild {
  final int studentId;
  final String name;
  final String admissionNo;
  final String className;
  final int? rollNumber;
  final int? schoolId;
  final String? photoUrl;
  final String? house;
  final int attendancePct;

  const ParentChild({
    required this.studentId,
    required this.name,
    required this.admissionNo,
    this.className = '',
    this.rollNumber,
    this.schoolId,
    this.photoUrl,
    this.house,
    this.attendancePct = 0,
  });

  String get initials {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty || parts[0].isEmpty) return 'ST';
    if (parts.length == 1) return parts[0].substring(0, parts[0].length >= 2 ? 2 : 1).toUpperCase();
    return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
  }

  factory ParentChild.fromJson(Map<String, dynamic> json) {
    return ParentChild(
      studentId: (json['studentId'] ?? json['id'] ?? 0) as int,
      name: (json['name'] ?? json['studentName'] ?? '') as String,
      admissionNo: (json['admissionNo'] ?? json['admissionNumber'] ?? '') as String,
      className: (json['className'] ?? json['schoolClassName'] ?? '') as String,
      rollNumber: json['rollNumber'] != null ? int.tryParse(json['rollNumber'].toString()) : null,
      schoolId: (json['schoolId'] ?? 1) as int?,
      photoUrl: json['photoUrl'] as String?,
      house: json['house'] as String?,
      attendancePct: (json['attendancePct'] as num?)?.toInt() ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    'studentId': studentId,
    'name': name,
    'admissionNo': admissionNo,
    'className': className,
    'rollNumber': rollNumber,
    'schoolId': schoolId,
    'photoUrl': photoUrl,
    'house': house,
    'attendancePct': attendancePct,
  };
}

/// Aggregated fee summary for a child.
class ParentFeeSummary {
  final double totalFee;
  final double totalPaid;
  final double pendingAmount;
  final String overallStatus;
  final String? nextDueDate;

  const ParentFeeSummary({
    required this.totalFee,
    required this.totalPaid,
    required this.pendingAmount,
    this.overallStatus = 'PENDING',
    this.nextDueDate,
  });

  factory ParentFeeSummary.fromJson(Map<String, dynamic> json) {
    return ParentFeeSummary(
      totalFee: (json['totalFee'] as num?)?.toDouble() ?? 0.0,
      totalPaid: (json['totalPaid'] as num?)?.toDouble() ?? 0.0,
      pendingAmount: (json['pendingAmount'] as num?)?.toDouble() ??
          (json['pendingFee'] as num?)?.toDouble() ??
          0.0,
      overallStatus: (json['overallStatus'] ?? 'PENDING') as String,
      nextDueDate: json['nextDueDate'] as String?,
    );
  }
}

/// An individual fee invoice or due item.
class ParentFeeDue {
  final int id;
  final String title;
  final double amount;
  final double paidAmount;
  final double discountAmount;
  final String? dueDate;
  final String status;
  final int? feeCategoryId;
  final String? feeCategoryName;
  final String? termName;

  const ParentFeeDue({
    required this.id,
    required this.title,
    required this.amount,
    this.paidAmount = 0.0,
    this.discountAmount = 0.0,
    this.dueDate,
    this.status = 'PENDING',
    this.feeCategoryId,
    this.feeCategoryName,
    this.termName,
  });

  double get pendingAmount => (amount - paidAmount - discountAmount).clamp(0.0, double.infinity);

  factory ParentFeeDue.fromJson(Map<String, dynamic> json) {
    return ParentFeeDue(
      id: (json['id'] ?? 0) as int,
      title: (json['title'] ?? json['feeName'] ?? 'Fee Invoice') as String,
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
      paidAmount: (json['paidAmount'] as num?)?.toDouble() ?? 0.0,
      discountAmount: (json['discountAmount'] as num?)?.toDouble() ?? 0.0,
      dueDate: json['dueDate'] as String?,
      status: (json['status'] ?? 'PENDING') as String,
      feeCategoryId: json['feeCategoryId'] as int?,
      feeCategoryName: json['feeCategoryName'] as String?,
      termName: json['termName'] as String?,
    );
  }
}

/// A receipt or payment transaction history record.
class ParentPaymentRecord {
  final int id;
  final int? schoolId;
  final double amount;
  final String paymentMode;
  final String? transactionId;
  final String status;
  final String? receiptNumber;
  final String? studentName;
  final String? className;
  final String? paymentDate;
  final String? createdAt;

  const ParentPaymentRecord({
    required this.id,
    this.schoolId,
    required this.amount,
    this.paymentMode = 'UPI',
    this.transactionId,
    this.status = 'COMPLETED',
    this.receiptNumber,
    this.studentName,
    this.className,
    this.paymentDate,
    this.createdAt,
  });

  factory ParentPaymentRecord.fromJson(Map<String, dynamic> json) {
    return ParentPaymentRecord(
      id: (json['id'] ?? 0) as int,
      schoolId: json['schoolId'] as int?,
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
      paymentMode: (json['paymentMode'] ?? 'UPI') as String,
      transactionId: json['transactionId'] as String?,
      status: (json['status'] ?? 'COMPLETED') as String,
      receiptNumber: json['receiptNumber'] as String?,
      studentName: json['studentName'] as String?,
      className: json['className'] as String?,
      paymentDate: json['paymentDate'] as String?,
      createdAt: json['createdAt'] as String?,
    );
  }
}

/// Timetable Period representation
class ParentTimetablePeriod {
  final int? id;
  final int periodNumber;
  final String periodName;
  final String startTime;
  final String endTime;
  final bool isBreak;

  const ParentTimetablePeriod({
    this.id,
    required this.periodNumber,
    required this.periodName,
    required this.startTime,
    required this.endTime,
    this.isBreak = false,
  });

  factory ParentTimetablePeriod.fromJson(Map<String, dynamic> json) {
    return ParentTimetablePeriod(
      id: json['id'] as int?,
      periodNumber: (json['periodNumber'] as num?)?.toInt() ?? 1,
      periodName: (json['periodName'] ?? 'Period') as String,
      startTime: (json['startTime'] ?? '') as String,
      endTime: (json['endTime'] ?? '') as String,
      isBreak: (json['isBreak'] as bool?) ?? false,
    );
  }
}

/// Single timetable entry/slot for a class
class ParentTimetableEntry {
  final int? id;
  final String dayOfWeek;
  final int periodNumber;
  final String periodName;
  final String startTime;
  final String endTime;
  final bool isBreak;
  final int? subjectId;
  final String subjectName;
  final String subjectCode;
  final int? teacherId;
  final String teacherName;
  final String roomNumber;
  final String status;

  const ParentTimetableEntry({
    this.id,
    required this.dayOfWeek,
    required this.periodNumber,
    required this.periodName,
    required this.startTime,
    required this.endTime,
    this.isBreak = false,
    this.subjectId,
    required this.subjectName,
    this.subjectCode = '',
    this.teacherId,
    this.teacherName = '',
    this.roomNumber = '',
    this.status = 'ACTIVE',
  });

  factory ParentTimetableEntry.fromJson(Map<String, dynamic> json) {
    return ParentTimetableEntry(
      id: json['id'] as int?,
      dayOfWeek: (json['dayOfWeek'] ?? '') as String,
      periodNumber: (json['periodNumber'] as num?)?.toInt() ?? 1,
      periodName: (json['periodName'] ?? 'Period') as String,
      startTime: (json['startTime'] ?? '') as String,
      endTime: (json['endTime'] ?? '') as String,
      isBreak: (json['isBreak'] as bool?) ?? false,
      subjectId: json['subjectId'] as int?,
      subjectName: (json['subjectName'] ?? '') as String,
      subjectCode: (json['subjectCode'] ?? '') as String,
      teacherId: json['teacherId'] as int?,
      teacherName: (json['teacherName'] ?? '') as String,
      roomNumber: (json['roomNumber'] ?? '') as String,
      status: (json['status'] ?? 'ACTIVE') as String,
    );
  }
}

/// Full timetable response for a child
class ParentTimetableResponse {
  final int? studentId;
  final String studentName;
  final String admissionNo;
  final String className;
  final String sectionName;
  final String todayDayOfWeek;
  final List<ParentTimetablePeriod> periods;
  final List<ParentTimetableEntry> entries;

  const ParentTimetableResponse({
    this.studentId,
    this.studentName = '',
    this.admissionNo = '',
    this.className = '',
    this.sectionName = '',
    this.todayDayOfWeek = '',
    this.periods = const [],
    this.entries = const [],
  });

  factory ParentTimetableResponse.fromJson(Map<String, dynamic> json) {
    final rawPeriods = json['periods'] as List<dynamic>? ?? [];
    final rawEntries = json['entries'] as List<dynamic>? ?? [];

    return ParentTimetableResponse(
      studentId: json['studentId'] as int?,
      studentName: (json['studentName'] ?? '') as String,
      admissionNo: (json['admissionNo'] ?? '') as String,
      className: (json['className'] ?? '') as String,
      sectionName: (json['sectionName'] ?? '') as String,
      todayDayOfWeek: (json['todayDayOfWeek'] ?? '') as String,
      periods: rawPeriods
          .map((e) => ParentTimetablePeriod.fromJson(e as Map<String, dynamic>))
          .toList(),
      entries: rawEntries
          .map((e) => ParentTimetableEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Daily student attendance record
class ParentAttendanceRecord {
  final int? id;
  final int studentId;
  final int? schoolId;
  final String attendanceDate; // e.g. "2026-11-15"
  final String status; // "PRESENT", "ABSENT", "LATE", "EXCUSED"

  const ParentAttendanceRecord({
    this.id,
    required this.studentId,
    this.schoolId,
    required this.attendanceDate,
    required this.status,
  });

  factory ParentAttendanceRecord.fromJson(Map<String, dynamic> json) {
    return ParentAttendanceRecord(
      id: json['id'] as int?,
      studentId: (json['studentId'] ?? 0) as int,
      schoolId: json['schoolId'] as int?,
      attendanceDate: (json['attendanceDate'] ?? '') as String,
      status: (json['status'] ?? 'PRESENT') as String,
    );
  }
}

/// Homework assignment for a student
class ParentHomeworkAssignment {
  final int id;
  final String title;
  final String? description;
  final String? subjectName;
  final String? teacherName;
  final String? assignedDate;
  final String? dueDate;
  final double? maxMarks;
  final String status;
  final String? submissionStatus;
  final double? marksObtained;
  final String? remarks;

  const ParentHomeworkAssignment({
    required this.id,
    required this.title,
    this.description,
    this.subjectName,
    this.teacherName,
    this.assignedDate,
    this.dueDate,
    this.maxMarks,
    this.status = 'ACTIVE',
    this.submissionStatus,
    this.marksObtained,
    this.remarks,
  });

  bool get isSubmitted => submissionStatus != null && submissionStatus != 'PENDING';
  bool get isEvaluated => marksObtained != null || submissionStatus == 'EVALUATED';

  factory ParentHomeworkAssignment.fromJson(Map<String, dynamic> json) {
    return ParentHomeworkAssignment(
      id: (json['id'] ?? 0) as int,
      title: (json['title'] ?? 'Homework') as String,
      description: json['description'] as String?,
      subjectName: json['subjectName'] as String?,
      teacherName: json['teacherName'] as String?,
      assignedDate: json['assignedDate'] as String?,
      dueDate: json['dueDate'] as String?,
      maxMarks: (json['maxMarks'] as num?)?.toDouble() ?? (json['totalMarks'] as num?)?.toDouble(),
      status: (json['status'] ?? 'ACTIVE') as String,
      submissionStatus: json['submissionStatus'] as String?,
      marksObtained: (json['marksObtained'] as num?)?.toDouble(),
      remarks: json['remarks'] as String?,
    );
  }
}

/// CMS School Event
class ParentCmsEvent {
  final int id;
  final String title;
  final String venue;
  final String startDate;
  final String endDate;
  final String? description;
  final String? featuredImage;

  const ParentCmsEvent({
    required this.id,
    required this.title,
    required this.venue,
    required this.startDate,
    required this.endDate,
    this.description,
    this.featuredImage,
  });

  factory ParentCmsEvent.fromJson(Map<String, dynamic> json) {
    return ParentCmsEvent(
      id: (json['id'] ?? 0) as int,
      title: (json['title'] ?? 'School Event') as String,
      venue: (json['venue'] ?? '') as String,
      startDate: (json['startDate'] ?? '') as String,
      endDate: (json['endDate'] ?? '') as String,
      description: json['description'] as String?,
      featuredImage: json['featuredImage'] as String?,
    );
  }
}
