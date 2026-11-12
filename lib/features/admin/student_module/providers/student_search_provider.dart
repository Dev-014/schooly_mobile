import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../auth/providers/auth_provider.dart';
import '../data/student_repository.dart';

final studentSearchProvider = FutureProvider.family
    .autoDispose<List<dynamic>, String>((ref, query) async {
      if (query.isEmpty) return [];
      final authState = ref.watch(authProvider);
      final schoolId = authState?.schoolId ?? '1000';
      return ref
          .watch(studentRepositoryProvider)
          .searchStudents(schoolId.toString(), query);
    });
