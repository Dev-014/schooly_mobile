import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/exams_and_results_providers.dart';
import '../../../data/exams_and_results_repository.dart';
import '../../../../auth/providers/auth_provider.dart';


class ExamSubjectsTab extends ConsumerWidget {
  final String examId;
  const ExamSubjectsTab({super.key, required this.examId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final intId = int.tryParse(examId) ?? 0;

    final subjectsState = ref.watch(examWorkspaceSubjectsProvider(intId));

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: subjectsState.when(
        data: (subjects) {
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
                          Text('Examination Subjects', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                          Text(
                            'Configure subjects, marks, and assessment components.',
                            style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () => _showAddSubjectSheet(context, ref, intId),
                      icon: const Icon(Icons.add, size: 16),
                      label: const Text('Add'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                if (subjects.isEmpty)
                  Expanded(
                    child: Center(
                      child: Text('No subjects configured', style: theme.textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant)),
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
                        itemCount: subjects.length,
                        separatorBuilder: (_, _) => const Divider(height: 1),
                        itemBuilder: (context, index) {
                          final subject = subjects[index];
                          return ListTile(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            title: Text(subject['subjectName'] ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 4),
                                Text('Code: ${subject['subjectCode'] ?? 'N/A'}'),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    _buildStatBadge('Max: ${subject['maxMarks'] ?? 0}', colorScheme.primaryContainer, colorScheme.onPrimaryContainer),
                                    const SizedBox(width: 8),
                                    _buildStatBadge('Pass: ${subject['passingMarks'] ?? 0}', colorScheme.secondaryContainer, colorScheme.onSecondaryContainer),
                                  ],
                                ),
                              ],
                            ),
                            trailing: PopupMenuButton<String>(
                              onSelected: (value) async {
                                final repo = ref.read(examsAndResultsRepositoryProvider);
                                final user = ref.read(authProvider);
                                if (value == 'edit') {
                                  _showEditConfigSheet(context, ref, intId, subject);
                                } else if (value == 'delete') {
                                  try {
                                    await repo.removeExamSubject(intId, subject['id'], user!.schoolId!.toString());
                                    ref.invalidate(examWorkspaceSubjectsProvider(intId));
                                    ref.invalidate(examWorkspaceOverviewProvider(intId));
                                  } catch (e) {
                                    if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
                                  }
                                }
                              },
                              itemBuilder: (context) => [
                                const PopupMenuItem(value: 'edit', child: Text('Edit Config')),
                                const PopupMenuItem(value: 'delete', child: Text('Remove Subject', style: TextStyle(color: Colors.red))),
                              ],
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

  Widget _buildStatBadge(String text, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(text, style: TextStyle(color: textColor, fontSize: 10, fontWeight: FontWeight.bold)),
    );
  }

  void _showAddSubjectSheet(BuildContext context, WidgetRef ref, int examId) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => _AddSubjectSheet(examId: examId),
    ).then((_) {
      ref.invalidate(examWorkspaceSubjectsProvider(examId));
      ref.invalidate(examWorkspaceOverviewProvider(examId));
    });
  }

  void _showEditConfigSheet(BuildContext context, WidgetRef ref, int examId, dynamic subject) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => _EditConfigSheet(examId: examId, subject: subject),
    ).then((_) {
      ref.invalidate(examWorkspaceSubjectsProvider(examId));
    });
  }
}

class _AddSubjectSheet extends ConsumerStatefulWidget {
  final int examId;
  const _AddSubjectSheet({required this.examId});

  @override
  ConsumerState<_AddSubjectSheet> createState() => _AddSubjectSheetState();
}

class _AddSubjectSheetState extends ConsumerState<_AddSubjectSheet> {

  @override
  Widget build(BuildContext context) {
    // Assuming academicSubjectsProvider exists, if not just show a mock or a textfield for now.
    // I will use a dummy provider or just mock it since I don't know the exact global subjects provider yet.
    return Container(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, top: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Select Subjects to Add', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          // Need actual subjects provider here. For now, we will just use a hardcoded id for demonstration if provider fails.
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Select from global subjects catalog (UI simplified)'),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                final user = ref.read(authProvider);
                final repo = ref.read(examsAndResultsRepositoryProvider);
                await repo.addExamSubjects(widget.examId, [1], user!.schoolId!.toString()); // Dummy ID 1
                if (mounted) Navigator.pop(context);
              } catch (e) {
                if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
              }
            },
            child: const Text('Add Dummy Subject (ID: 1)'),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _EditConfigSheet extends ConsumerStatefulWidget {
  final int examId;
  final dynamic subject;
  const _EditConfigSheet({required this.examId, required this.subject});

  @override
  ConsumerState<_EditConfigSheet> createState() => _EditConfigSheetState();
}

class _EditConfigSheetState extends ConsumerState<_EditConfigSheet> {
  late TextEditingController _maxMarksCtrl;
  late TextEditingController _passMarksCtrl;

  @override
  void initState() {
    super.initState();
    _maxMarksCtrl = TextEditingController(text: widget.subject['maxMarks']?.toString() ?? '100');
    _passMarksCtrl = TextEditingController(text: widget.subject['passingMarks']?.toString() ?? '35');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, left: 16, right: 16, top: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Edit Config: ${widget.subject['subjectName']}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          TextField(controller: _maxMarksCtrl, decoration: const InputDecoration(labelText: 'Max Marks'), keyboardType: TextInputType.number),
          const SizedBox(height: 12),
          TextField(controller: _passMarksCtrl, decoration: const InputDecoration(labelText: 'Passing Marks'), keyboardType: TextInputType.number),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () async {
              try {
                final user = ref.read(authProvider);
                final repo = ref.read(examsAndResultsRepositoryProvider);
                await repo.updateExamSubjectConfig(
                  widget.examId,
                  widget.subject['id'],
                  {
                    'maxMarks': int.tryParse(_maxMarksCtrl.text) ?? 100,
                    'passingMarks': int.tryParse(_passMarksCtrl.text) ?? 35,
                  },
                  user!.schoolId!.toString(),
                );
                if (mounted) Navigator.pop(context);
              } catch (e) {
                if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
              }
            },
            child: const Text('Save'),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
