import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/exams_and_results_repository.dart';
import '../../providers/exams_and_results_providers.dart';

class GradeListScreen extends ConsumerWidget {
  const GradeListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final gradesState = ref.watch(examGradesProvider);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text('Grade List', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: colorScheme.surface,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Configure grading scales for the school.', style: theme.textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant)),
            const SizedBox(height: 24),
            Expanded(
              child: gradesState.when(
                data: (grades) {
                  if (grades.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.grade, size: 48, color: colorScheme.primary.withValues(alpha: 0.5)),
                          const SizedBox(height: 16),
                          Text('No grades found', style: theme.textTheme.titleMedium),
                          const SizedBox(height: 8),
                          Text('Tap the + button to add a new grade.', style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                        ],
                      ),
                    );
                  }
                  return ListView.separated(
                    itemCount: grades.length,
                    separatorBuilder: (c, i) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final grade = grades[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: colorScheme.primaryContainer,
                          child: Text(grade['gradeName'] ?? '', style: TextStyle(color: colorScheme.onPrimaryContainer, fontWeight: FontWeight.bold)),
                        ),
                        title: Text(grade['gradeName'] ?? 'Grade', style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text('Range: ${grade['minMarks'] ?? 0} - ${grade['maxMarks'] ?? 0}%\nGPA: ${grade['gradePoint'] ?? 0}'),
                        isThreeLine: true,
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () async {
                            final confirm = await showDialog<bool>(
                              context: context,
                              builder: (c) => AlertDialog(
                                title: const Text('Delete Grade'),
                                content: const Text('Are you sure you want to delete this grade?'),
                                actions: [
                                  TextButton(onPressed: () => Navigator.pop(c, false), child: const Text('Cancel')),
                                  TextButton(onPressed: () => Navigator.pop(c, true), child: const Text('Delete', style: TextStyle(color: Colors.red))),
                                ],
                              ),
                            );
                            if (confirm == true) {
                              try {
                                final repo = ref.read(examsAndResultsRepositoryProvider);
                                await repo.deleteExamGrade(grade['id']);
                                // ignore: unused_result
                                ref.refresh(examGradesProvider.future);
                              } catch (e) {
                                if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
                              }
                            }
                          },
                        ),
                      );
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Center(child: Text('Error: $e')),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (ctx) => const _GradeListSheet(),
          );
        },
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _GradeListSheet extends ConsumerStatefulWidget {
  const _GradeListSheet();

  @override
  ConsumerState<_GradeListSheet> createState() => _GradeListSheetState();
}

class _GradeListSheetState extends ConsumerState<_GradeListSheet> {
  final _nameController = TextEditingController();
  final _minController = TextEditingController();
  final _maxController = TextEditingController();
  final _gpaController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 24,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Add Grade', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Grade Name (e.g. A+)', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _minController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Min %', border: OutlineInputBorder()),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: _maxController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Max %', border: OutlineInputBorder()),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _gpaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Grade Point / GPA', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _isLoading ? null : () async {
                setState(() => _isLoading = true);
                try {
                  final repo = ref.read(examsAndResultsRepositoryProvider);
                  await repo.createExamGrade({
                    'gradeName': _nameController.text.trim(),
                    'minMarks': double.tryParse(_minController.text) ?? 0.0,
                    'maxMarks': double.tryParse(_maxController.text) ?? 0.0,
                    'gradePoint': double.tryParse(_gpaController.text) ?? 0.0,
                  });
                  // ignore: unused_result
                  ref.refresh(examGradesProvider.future);
                  if (context.mounted) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Grade saved!')));
                  }
                } catch (e) {
                  if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
                } finally {
                  if (mounted) setState(() => _isLoading = false);
                }
              },
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16)),
              child: _isLoading ? const CircularProgressIndicator() : const Text('Save'),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
