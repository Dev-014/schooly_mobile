import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/student_repository.dart';

part 'admin_student_category_provider.g.dart';

@riverpod
class StudentCategoryController extends _$StudentCategoryController {
  @override
  FutureOr<List<dynamic>> build(String schoolId) {
    return ref.watch(studentRepositoryProvider).getCategories(schoolId);
  }

  Future<void> addCategory(String name, String description) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(studentRepositoryProvider).createCategory({
        'name': name,
        'description': description,
        'schoolId': schoolId,
      });
      return ref.read(studentRepositoryProvider).getCategories(schoolId);
    });
  }

  Future<void> updateCategory(
    String id,
    String name,
    String description,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(studentRepositoryProvider).updateCategory(id, {
        'name': name,
        'description': description,
        'schoolId': schoolId,
      });
      return ref.read(studentRepositoryProvider).getCategories(schoolId);
    });
  }

  Future<void> deleteCategory(String id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(studentRepositoryProvider).deleteCategory(id, schoolId);
      return ref.read(studentRepositoryProvider).getCategories(schoolId);
    });
  }
}
