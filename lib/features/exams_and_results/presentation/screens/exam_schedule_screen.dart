import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/exams_and_results_repository.dart';
import '../../providers/exams_and_results_providers.dart';


final selectedExamSetupProvider = StateProvider<String>((ref) => '');

class ExamScheduleScreen extends ConsumerWidget {
  const ExamScheduleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final selectedExamId = ref.watch(selectedExamSetupProvider);
    final setupsState = ref.watch(examSetupsProvider);
    final schedulesState = ref.watch(examSchedulesProvider(selectedExamId));

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text('Exam Schedule', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: colorScheme.surface,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Filter
            setupsState.when(
              data: (setups) {
                if (setups.isEmpty) return const Text('No exams found.');
                // Auto-select first if none
                if (selectedExamId.isEmpty) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    ref.read(selectedExamSetupProvider.notifier).state = setups[0]['id'].toString();
                  });
                }
                return DropdownButtonFormField<String>(
                  value: selectedExamId.isEmpty ? setups[0]['id'].toString() : selectedExamId,
                  decoration: InputDecoration(
                    labelText: 'Exam',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                  items: setups.map<DropdownMenuItem<String>>((s) {
                    return DropdownMenuItem(
                      value: s['id'].toString(),
                      child: Text(s['name'] ?? 'Unnamed'),
                    );
                  }).toList(),
                  onChanged: (val) {
                    if (val != null) ref.read(selectedExamSetupProvider.notifier).state = val;
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Text('Error: $e'),
            ),
            const SizedBox(height: 16),
            
            // List
            Expanded(
              child: schedulesState.when(
                data: (schedules) {
                  if (schedules.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.calendar_today, size: 48, color: colorScheme.primary.withValues(alpha: 0.5)),
                          const SizedBox(height: 16),
                          Text('No exam schedules found', style: theme.textTheme.titleMedium),
                          const SizedBox(height: 8),
                          Text('Tap the + button to add a schedule.', style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                        ],
                      ),
                    );
                  }
                  return ListView.separated(
                    itemCount: schedules.length,
                    separatorBuilder: (c, i) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final schedule = schedules[index];
                      return ListTile(
                        title: Text(schedule['subjectName'] ?? 'Subject', style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text('${schedule['examDate'] ?? 'Date'} • ${schedule['startTime'] ?? ''} - ${schedule['endTime'] ?? ''}\nRoom: ${schedule['roomNumber'] ?? 'N/A'}'),
                        isThreeLine: true,
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () async {
                            final confirm = await showDialog<bool>(
                              context: context,
                              builder: (c) => AlertDialog(
                                title: const Text('Confirm Delete'),
                                content: const Text('Are you sure you want to delete this schedule?'),
                                actions: [
                                  TextButton(onPressed: () => Navigator.pop(c, false), child: const Text('Cancel')),
                                  TextButton(onPressed: () => Navigator.pop(c, true), child: const Text('Delete', style: TextStyle(color: Colors.red))),
                                ],
                              ),
                            );
                            if (confirm == true) {
                              try {
                                final repo = ref.read(examsAndResultsRepositoryProvider);
                                await repo.deleteExamSchedule(schedule['id']);
                                // ignore: unused_result
                                ref.refresh(examSchedulesProvider(selectedExamId).future);
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
          if (selectedExamId.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please select an exam first')));
            return;
          }
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (ctx) => _ExamScheduleSheet(examId: selectedExamId),
          );
        },
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _ExamScheduleSheet extends ConsumerStatefulWidget {
  final String examId;
  const _ExamScheduleSheet({required this.examId});

  @override
  ConsumerState<_ExamScheduleSheet> createState() => _ExamScheduleSheetState();
}

class _ExamScheduleSheetState extends ConsumerState<_ExamScheduleSheet> {
  String? _selectedSubjectId;
  String? _selectedClassId;
  final _dateController = TextEditingController();
  final _startTimeController = TextEditingController(text: '09:00');
  final _endTimeController = TextEditingController(text: '12:00');
  final _roomController = TextEditingController();
  final _instructionsController = TextEditingController();

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
            const Text('Add Schedule', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            
            TextFormField(
              initialValue: '1', 
              decoration: const InputDecoration(labelText: 'Subject ID', border: OutlineInputBorder()),
              onChanged: (val) => _selectedSubjectId = val,
            ),
            const SizedBox(height: 16),
            TextFormField(
              initialValue: '1', 
              decoration: const InputDecoration(labelText: 'Class ID', border: OutlineInputBorder()),
              onChanged: (val) => _selectedClassId = val,
            ),
            const SizedBox(height: 16),
            
            TextField(
              controller: _dateController,
              decoration: const InputDecoration(labelText: 'Date (YYYY-MM-DD)', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _startTimeController,
                    decoration: const InputDecoration(labelText: 'Start Time (HH:mm)', border: OutlineInputBorder()),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: _endTimeController,
                    decoration: const InputDecoration(labelText: 'End Time (HH:mm)', border: OutlineInputBorder()),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _roomController,
              decoration: const InputDecoration(labelText: 'Room', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _instructionsController,
              decoration: const InputDecoration(labelText: 'Instructions', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _isLoading ? null : () async {
                setState(() => _isLoading = true);
                try {
                  final repo = ref.read(examsAndResultsRepositoryProvider);
                  await repo.createExamSchedule({
                    'examSetupId': int.parse(widget.examId),
                    'subjectId': int.parse(_selectedSubjectId ?? '1'),
                    'classId': int.parse(_selectedClassId ?? '1'),
                    'examDate': _dateController.text,
                    'startTime': _startTimeController.text.length == 5 ? '${_startTimeController.text}:00' : _startTimeController.text,
                    'endTime': _endTimeController.text.length == 5 ? '${_endTimeController.text}:00' : _endTimeController.text,
                    'roomNumber': _roomController.text.trim(),
                    'instructions': _instructionsController.text.trim(),
                  });
                  // ignore: unused_result
                  ref.refresh(examSchedulesProvider(widget.examId).future);
                  if (context.mounted) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Schedule added!')));
                  }
                } catch (e) {
                  if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
                } finally {
                  if (mounted) setState(() => _isLoading = false);
                }
              },
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16)),
              child: _isLoading ? const CircularProgressIndicator() : const Text('Save Schedule'),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
