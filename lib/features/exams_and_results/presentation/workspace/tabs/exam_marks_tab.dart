import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/exams_and_results_providers.dart';
import '../../../data/exams_and_results_repository.dart';

final tabClassIdProvider = StateProvider<String>((ref) => '1');
final tabSubjectIdProvider = StateProvider<String>((ref) => '1');

class ExamMarksTab extends ConsumerStatefulWidget {
  final String examId;
  const ExamMarksTab({super.key, required this.examId});

  @override
  ConsumerState<ExamMarksTab> createState() => _ExamMarksTabState();
}

class _ExamMarksTabState extends ConsumerState<ExamMarksTab> {
  final Map<int, String> _marksData = {};
  bool _isSaving = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    final classId = ref.watch(tabClassIdProvider);
    final subjectId = ref.watch(tabSubjectIdProvider);
    
    final marksState = ref.watch(examMarksProvider((
      examId: widget.examId,
      classId: classId,
      sectionId: null,
    )));

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Filters
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: classId,
                    decoration: const InputDecoration(labelText: 'Class ID', border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(horizontal: 8)),
                    onChanged: (val) => ref.read(tabClassIdProvider.notifier).state = val,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    initialValue: subjectId,
                    decoration: const InputDecoration(labelText: 'Subject ID', border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(horizontal: 8)),
                    onChanged: (val) => ref.read(tabSubjectIdProvider.notifier).state = val,
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _isSaving ? null : () async {
                    setState(() => _isSaving = true);
                    try {
                      final repo = ref.read(examsAndResultsRepositoryProvider);
                      final marksList = _marksData.entries.map((e) => {
                        'examSetupId': int.parse(widget.examId),
                        'classId': int.parse(classId),
                        'subjectId': int.parse(subjectId),
                        'studentId': e.key,
                        'marksObtained': e.value.isEmpty ? null : double.parse(e.value),
                        'attendanceStatus': 'PRESENT',
                      }).toList();
                      
                      await repo.createExamMarks({'marks': marksList});
                      
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Marks saved!')));
                      }
                    } catch (e) {
                      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
                    } finally {
                      if (mounted) setState(() => _isSaving = false);
                    }
                  },
                  child: _isSaving ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)) : const Text('Save'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // List
            Expanded(
              child: marksState.when(
                data: (marks) {
                  if (marks.isEmpty) {
                    return const Center(child: Text('No students found for this class.'));
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
