import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/student_repository.dart';

part 'admin_student_directory_provider.g.dart';

@riverpod
Future<List<dynamic>> studentDirectory(Ref ref, String schoolId) {
  return ref.watch(studentRepositoryProvider).getStudents(schoolId);
}
