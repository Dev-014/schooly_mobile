import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../providers/parent_providers.dart';
import '../more/child_switcher_sheet.dart';

class ParentExamsScreen extends ConsumerStatefulWidget {
  const ParentExamsScreen({super.key});

  @override
  ConsumerState<ParentExamsScreen> createState() => _ParentExamsScreenState();
}

class _ParentExamsScreenState extends ConsumerState<ParentExamsScreen> {
  int? _selectedTermIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final activeChild = ref.watch(selectedChildProvider);
    final childrenAsync = ref.watch(parentChildrenProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        scrolledUnderElevation: 1,
        title: Text(
          'Exams & Results',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: childrenAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.error_outline, size: 48, color: colorScheme.error),
                const SizedBox(height: 12),
                Text('Failed to load wards', style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(err.toString(), textAlign: TextAlign.center, style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                const SizedBox(height: 16),
                FilledButton.tonal(
                  onPressed: () => ref.invalidate(parentChildrenProvider),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
        data: (children) {
          if (children.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.family_restroom, size: 56, color: colorScheme.outlineVariant),
                    const SizedBox(height: 16),
                    Text('No Wards Found', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(
                      'No students are currently linked to this parent account.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
            );
          }

          final effectiveChild = activeChild ?? children.first;
          final eligibleExamsAsync = ref.watch(childEligibleExamsProvider(effectiveChild.studentId));
          final resultsAsync = ref.watch(childExamResultsProvider(effectiveChild.studentId));

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Child Selection Card
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: colorScheme.outlineVariant.withValues(alpha: 0.3)),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: colorScheme.primaryContainer,
                        child: Text(
                          effectiveChild.initials,
                          style: TextStyle(
                            color: colorScheme.onPrimaryContainer,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              effectiveChild.name,
                              style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${effectiveChild.className} • Adm: ${effectiveChild.admissionNo}',
                              style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant),
                            ),
                          ],
                        ),
                      ),
                      if (children.length > 1)
                        TextButton.icon(
                          onPressed: () async {
                            final selected = await showChildSwitcherSheet(
                              context,
                              children: children,
                              selectedChild: effectiveChild,
                            );
                            if (selected != null) {
                              ref.read(selectedChildProvider.notifier).selectChild(selected);
                            }
                          },
                          icon: const Icon(Icons.swap_horiz, size: 16),
                          label: const Text('Switch'),
                        ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // 2. Eligible Terms Chips
                eligibleExamsAsync.when(
                  loading: () => const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: LinearProgressIndicator(),
                    ),
                  ),
                  error: (e, _) => const SizedBox.shrink(),
                  data: (terms) {
                    if (terms.isEmpty) return const SizedBox.shrink();

                    final selectedIndex = _selectedTermIndex ?? 0;

                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      height: 38,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: terms.length,
                        separatorBuilder: (_, _) => const SizedBox(width: 8),
                        itemBuilder: (context, index) {
                          final term = terms[index] as Map<String, dynamic>;
                          final termName = term['termName'] as String? ?? 'Term ${index + 1}';
                          final isSelected = index == selectedIndex;

                          return ChoiceChip(
                            label: Text(termName),
                            selected: isSelected,
                            onSelected: (selected) {
                              if (selected) {
                                setState(() => _selectedTermIndex = index);
                              }
                            },
                          );
                        },
                      ),
                    );
                  },
                ),

                // 3. Exam Results / Report Cards
                resultsAsync.when(
                  loading: () => const Center(
                    child: Padding(
                      padding: EdgeInsets.all(32.0),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  error: (err, _) => Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: colorScheme.errorContainer.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Text('Could not load exam results: $err', style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.error)),
                        const SizedBox(height: 8),
                        FilledButton.tonal(
                          onPressed: () => ref.invalidate(childExamResultsProvider(effectiveChild.studentId)),
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                  data: (results) {
                    if (results.isEmpty) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Column(
                            children: [
                              Icon(Icons.assignment_outlined, size: 56, color: colorScheme.outlineVariant),
                              const SizedBox(height: 16),
                              Text(
                                'No Exam Results Published',
                                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Report cards and marks will appear here once published by the school.',
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant),
                              ),
                            ],
                          ),
                        ),
                      );
                    }

                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: results.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final report = results[index] as Map<String, dynamic>;
                        final examName = report['examName'] ?? report['examSetupName'] ?? 'Examination';
                        final percentage = report['percentage'] ?? report['overallPercentage'];
                        final grade = report['grade'] ?? report['overallGrade'] ?? '';
                        final status = report['status'] ?? report['resultStatus'] ?? 'PUBLISHED';
                        final subjects = (report['subjects'] ?? report['items'] ?? []) as List<dynamic>;

                        return Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceContainerLowest,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.04),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                            border: Border.all(
                              color: colorScheme.outlineVariant.withValues(alpha: 0.2),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Header
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      examName.toString(),
                                      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: colorScheme.primaryContainer,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      status.toString(),
                                      style: theme.textTheme.labelSmall?.copyWith(
                                        color: colorScheme.onPrimaryContainer,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              if (percentage != null) ...[
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    Text(
                                      'Overall: $percentage%',
                                      style: theme.textTheme.titleLarge?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: colorScheme.primary,
                                      ),
                                    ),
                                    if (grade.toString().isNotEmpty) ...[
                                      const SizedBox(width: 8),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                        decoration: BoxDecoration(
                                          color: Colors.green.withValues(alpha: 0.15),
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: Text(
                                          'Grade $grade',
                                          style: theme.textTheme.labelSmall?.copyWith(
                                            color: Colors.green.shade800,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                              ],

                              if (subjects.isNotEmpty) ...[
                                const SizedBox(height: 14),
                                const Divider(height: 1),
                                const SizedBox(height: 10),
                                ...subjects.map((sub) {
                                  final s = sub as Map<String, dynamic>;
                                  final sName = s['subjectName'] ?? s['name'] ?? 'Subject';
                                  final sMarks = s['marksObtained'] ?? s['marks'] ?? '-';
                                  final sMax = s['maxMarks'] ?? s['totalMarks'] ?? '100';
                                  final sGrade = s['grade'] ?? '';

                                  return Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 4),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            sName.toString(),
                                            style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Text(
                                          '$sMarks / $sMax',
                                          style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
                                        ),
                                        if (sGrade.toString().isNotEmpty) ...[
                                          const SizedBox(width: 8),
                                          Text(
                                            sGrade.toString(),
                                            style: theme.textTheme.labelSmall?.copyWith(
                                              color: colorScheme.primary,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ],
                                    ),
                                  );
                                }),
                              ],
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
