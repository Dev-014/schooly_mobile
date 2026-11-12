import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/exams_and_results_providers.dart';
import '../../../data/exams_and_results_repository.dart';
import '../../../../auth/providers/auth_provider.dart';
import '../../../../admin/academics_module/data/academic_providers.dart';

class ExamClassesTab extends ConsumerStatefulWidget {
  final String examId;
  const ExamClassesTab({super.key, required this.examId});

  @override
  ConsumerState<ExamClassesTab> createState() => _ExamClassesTabState();
}

class _ExamClassesTabState extends ConsumerState<ExamClassesTab> {
  // Local state for tracking selections: list of classId + sectionId
  final List<({int classId, int? sectionId})> _selected = [];
  bool _initialized = false;
  bool _isSaving = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final intId = int.tryParse(widget.examId) ?? 0;

    final applicabilitiesState = ref.watch(examWorkspaceApplicabilitiesProvider(intId));
    final classesState = ref.watch(classesProvider);
    final sectionsState = ref.watch(sectionsProvider);

    // Initialize local state once when data is available
    if (!_initialized && applicabilitiesState.hasValue) {
      final apps = applicabilitiesState.value!;
      _selected.clear();
      for (final app in apps) {
        _selected.add((
          classId: app['classId'] as int,
          sectionId: app['sectionId'] as int?,
        ));
      }
      _initialized = true;
    }

    final isLoading = applicabilitiesState.isLoading || classesState.isLoading || sectionsState.isLoading;

    if (isLoading && !_initialized) {
      return const Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final classes = classesState.value ?? [];
    final sections = sectionsState.value ?? [];

    // Filter out classes that have no sections to match web logic
    final classesWithSections = classes.map((c) {
      return {
        ...c,
        'sections': sections.where((s) => s['class_id'] == c['id'] || s['classId'] == c['id']).toList(),
      };
    }).where((c) => (c['sections'] as List).isNotEmpty).toList();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
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
                      Text('Classes & Sections', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                      Text(
                        'Select which classes and sections will participate in this examination.',
                        style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: _isSaving ? null : () async {
                    setState(() => _isSaving = true);
                    try {
                      final user = ref.read(authProvider);
                      final repo = ref.read(examsAndResultsRepositoryProvider);
                      
                      final payload = _selected.map((s) => {
                        'classId': s.classId,
                        if (s.sectionId != null) 'sectionId': s.sectionId,
                      }).toList();
                      
                      await repo.syncExamApplicabilities(intId, payload, user!.schoolId!.toString());
                      
                      // ignore: unused_result
                      ref.refresh(examWorkspaceApplicabilitiesProvider(intId).future);
                      
                      if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Configuration saved!')));
                    } catch (e) {
                      if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
                    } finally {
                      if (mounted) setState(() => _isSaving = false);
                    }
                  },
                  child: _isSaving ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)) : const Text('Save Configuration'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: classesWithSections.isEmpty 
                ? const Center(child: Text('No academic classes found'))
                : ListView.builder(
                    itemCount: classesWithSections.length,
                    itemBuilder: (context, index) {
                      final cls = classesWithSections[index];
                      final clsId = cls['id'] as int;
                      final clsSections = cls['sections'] as List<dynamic>;

                      return Card(
                        margin: const EdgeInsets.only(bottom: 16),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: BorderSide(color: colorScheme.surfaceContainer),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(cls['name'] ?? 'Class', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              const SizedBox(height: 12),
                              Wrap(
                                spacing: 12,
                                runSpacing: 12,
                                children: clsSections.map((sec) {
                                  final secId = sec['id'] as int;
                                  final isSelected = _selected.any((s) => s.classId == clsId && s.sectionId == secId);

                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (isSelected) {
                                          _selected.removeWhere((s) => s.classId == clsId && s.sectionId == secId);
                                        } else {
                                          _selected.add((classId: clsId, sectionId: secId));
                                        }
                                      });
                                    },
                                    borderRadius: BorderRadius.circular(12),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                      decoration: BoxDecoration(
                                        color: isSelected ? colorScheme.primaryContainer : Colors.transparent,
                                        border: Border.all(
                                          color: isSelected ? colorScheme.primary : colorScheme.outlineVariant,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            isSelected ? Icons.check_circle : Icons.circle_outlined,
                                            size: 20,
                                            color: isSelected ? colorScheme.primary : colorScheme.onSurfaceVariant,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            sec['name'] ?? 'Section',
                                            style: TextStyle(
                                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                              color: isSelected ? colorScheme.onPrimaryContainer : colorScheme.onSurface,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
