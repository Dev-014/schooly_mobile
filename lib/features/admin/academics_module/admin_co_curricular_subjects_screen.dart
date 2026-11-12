import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'data/academic_providers.dart';
import 'data/academic_repository.dart';

class AdminCoCurricularSubjectsScreen extends ConsumerStatefulWidget {
  const AdminCoCurricularSubjectsScreen({super.key});

  @override
  ConsumerState<AdminCoCurricularSubjectsScreen> createState() =>
      _AdminCoCurricularSubjectsScreenState();
}

class _AdminCoCurricularSubjectsScreenState
    extends ConsumerState<AdminCoCurricularSubjectsScreen> {
  final _nameController = TextEditingController();
  final _codeController = TextEditingController();
  String _selectedEvalFormat = 'Grades';

  @override
  void dispose() {
    _nameController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  Future<void> _createSubject() async {
    final name = _nameController.text.trim();
    final code = _codeController.text.trim();

    if (name.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Subject Name is required')));
      return;
    }

    try {
      final repo = ref.read(academicRepositoryProvider);
      await repo.createSubject({
        'name': name,
        'code': code.isNotEmpty ? code : null,
        'type': 'Co-Curricular',
        'credits': 1,
        'status': _selectedEvalFormat,
      });

      _nameController.clear();
      _codeController.clear();
      ref.invalidate(subjectsProvider);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Co-curricular subject created!')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    }
  }

  Future<void> _deleteSubject(int id) async {
    try {
      final repo = ref.read(academicRepositoryProvider);
      await repo.deleteSubject(id);
      ref.invalidate(subjectsProvider);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Subject deleted')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final subjectsAsync = ref.watch(subjectsProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Intro Banner
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Co-Curricular Subjects',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Create and manage non-academic, activity, and skill-based learning.',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: colorScheme.primaryFixed,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.palette,
                  color: colorScheme.primary,
                  size: 22,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Add Co-Curricular Form Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primary.withValues(alpha: 0.06),
                  blurRadius: 24,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            color: colorScheme.surfaceContainer,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.add_circle,
                            color: colorScheme.primary,
                            size: 16,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Add Co-Curricular Subject',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Subject Name
                Text(
                  'Subject Name',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'e.g. Karate & Self Defense',
                      prefixIcon: Icon(
                        Icons.edit_note,
                        color: colorScheme.outline,
                        size: 18,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Code
                Text(
                  'Subject Code',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: _codeController,
                    textCapitalization: TextCapitalization.characters,
                    decoration: InputDecoration(
                      hintText: 'e.g. PE, ART',
                      prefixIcon: Icon(
                        Icons.tag,
                        color: colorScheme.outline,
                        size: 18,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Evaluation Format
                Text(
                  'Evaluation / Grading Format',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Expanded(
                      child: _buildEvalBtn(
                        'Grades',
                        Icons.grade,
                        colorScheme,
                        theme,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: _buildEvalBtn(
                        'Pass / Fail',
                        Icons.check_circle,
                        colorScheme,
                        theme,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: _buildEvalBtn(
                        'Rubric / Pts',
                        Icons.bar_chart,
                        colorScheme,
                        theme,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                ElevatedButton.icon(
                  onPressed: _createSubject,
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text('Add Co-Curricular Subject'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                    minimumSize: const Size(double.infinity, 44),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    elevation: 2,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Directory Bar
          subjectsAsync.maybeWhen(
            data: (subjects) {
              final coCurricular = subjects
                  .where((s) => s['type'] == 'Co-Curricular')
                  .toList();
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Configured Subjects',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.secondaryContainer,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '${coCurricular.length} Active',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: colorScheme.onSecondaryContainer,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
            orElse: () => Text(
              'Configured Subjects',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Subject Directory Rows
          subjectsAsync.when(
            data: (subjects) {
              final coCurricular = subjects
                  .where((s) => s['type'] == 'Co-Curricular')
                  .toList();
              if (coCurricular.isEmpty) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('No co-curricular subjects found.'),
                  ),
                );
              }
              return Column(
                children: coCurricular.map((item) {
                  return _buildDirectoryRow(
                    item['id'] as int,
                    item['code'] ?? 'CC',
                    item['name'] ?? '',
                    'Co-Curricular',
                    item['status'] ?? 'Grades',
                    colorScheme.surfaceContainerHigh,
                    colorScheme.primary,
                    colorScheme,
                    theme,
                  );
                }).toList(),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, st) => Text('Error: $e'),
          ),
        ],
      ),
    );
  }

  Widget _buildEvalBtn(
    String text,
    IconData icon,
    ColorScheme colorScheme,
    ThemeData theme,
  ) {
    final isSelected = _selectedEvalFormat == text;
    return GestureDetector(
      onTap: () => setState(() => _selectedEvalFormat = text),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.primaryFixed
              : colorScheme.surfaceContainerLow,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 14,
              color: isSelected
                  ? colorScheme.onPrimaryFixed
                  : colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: 4),
            Text(
              text,
              style: theme.textTheme.labelSmall?.copyWith(
                color: isSelected
                    ? colorScheme.onPrimaryFixed
                    : colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDirectoryRow(
    int id,
    String shortCode,
    String title,
    String category,
    String type,
    Color iconBg,
    Color iconColor,
    ColorScheme colorScheme,
    ThemeData theme,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: iconBg,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      shortCode,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: iconColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          title,
                          style: theme.textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '•',
                        style: TextStyle(
                          color: colorScheme.outline,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        category,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '•',
                        style: TextStyle(
                          color: colorScheme.outline,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceContainer,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          type,
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () => _deleteSubject(id),
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.delete, size: 18, color: colorScheme.error),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
