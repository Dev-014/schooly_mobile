import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../data/models/parent_models.dart';
import '../providers/parent_providers.dart';
import '../more/child_switcher_sheet.dart';

class ParentHomeworkScreen extends ConsumerStatefulWidget {
  const ParentHomeworkScreen({super.key});

  @override
  ConsumerState<ParentHomeworkScreen> createState() => _ParentHomeworkScreenState();
}

class _ParentHomeworkScreenState extends ConsumerState<ParentHomeworkScreen> {
  String _selectedFilter = 'all'; // 'all', 'pending', 'submitted', 'evaluated'

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
          'Homework & Tasks',
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
                Text(
                  'Failed to load wards',
                  style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  err.toString(),
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant),
                ),
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
                    Text(
                      'No Wards Found',
                      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
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
          final hwParams = (
            studentId: effectiveChild.studentId,
            schoolId: effectiveChild.schoolId,
          );
          final homeworkAsync = ref.watch(childHomeworkProvider(hwParams));

          return Column(
            children: [
              // 1. Child Header Card
              Container(
                color: colorScheme.surface,
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                child: Container(
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
              ),

              // 2. Filter Tabs
              homeworkAsync.maybeWhen(
                data: (tasks) {
                  final pendingCount = tasks.where((t) => !t.isSubmitted).length;
                  final submittedCount = tasks.where((t) => t.isSubmitted && !t.isEvaluated).length;
                  final evaluatedCount = tasks.where((t) => t.isEvaluated).length;

                  return Container(
                    color: colorScheme.surface,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: SizedBox(
                      height: 38,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildFilterChip('all', 'All (${tasks.length})', colorScheme, theme),
                          const SizedBox(width: 8),
                          _buildFilterChip('pending', 'Pending ($pendingCount)', colorScheme, theme),
                          const SizedBox(width: 8),
                          _buildFilterChip('submitted', 'Submitted ($submittedCount)', colorScheme, theme),
                          const SizedBox(width: 8),
                          _buildFilterChip('evaluated', 'Evaluated ($evaluatedCount)', colorScheme, theme),
                        ],
                      ),
                    ),
                  );
                },
                orElse: () => const SizedBox.shrink(),
              ),

              const Divider(height: 1),

              // 3. Homework List
              Expanded(
                child: homeworkAsync.when(
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (err, _) => Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.assignment_late_outlined, size: 48, color: colorScheme.error),
                          const SizedBox(height: 12),
                          Text(
                            'Could not fetch assignments',
                            style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            err.toString(),
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant),
                          ),
                          const SizedBox(height: 16),
                          FilledButton.tonal(
                            onPressed: () => ref.invalidate(childHomeworkProvider(hwParams)),
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  data: (tasks) {
                    final filteredTasks = tasks.where((t) {
                      if (_selectedFilter == 'pending') return !t.isSubmitted;
                      if (_selectedFilter == 'submitted') return t.isSubmitted && !t.isEvaluated;
                      if (_selectedFilter == 'evaluated') return t.isEvaluated;
                      return true;
                    }).toList();

                    if (filteredTasks.isEmpty) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.assignment_turned_in_outlined, size: 56, color: colorScheme.outlineVariant),
                              const SizedBox(height: 16),
                              Text(
                                'No Assignments Found',
                                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'There are no $_selectedFilter homework tasks for ${effectiveChild.name}.',
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant),
                              ),
                            ],
                          ),
                        ),
                      );
                    }

                    return RefreshIndicator(
                      onRefresh: () async {
                        ref.invalidate(childHomeworkProvider(hwParams));
                      },
                      child: ListView.separated(
                        padding: const EdgeInsets.all(16),
                        itemCount: filteredTasks.length,
                        separatorBuilder: (_, _) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final hw = filteredTasks[index];
                          return _buildHomeworkCard(hw, colorScheme, theme);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildFilterChip(String key, String label, ColorScheme colorScheme, ThemeData theme) {
    final isSelected = _selectedFilter == key;
    return GestureDetector(
      onTap: () => setState(() => _selectedFilter = key),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? colorScheme.primary : colorScheme.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            label,
            style: theme.textTheme.labelMedium?.copyWith(
              color: isSelected ? colorScheme.onPrimary : colorScheme.onSurfaceVariant,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHomeworkCard(ParentHomeworkAssignment hw, ColorScheme colorScheme, ThemeData theme) {
    Color badgeColor = Colors.orange;
    String badgeText = 'Pending';

    if (hw.isEvaluated) {
      badgeColor = Colors.green;
      badgeText = hw.marksObtained != null && hw.maxMarks != null
          ? 'Graded: ${hw.marksObtained!.toInt()}/${hw.maxMarks!.toInt()}'
          : 'Evaluated';
    } else if (hw.isSubmitted) {
      badgeColor = Colors.blue;
      badgeText = 'Submitted';
    }

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
          // Top Row: Subject + Status Badge
          Row(
            children: [
              if (hw.subjectName != null && hw.subjectName!.isNotEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    hw.subjectName!,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: badgeColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  badgeText,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: badgeColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Title
          Text(
            hw.title,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          // Description
          if (hw.description != null && hw.description!.isNotEmpty) ...[
            const SizedBox(height: 6),
            Text(
              hw.description!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],

          const SizedBox(height: 12),
          const Divider(height: 1),
          const SizedBox(height: 10),

          // Footer details: Teacher, Assigned Date, Due Date
          Row(
            children: [
              if (hw.teacherName != null && hw.teacherName!.isNotEmpty) ...[
                Icon(Icons.person_outline, size: 14, color: colorScheme.onSurfaceVariant),
                const SizedBox(width: 4),
                Text(
                  hw.teacherName!,
                  style: theme.textTheme.labelSmall?.copyWith(color: colorScheme.onSurfaceVariant),
                ),
                const Spacer(),
              ],
              if (hw.dueDate != null) ...[
                Icon(Icons.event_outlined, size: 14, color: colorScheme.onSurfaceVariant),
                const SizedBox(width: 4),
                Text(
                  'Due: ${hw.dueDate}',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ],
          ),

          // Remarks if evaluated
          if (hw.remarks != null && hw.remarks!.isNotEmpty) ...[
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHigh.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Feedback: ${hw.remarks}',
                style: theme.textTheme.bodySmall?.copyWith(
                  fontStyle: FontStyle.italic,
                  color: colorScheme.onSurface,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
