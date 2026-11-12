import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/exams_and_results_providers.dart';
import '../../../data/exams_and_results_repository.dart';
import '../../../../auth/providers/auth_provider.dart';

class ExamStudentsTab extends ConsumerWidget {
  final String examId;
  const ExamStudentsTab({super.key, required this.examId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final intId = int.tryParse(examId) ?? 0;

    final studentsState = ref.watch(examWorkspaceStudentsProvider(intId));

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: studentsState.when(
        data: (students) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Eligible Students', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                          Text(
                            'Manage student eligibility and exceptions.',
                            style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                if (students.isEmpty)
                  Expanded(
                    child: Center(
                      child: Text('No students found for this exam', style: theme.textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant)),
                    ),
                  )
                else
                  Expanded(
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(color: colorScheme.surfaceContainer),
                      ),
                      child: ListView.separated(
                        itemCount: students.length,
                        separatorBuilder: (_, __) => const Divider(height: 1),
                        itemBuilder: (context, index) {
                          final student = students[index];
                          final status = (student['status'] ?? 'ELIGIBLE').toString().toUpperCase();
                          return ListTile(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            leading: CircleAvatar(
                              backgroundColor: colorScheme.surfaceContainerHighest,
                              child: Text(student['studentName']?.substring(0, 1) ?? 'U', style: TextStyle(color: colorScheme.onSurface)),
                            ),
                            title: Text(student['studentName'] ?? 'Unknown', style: const TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text('${student['className']} - ${student['sectionName']} • ${student['admissionNo']}'),
                            trailing: PopupMenuButton<String>(
                              onSelected: (val) async {
                                final repo = ref.read(examsAndResultsRepositoryProvider);
                                final user = ref.read(authProvider);
                                try {
                                  await repo.updateStudentStatus(intId, student['id'], val, user!.schoolId!.toString(), 'Changed via App');
                                  ref.refresh(examWorkspaceStudentsProvider(intId).future);
                                } catch (e) {
                                  if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
                                }
                              },
                              itemBuilder: (context) => [
                                const PopupMenuItem(value: 'ELIGIBLE', child: Text('Mark Eligible')),
                                const PopupMenuItem(value: 'WITHHELD', child: Text('Withhold Result', style: TextStyle(color: Colors.red))),
                              ],
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: status == 'ELIGIBLE' ? Colors.green.withValues(alpha: 0.1) : Colors.red.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  status,
                                  style: TextStyle(color: status == 'ELIGIBLE' ? Colors.green : Colors.red, fontSize: 10, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}

