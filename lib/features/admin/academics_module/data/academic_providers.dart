import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'academic_repository.dart';

final classesProvider = FutureProvider.autoDispose<List<Map<String, dynamic>>>((
  ref,
) async {
  final repo = ref.watch(academicRepositoryProvider);
  return repo.getClasses();
});

final sectionsProvider = FutureProvider.autoDispose<List<Map<String, dynamic>>>(
  (ref) async {
    final repo = ref.watch(academicRepositoryProvider);
    return repo.getSections();
  },
);

final subjectsProvider = FutureProvider.autoDispose<List<Map<String, dynamic>>>(
  (ref) async {
    final repo = ref.watch(academicRepositoryProvider);
    return repo.getSubjects();
  },
);

final academicYearsProvider =
    FutureProvider.autoDispose<List<Map<String, dynamic>>>((ref) async {
      final repo = ref.watch(academicRepositoryProvider);
      return repo.getAcademicYears();
    });

final classTeacherAssignmentsProvider =
    FutureProvider.autoDispose<List<Map<String, dynamic>>>((ref) async {
      final repo = ref.watch(academicRepositoryProvider);
      return repo.getClassTeacherAssignments();
    });

final staffProvider = FutureProvider.autoDispose<List<Map<String, dynamic>>>((
  ref,
) async {
  final repo = ref.watch(academicRepositoryProvider);
  return repo.getStaff();
});
