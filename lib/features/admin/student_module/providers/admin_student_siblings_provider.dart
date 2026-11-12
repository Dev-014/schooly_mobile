import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/student_repository.dart';

part 'admin_student_siblings_provider.g.dart';

@riverpod
class StudentSiblingsController extends _$StudentSiblingsController {
  @override
  FutureOr<List<dynamic>> build(String primaryStudentId, String schoolId) {
    if (primaryStudentId.isEmpty) return [];
    return ref
        .watch(studentRepositoryProvider)
        .getSiblings(primaryStudentId, schoolId);
  }

  Future<void> linkSibling(String siblingId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(studentRepositoryProvider).linkSibling({
        'primaryStudentId': primaryStudentId,
        'siblingStudentId': siblingId,
        'schoolId': schoolId,
      });
      return ref
          .read(studentRepositoryProvider)
          .getSiblings(primaryStudentId, schoolId);
    });
  }

  Future<void> unlinkSibling(String id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(studentRepositoryProvider).unlinkSibling(id, schoolId);
      return ref
          .read(studentRepositoryProvider)
          .getSiblings(primaryStudentId, schoolId);
    });
  }
}
