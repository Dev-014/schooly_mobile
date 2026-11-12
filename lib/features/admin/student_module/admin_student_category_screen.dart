import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../auth/providers/auth_provider.dart';

import 'providers/admin_student_category_provider.dart';

class AdminStudentCategoryScreen extends ConsumerStatefulWidget {
  const AdminStudentCategoryScreen({super.key});

  @override
  ConsumerState<AdminStudentCategoryScreen> createState() =>
      _AdminStudentCategoryScreenState();
}

class _AdminStudentCategoryScreenState
    extends ConsumerState<AdminStudentCategoryScreen> {
  String get _schoolId =>
      ref.read(authProvider)?.schoolId?.toString() ?? '1000';
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  String? _editingId;
  final _editNameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _editNameController.dispose();
    super.dispose();
  }

  void _submitCategory() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) return;
    final desc = _descriptionController.text.trim();

    await ref
        .read(studentCategoryControllerProvider(_schoolId).notifier)
        .addCategory(name, desc);
    _nameController.clear();
    _descriptionController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final categoriesAsync = ref.watch(
      studentCategoryControllerProvider(_schoolId),
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.category, color: colorScheme.primary),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Category Roster',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: colorScheme.secondary,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Manage student categories',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.verified,
                        size: 14,
                        color: colorScheme.primary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'ACTIVE',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: colorScheme.primaryContainer,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.add,
                        size: 16,
                        color: colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Create New Category',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'QUICK SETUP',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Category Name *',
                    prefixIcon: Icon(
                      Icons.label_outline,
                      color: colorScheme.outline,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: colorScheme.surfaceContainerLow,
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    prefixIcon: Icon(
                      Icons.description_outlined,
                      color: colorScheme.outline,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: colorScheme.surfaceContainerLow,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _submitCategory,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(48),
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                    elevation: 2,
                  ),
                  child: const Text(
                    'Save Category',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),
          Text(
            'Existing Categories',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

          categoriesAsync.when(
            data: (categories) {
              if (categories.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(child: Text('No categories found.')),
                );
              }
              return Column(
                children: categories.map((cat) {
                  final id = cat['id'].toString();
                  final name = cat['name']?.toString() ?? 'Unnamed';

                  if (_editingId == id) {
                    return _buildEditItem(id, name, colorScheme, theme);
                  }

                  return _buildCategoryItem(id, name, colorScheme, theme);
                }).toList(),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Text('Error loading categories: $err'),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(
    String id,
    String name,
    ColorScheme colorScheme,
    ThemeData theme,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHigh,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.label, color: colorScheme.primary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'ID: $id',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.edit, color: colorScheme.primary),
            onPressed: () {
              setState(() {
                _editingId = id;
                _editNameController.text = name;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.delete, color: colorScheme.error),
            onPressed: () {
              ref
                  .read(studentCategoryControllerProvider(_schoolId).notifier)
                  .deleteCategory(id);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildEditItem(
    String id,
    String name,
    ColorScheme colorScheme,
    ThemeData theme,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.primary),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _editNameController,
              decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: Icon(Icons.check, color: colorScheme.primary),
            onPressed: () {
              final newName = _editNameController.text.trim();
              if (newName.isNotEmpty) {
                ref
                    .read(studentCategoryControllerProvider(_schoolId).notifier)
                    .updateCategory(id, newName, '');
              }
              setState(() {
                _editingId = null;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.close, color: colorScheme.error),
            onPressed: () {
              setState(() {
                _editingId = null;
              });
            },
          ),
        ],
      ),
    );
  }
}
