import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:schooly_mobile/features/auth/providers/auth_provider.dart';
import '../data/fees_repository.dart';

final feeCategoriesProvider = FutureProvider.autoDispose<List<dynamic>>((
  ref,
) async {
  final authState = ref.watch(authProvider);
  final schoolId = authState?.schoolId ?? '1000';
  return ref.watch(feesRepositoryProvider).getCategories(schoolId.toString());
});

final feeStructuresProvider = FutureProvider.autoDispose<List<dynamic>>((
  ref,
) async {
  final authState = ref.watch(authProvider);
  final schoolId = authState?.schoolId ?? '1000';
  return ref.watch(feesRepositoryProvider).getStructures(schoolId.toString());
});

final collectionPlansProvider = FutureProvider.autoDispose<List<dynamic>>((
  ref,
) async {
  final authState = ref.watch(authProvider);
  final schoolId = authState?.schoolId ?? '1000';
  return ref
      .watch(feesRepositoryProvider)
      .getCollectionPlans(schoolId.toString());
});

final feeRecordsProvider = FutureProvider.autoDispose<List<dynamic>>((
  ref,
) async {
  final authState = ref.watch(authProvider);
  final schoolId = authState?.schoolId ?? '1000';
  return ref.watch(feesRepositoryProvider).getFeeRecords(schoolId.toString());
});

final feeStatsProvider = FutureProvider.autoDispose<dynamic>((ref) async {
  final authState = ref.watch(authProvider);
  final schoolId = authState?.schoolId ?? '1000';
  return ref.watch(feesRepositoryProvider).getFeeStats(schoolId.toString());
});

final studentDuesProvider = FutureProvider.family
    .autoDispose<List<dynamic>, String>((ref, studentId) async {
      final authState = ref.watch(authProvider);
      final schoolId = authState?.schoolId ?? '1000';
      return ref
          .watch(feesRepositoryProvider)
          .getStudentDues(studentId, schoolId.toString());
    });

final paymentsProvider = FutureProvider.autoDispose<List<dynamic>>((ref) async {
  final authState = ref.watch(authProvider);
  final schoolId = authState?.schoolId ?? '1000';
  return ref.watch(feesRepositoryProvider).getPayments(schoolId.toString());
});
