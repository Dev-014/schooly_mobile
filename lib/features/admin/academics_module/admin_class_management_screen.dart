import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'data/academic_providers.dart';
import 'data/academic_repository.dart';

class AdminClassManagementScreen extends ConsumerStatefulWidget {
  const AdminClassManagementScreen({super.key});

  @override
  ConsumerState<AdminClassManagementScreen> createState() =>
      _AdminClassManagementScreenState();
}

class _AdminClassManagementScreenState
    extends ConsumerState<AdminClassManagementScreen> {
  final _classNameController = TextEditingController();
  final _numericCodeController = TextEditingController();
  String _selectedWing = 'Primary';

  @override
  void dispose() {
    _classNameController.dispose();
    _numericCodeController.dispose();
    super.dispose();
  }

  Future<void> _createClass() async {
    final name = _classNameController.text.trim();
    final sortId = int.tryParse(_numericCodeController.text.trim()) ?? 0;

    if (name.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Class Name is required')));
      return;
    }

    try {
      final repo = ref.read(academicRepositoryProvider);
      await repo.createClass({
        'name': name,
        'wingLevel': _selectedWing,
        'sortId': sortId,
      });

      _classNameController.clear();
      _numericCodeController.clear();
      ref.invalidate(classesProvider);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Class created successfully!')),
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

  Future<void> _deleteClass(int id) async {
    try {
      final repo = ref.read(academicRepositoryProvider);
      await repo.deleteClass(id);
      ref.invalidate(classesProvider);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Class deleted')));
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
    final classesAsync = ref.watch(classesProvider);

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
                      'Class Management',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Create classes and set numeric order for grade levels',
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
                ),
                child: Icon(
                  Icons.auto_stories,
                  color: colorScheme.primary,
                  size: 22,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Direct Creation Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primary.withValues(alpha: 0.08),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
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
                            Icons.add_circle,
                            color: colorScheme.onSecondaryContainer,
                            size: 16,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Create New Class',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Fast Setup',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Class Name
                RichText(
                  text: TextSpan(
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                    children: [
                      const TextSpan(text: 'Class Name '),
                      TextSpan(
                        text: '*',
                        style: TextStyle(color: colorScheme.tertiary),
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
                    controller: _classNameController,
                    decoration: InputDecoration(
                      hintText: 'e.g., Class 11 or Nursery',
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

                // Wing Level
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                        children: [
                          const TextSpan(text: 'School Level / Wing '),
                          TextSpan(
                            text: '*',
                            style: TextStyle(color: colorScheme.tertiary),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Category',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontSize: 10,
                      ),
                    ),
                  ],
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
                        child: _buildWingBtn('Primary', colorScheme, theme),
                      ),
                      Expanded(
                        child: _buildWingBtn('Secondary', colorScheme, theme),
                      ),
                      Expanded(
                        child: _buildWingBtn('Higher Sec', colorScheme, theme),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Numeric Code
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                        children: [
                          const TextSpan(text: 'Numeric Code / Grade Order '),
                          TextSpan(
                            text: '*',
                            style: TextStyle(color: colorScheme.tertiary),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Sort ID',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: _numericCodeController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'e.g., 11',
                      prefixIcon: Icon(
                        Icons.format_list_numbered,
                        color: colorScheme.onSurfaceVariant,
                        size: 20,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                ElevatedButton.icon(
                  onPressed: _createClass,
                  icon: const Icon(Icons.add_circle, size: 20),
                  label: const Text('Save & Create Class'),
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

          // Existing Classes Header
          classesAsync.maybeWhen(
            data: (classesList) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Existing Classes',
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
                        color: colorScheme.primaryFixed,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '${classesList.length} Classes',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.onPrimaryFixedVariant,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            orElse: () => Text(
              'Existing Classes',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
          ),

          const SizedBox(height: 12),

          // List
          classesAsync.when(
            data: (classesList) {
              if (classesList.isEmpty) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('No classes found.'),
                  ),
                );
              }
              return Column(
                children: classesList.map((item) {
                  final code =
                      '#${(item['sortId'] ?? 0).toString().padLeft(2, '0')}';
                  return _buildClassItem(
                    item['id'] as int,
                    code,
                    item['name'] ?? '',
                    item['wingLevel'] ?? 'Primary',
                    true,
                    colorScheme,
                    theme,
                  );
                }).toList(),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, st) => Text('Error: $e'),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildWingBtn(String text, ColorScheme colorScheme, ThemeData theme) {
    final isSelected = _selectedWing == text;
    return GestureDetector(
      onTap: () => setState(() => _selectedWing = text),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? colorScheme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ]
              : null,
        ),
        child: Center(
          child: Text(
            text,
            style: theme.textTheme.labelMedium?.copyWith(
              color: isSelected
                  ? colorScheme.onPrimary
                  : colorScheme.onSurfaceVariant,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildClassItem(
    int id,
    String code,
    String name,
    String category,
    bool isActiveCategory,
    ColorScheme colorScheme,
    ThemeData theme,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: isActiveCategory
                      ? colorScheme.primaryFixed
                      : colorScheme.surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  code,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: isActiveCategory
                        ? colorScheme.onPrimaryFixedVariant
                        : colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                name,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  category,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: isActiveCategory
                      ? colorScheme.secondaryContainer
                      : colorScheme.surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Active',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: isActiveCategory
                        ? colorScheme.onSecondaryContainer
                        : colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () => _deleteClass(id),
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: colorScheme.errorContainer,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.delete,
                    size: 18,
                    color: colorScheme.onErrorContainer,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
