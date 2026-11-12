import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../auth/providers/auth_provider.dart';
import '../data/front_office_repository.dart';

final enquiriesProvider = FutureProvider.autoDispose<List<dynamic>>((
  ref,
) async {
  final schoolId = ref.watch(authProvider)?.schoolId?.toString() ?? '1000';
  return ref.watch(frontOfficeRepositoryProvider).getEnquiries(schoolId);
});

final visitorsProvider = FutureProvider.autoDispose<List<dynamic>>((ref) async {
  final schoolId = ref.watch(authProvider)?.schoolId?.toString() ?? '1000';
  return ref.watch(frontOfficeRepositoryProvider).getVisitors(schoolId);
});

final gatePassesProvider = FutureProvider.autoDispose<List<dynamic>>((
  ref,
) async {
  final schoolId = ref.watch(authProvider)?.schoolId?.toString() ?? '1000';
  return ref.watch(frontOfficeRepositoryProvider).getGatePasses(schoolId);
});

final parcelsReceiveProvider = FutureProvider.autoDispose<List<dynamic>>((
  ref,
) async {
  final schoolId = ref.watch(authProvider)?.schoolId?.toString() ?? '1000';
  return ref.watch(frontOfficeRepositoryProvider).getParcelsReceive(schoolId);
});

final parcelsDispatchProvider = FutureProvider.autoDispose<List<dynamic>>((
  ref,
) async {
  final schoolId = ref.watch(authProvider)?.schoolId?.toString() ?? '1000';
  return ref.watch(frontOfficeRepositoryProvider).getParcelsDispatch(schoolId);
});

final complaintsProvider = FutureProvider.autoDispose<List<dynamic>>((
  ref,
) async {
  final schoolId = ref.watch(authProvider)?.schoolId?.toString() ?? '1000';
  return ref.watch(frontOfficeRepositoryProvider).getComplaints(schoolId);
});
