import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/student_admission_model.dart';
import '../data/student_repository.dart';

part 'student_admission_provider.g.dart';

@riverpod
class StudentAdmissionFormController extends _$StudentAdmissionFormController {
  @override
  StudentAdmissionFormState build() {
    return const StudentAdmissionFormState();
  }

  void updateField(
    StudentAdmissionFormState Function(StudentAdmissionFormState) updater,
  ) {
    state = updater(state);
  }

  void setSameAsFather(bool same) {
    if (same) {
      state = state.copyWith(
        sameAsFather: true,
        motherName: state.parentName,
        motherPhone: state.parentPhone,
      );
    } else {
      state = state.copyWith(sameAsFather: false);
    }
  }

  Future<void> submit(String schoolId) async {
    final repo = ref.read(studentRepositoryProvider);

    // Auto-create family if "new" is selected
    int? familyId = int.tryParse(state.familyId);
    if (state.familyType == 'new' && state.familyId.isEmpty) {
      final family = await repo.createFamily(schoolId);
      familyId = family['id'] as int?;
    }

    final data = {
      'schoolId': int.parse(schoolId),
      'familyId': familyId,
      'admissionNo': 'AUTO-${DateTime.now().millisecondsSinceEpoch % 10000}',
      'rollNumber': 'TBD',
      'classId': int.tryParse(state.classId) ?? 0,
      'sectionId': int.tryParse(state.sectionId) ?? 0,
      'academicYearId': int.tryParse(state.academicYearId) ?? 0,
      'firstName': state.firstName,
      'lastName': state.lastName,
      'dateOfBirth': state.dob,
      'gender': state.gender.toUpperCase(),
      'guardianName': state.parentName,
      'guardianPhone': state.parentPhone,
      'guardianEmail': state.parentEmail,
      'guardianRelation': state.relation,
      'bloodGroup': state.bloodGroup,
      'religion': state.religion,
      'nationality': state.nationality,
      'previousSchool': state.previousSchool,
      'address': [
        state.city,
        state.state,
        state.pincode,
      ].where((e) => e.isNotEmpty).join(', '),
      if (state.categoryId.isNotEmpty)
        'categoryId': int.parse(state.categoryId),
      if (state.houseId.isNotEmpty) 'houseId': int.parse(state.houseId),
      'status': 'ACTIVE',
    };

    await repo.createStudent(data);
  }
}

// Data Providers
@riverpod
Future<List<dynamic>> categories(Ref ref, String schoolId) {
  return ref.watch(studentRepositoryProvider).getCategories(schoolId);
}

@riverpod
Future<List<dynamic>> houses(Ref ref, String schoolId) {
  return ref.watch(studentRepositoryProvider).getHouses(schoolId);
}

@riverpod
Future<List<dynamic>> classes(Ref ref, String schoolId) {
  return ref.watch(studentRepositoryProvider).getClasses(schoolId);
}

@riverpod
Future<List<dynamic>> sections(Ref ref, String schoolId, String classId) {
  if (classId.isEmpty) return Future.value([]);
  return ref.watch(studentRepositoryProvider).getSections(schoolId, classId);
}

@riverpod
Future<List<dynamic>> academicYears(Ref ref, String schoolId) {
  return ref.watch(studentRepositoryProvider).getAcademicYears(schoolId);
}

@riverpod
Future<List<dynamic>> familySearch(Ref ref, String query) {
  if (query.isEmpty) return Future.value([]);
  return ref.watch(studentRepositoryProvider).searchFamilies(query);
}
