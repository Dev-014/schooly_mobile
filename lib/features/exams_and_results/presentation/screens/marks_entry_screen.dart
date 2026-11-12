import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/exams_and_results_repository.dart';
import '../../providers/exams_and_results_providers.dart';



final meExamIdProvider = StateProvider<String>((ref) => '');
final meClassIdProvider = StateProvider<String>((ref) => '1');
final meSubjectIdProvider = StateProvider<String>((ref) => '1');

class MarksEntryScreen extends ConsumerStatefulWidget {
  const MarksEntryScreen({super.key});

  @override
  ConsumerState<MarksEntryScreen> createState() => _MarksEntryScreenState();
}

class _MarksEntryScreenState extends ConsumerState<MarksEntryScreen> {
  final Map<int, String> _marksData = {};
  bool _isSaving = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    final examId = ref.watch(meExamIdProvider);
    final classId = ref.watch(meClassIdProvider);
    final subjectId = ref.watch(meSubjectIdProvider);
    
    final setupsState = ref.watch(examSetupsProvider);
    
    final marksState = ref.watch(examMarksProvider((
      examId: examId.isEmpty ? null : examId,
      classId: classId,
      sectionId: null,
    )));

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text('Marks Entry', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: colorScheme.surface,
        actions: [
          if (examId.isNotEmpty)
            TextButton.icon(
              onPressed: _isSaving ? null : () async {
                setState(() => _isSaving = true);
                try {
                  final repo = ref.read(examsAndResultsRepositoryProvider);
                  // Prepare bulk save payload
                  final marksList = _marksData.entries.map((e) => {
                    'examSetupId': int.parse(examId),
                    'classId': int.parse(classId),
                    'subjectId': int.parse(subjectId),
                    'studentId': e.key,
                    'marksObtained': e.value.isEmpty ? null : double.parse(e.value),
                    'attendanceStatus': 'PRESENT',
                  }).toList();
                  
                  await repo.createExamMarks({'marks': marksList});
                  
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Marks saved successfully!')));
                  }
                } catch (e) {
                  if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
                } finally {
                  if (mounted) setState(() => _isSaving = false);
                }
              },
              icon: _isSaving ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)) : const Icon(Icons.save),
              label: const Text('Save All'),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Filters
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: setupsState.when(
                    data: (setups) {
                      if (setups.isEmpty) return const Text('No exams');
                      if (examId.isEmpty) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          ref.read(meExamIdProvider.notifier).state = setups[0]['id'].toString();
                        });
                      }
                      return DropdownButtonFormField<String>(
                        value: examId.isEmpty ? setups[0]['id'].toString() : examId,
                        decoration: const InputDecoration(labelText: 'Exam', border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(horizontal: 8)),
                        items: setups.map<DropdownMenuItem<String>>((s) => DropdownMenuItem(value: s['id'].toString(), child: Text(s['name'] ?? ''))).toList(),
                        onChanged: (val) {
                          if (val != null) ref.read(meExamIdProvider.notifier).state = val;
                        },
                      );
                    },
                    loading: () => const CircularProgressIndicator(),
                    error: (e, _) => Text('Error: $e'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    initialValue: classId,
                    decoration: const InputDecoration(labelText: 'Class ID', border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(horizontal: 8)),
                    onChanged: (val) => ref.read(meClassIdProvider.notifier).state = val,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    initialValue: subjectId,
                    decoration: const InputDecoration(labelText: 'Sub ID', border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(horizontal: 8)),
                    onChanged: (val) => ref.read(meSubjectIdProvider.notifier).state = val,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // List
            Expanded(
              child: marksState.when(
                data: (marks) {
                  if (marks.isEmpty) {
                    return const Center(child: Text('No students found for this configuration.'));
                  }
                  return ListView.builder(
                    itemCount: marks.length,
                    itemBuilder: (context, index) {
                      final m = marks[index];
                      final studentId = m['studentId'] as int? ?? 0;
                      return Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        elevation: 0,
                        shape: RoundedRectangleBorder(side: BorderSide(color: colorScheme.outlineVariant), borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              CircleAvatar(child: Text(m['studentName']?.substring(0, 1) ?? 'U')),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(m['studentName'] ?? 'Unknown', style: const TextStyle(fontWeight: FontWeight.bold)),
                                    Text('Adm: ${m['admissionNo'] ?? 'N/A'}', style: theme.textTheme.bodySmall),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 80,
                                child: TextFormField(
                                  initialValue: m['marksObtained']?.toString() ?? '',
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    labelText: 'Marks',
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                  ),
                                  onChanged: (val) {
                                    _marksData[studentId] = val;
                                  },
                                ),
                              ),
                            ],
                          ),
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
    );
  }
}
