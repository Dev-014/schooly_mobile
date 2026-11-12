import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/student_repository.dart';

part 'admin_student_referrals_provider.g.dart';

@riverpod
class StudentReferralsController extends _$StudentReferralsController {
  @override
  FutureOr<List<dynamic>> build(String schoolId) {
    return ref.watch(studentRepositoryProvider).getReferrals(schoolId);
  }

  Future<void> addReferral(Map<String, dynamic> data) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final payload = {...data, 'schoolId': schoolId};
      await ref.read(studentRepositoryProvider).createReferral(payload);
      return ref.read(studentRepositoryProvider).getReferrals(schoolId);
    });
  }
}
