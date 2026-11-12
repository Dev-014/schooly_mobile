import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'data/academic_providers.dart';
import 'data/academic_repository.dart';

class AdminSubjectManagementScreen extends ConsumerStatefulWidget {
  const AdminSubjectManagementScreen({super.key});

  @override
  ConsumerState<AdminSubjectManagementScreen> createState() =>
      _AdminSubjectManagementScreenState();
}

class _AdminSubjectManagementScreenState
    extends ConsumerState<AdminSubjectManagementScreen> {
  final _nameController = TextEditingController();
  final _codeController = TextEditingController();
  String _selectedType = 'Theory';

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
        'type': _selectedType,
        'credits': 1,
      });

      _nameController.clear();
      _codeController.clear();
      ref.invalidate(subjectsProvider);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Subject created successfully!')),
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
                      'Subject Management',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Define academic subjects, subject codes, and evaluation types.',
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
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.book, color: colorScheme.primary, size: 22),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Create New Subject Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primary.withValues(alpha: 0.08),
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
                            color: colorScheme.secondaryContainer,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.add_task,
                            color: colorScheme.onSecondaryContainer,
                            size: 16,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Create New Subject',
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.onSurface,
                              ),
                            ),
                            Text(
                              'Instant syllabus indexing',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Subject Name
                RichText(
                  text: TextSpan(
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: colorScheme.onSurface,
                    ),
                    children: [
                      const TextSpan(text: 'Subject Name '),
                      TextSpan(
                        text: '*',
                        style: TextStyle(color: colorScheme.error),
                      ),
                    ],
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
                      hintText: 'e.g., Mathematics, Physics, English',
                      prefixIcon: Icon(
                        Icons.edit_note,
                        color: colorScheme.onSurfaceVariant,
                        size: 20,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Subject Code
                Text(
                  'Subject Code',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: colorScheme.onSurface,
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
                      hintText: 'e.g., MATH-101, SCI-09',
                      prefixIcon: Icon(
                        Icons.tag,
                        color: colorScheme.onSurfaceVariant,
                        size: 20,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Subject Type
                Text(
                  'Evaluation / Subject Type',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildTypeBtn(
                          'Theory',
                          Icons.menu_book,
                          colorScheme,
                          theme,
                        ),
                      ),
                      Expanded(
                        child: _buildTypeBtn(
                          'Practical',
                          Icons.science,
                          colorScheme,
                          theme,
                        ),
                      ),
                      Expanded(
                        child: _buildTypeBtn(
                          'Both',
                          Icons.hub,
                          colorScheme,
                          theme,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                ElevatedButton.icon(
                  onPressed: _createSubject,
                  icon: const Icon(Icons.add_circle, size: 20),
                  label: const Text('Create & Add Subject'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                    minimumSize: const Size(double.infinity, 48),
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

          // List Header
          subjectsAsync.maybeWhen(
            data: (subjects) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'All Academic Subjects',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHigh,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${subjects.length} Configured',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),
            orElse: () => Text(
              'All Academic Subjects',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Subject Cards
          subjectsAsync.when(
            data: (subjects) {
              if (subjects.isEmpty) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('No subjects found.'),
                  ),
                );
              }
              return Column(
                children: subjects.map((item) {
                  return _buildSubjectItem(
                    item['id'] as int,
                    item['name'] ?? '',
                    item['code'] ?? '-',
                    item['type'] ?? 'Theory',
                    Icons.book,
                    colorScheme.primaryFixed,
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

  Widget _buildTypeBtn(
    String text,
    IconData icon,
    ColorScheme colorScheme,
    ThemeData theme,
  ) {
    final isSelected = _selectedType == text;
    return GestureDetector(
      onTap: () => setState(() => _selectedType = text),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.surfaceContainerLowest
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 16,
              color: isSelected
                  ? colorScheme.primary
                  : colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: 4),
            Text(
              text,
              style: theme.textTheme.labelMedium?.copyWith(
                color: isSelected
                    ? colorScheme.primary
                    : colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubjectItem(
    int id,
    String name,
    String code,
    String type,
    IconData icon,
    Color iconBg,
    Color iconColor,
    ColorScheme colorScheme,
    ThemeData theme,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
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
                  child: Icon(icon, color: iconColor, size: 18),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          name,
                          style: theme.textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                          ),
                          overflow: TextOverflow.ellipsis,
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
                          code,
                          style: theme.textTheme.labelSmall?.copyWith(
                            fontSize: 9,
                            fontFamily: 'monospace',
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: type == 'Both'
                              ? colorScheme.secondaryContainer.withValues(
                                  alpha: 0.7,
                                )
                              : colorScheme.surfaceContainer,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          type,
                          style: theme.textTheme.labelSmall?.copyWith(
                            fontSize: 9,
                            color: type == 'Both'
                                ? colorScheme.onSecondaryContainer
                                : colorScheme.onSurfaceVariant,
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
                  child: Icon(Icons.delete, size: 16, color: colorScheme.error),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
