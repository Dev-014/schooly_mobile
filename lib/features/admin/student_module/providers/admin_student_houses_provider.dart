import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/student_repository.dart';

part 'admin_student_houses_provider.g.dart';

@riverpod
class StudentHousesController extends _$StudentHousesController {
  @override
  FutureOr<List<dynamic>> build(String schoolId) {
    return ref.watch(studentRepositoryProvider).getHouses(schoolId);
  }

  Future<void> addHouse(String name, String description, String color) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(studentRepositoryProvider).createHouse({
        'name': name,
        'description': description,
        'color': color,
        'schoolId': schoolId,
      });
      return ref.read(studentRepositoryProvider).getHouses(schoolId);
    });
  }

  Future<void> updateHouse(
    String id,
    String name,
    String description,
    String color,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(studentRepositoryProvider).updateHouse(id, {
        'name': name,
        'description': description,
        'color': color,
        'schoolId': schoolId,
      });
      return ref.read(studentRepositoryProvider).getHouses(schoolId);
    });
  }

  Future<void> deleteHouse(String id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(studentRepositoryProvider).deleteHouse(id, schoolId);
      return ref.read(studentRepositoryProvider).getHouses(schoolId);
    });
  }
}
