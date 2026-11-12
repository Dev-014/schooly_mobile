import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/student_repository.dart';

part 'admin_online_admission_provider.g.dart';

@riverpod
class OnlineAdmissionController extends _$OnlineAdmissionController {
  @override
  FutureOr<List<dynamic>> build(String schoolId) {
    return ref.watch(studentRepositoryProvider).getOnlineAdmissions(schoolId);
  }

  Future<void> updateStatus(String id, String status) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref
          .read(studentRepositoryProvider)
          .updateOnlineAdmissionStatus(id, status, schoolId);
      return ref.read(studentRepositoryProvider).getOnlineAdmissions(schoolId);
    });
  }
}
