import re

# 1. Update student_repository.dart
student_repo_path = 'lib/features/admin/student_module/data/student_repository.dart'
with open(student_repo_path, 'r') as f:
    student_repo = f.read()

if "searchStudents" not in student_repo:
    student_repo = student_repo.replace(
        "Future<List<dynamic>> searchFamilies(String query) async {",
        "Future<List<dynamic>> searchStudents(String schoolId, String query) async {\n    final response = await _dio.get(\n      '/api/students',\n      queryParameters: {'schoolId': schoolId, 'search': query},\n    );\n    return response.data is List ? response.data : (response.data['data'] ?? []);\n  }\n\n  Future<List<dynamic>> searchFamilies(String query) async {"
    )
    with open(student_repo_path, 'w') as f:
        f.write(student_repo)

# 2. Update fees_repository.dart
fees_repo_path = 'lib/features/admin/finance_module/data/fees_repository.dart'
with open(fees_repo_path, 'r') as f:
    fees_repo = f.read()

if "getStudentDues" not in fees_repo:
    fees_repo = fees_repo.replace(
        "}\n",
        """
  Future<List<dynamic>> getStudentDues(String studentId, String schoolId, {String? status}) async {
    final Map<String, dynamic> params = {'schoolId': schoolId};
    if (status != null) params['statuses'] = status;
    final response = await _dio.get('/api/v1/finance/students/$studentId/dues', queryParameters: params);
    return (response.data['data'] ?? response.data) as List<dynamic>;
  }

  Future<List<dynamic>> getPayments(String schoolId) async {
    final response = await _dio.get('/api/v1/finance/payments', queryParameters: {'schoolId': schoolId});
    return (response.data['content'] ?? response.data['data'] ?? response.data) as List<dynamic>;
  }
}
"""
    )
    with open(fees_repo_path, 'w') as f:
        f.write(fees_repo)

# 3. Update fees_providers.dart
fees_providers_path = 'lib/features/admin/finance_module/providers/fees_providers.dart'
with open(fees_providers_path, 'r') as f:
    fees_providers = f.read()

if "paymentsProvider" not in fees_providers:
    fees_providers += """
final studentDuesProvider = FutureProvider.family.autoDispose<List<dynamic>, String>((ref, studentId) async {
  final schoolId = ref.watch(authProvider).user?.schoolId ?? '1000';
  return ref.watch(feesRepositoryProvider).getStudentDues(studentId, schoolId.toString());
});

final paymentsProvider = FutureProvider.autoDispose<List<dynamic>>((ref) async {
  final schoolId = ref.watch(authProvider).user?.schoolId ?? '1000';
  return ref.watch(feesRepositoryProvider).getPayments(schoolId.toString());
});
"""
    with open(fees_providers_path, 'w') as f:
        f.write(fees_providers)

# 4. Update student_providers.dart
student_providers_path = 'lib/features/admin/student_module/providers/student_providers.dart'
with open(student_providers_path, 'r') as f:
    student_providers = f.read()

if "studentSearchProvider" not in student_providers:
    student_providers += """
final studentSearchProvider = FutureProvider.family.autoDispose<List<dynamic>, String>((ref, query) async {
  if (query.isEmpty) return [];
  final schoolId = ref.watch(authProvider).user?.schoolId ?? '1000';
  return ref.watch(studentRepositoryProvider).searchStudents(schoolId.toString(), query);
});
"""
    with open(student_providers_path, 'w') as f:
        f.write(student_providers)
