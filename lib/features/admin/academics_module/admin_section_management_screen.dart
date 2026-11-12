import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'data/academic_providers.dart';
import 'data/academic_repository.dart';

class AdminSectionManagementScreen extends ConsumerStatefulWidget {
  const AdminSectionManagementScreen({super.key});

  @override
  ConsumerState<AdminSectionManagementScreen> createState() =>
      _AdminSectionManagementScreenState();
}

class _AdminSectionManagementScreenState
    extends ConsumerState<AdminSectionManagementScreen> {
  final _nameController = TextEditingController();
  final _capacityController = TextEditingController();
  int? _selectedClassId;

  @override
  void dispose() {
    _nameController.dispose();
    _capacityController.dispose();
    super.dispose();
  }

  Future<void> _createSection() async {
    final name = _nameController.text.trim();
    final capacity = int.tryParse(_capacityController.text.trim()) ?? 40;

    if (name.isEmpty || _selectedClassId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Name and Class are required')),
      );
      return;
    }

    try {
      final repo = ref.read(academicRepositoryProvider);
      await repo.createSection({
        'name': name,
        'classId': _selectedClassId,
        'capacity': capacity,
      });

      _nameController.clear();
      _capacityController.clear();
      ref.invalidate(sectionsProvider);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Section created successfully!')),
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

  Future<void> _deleteSection(int id) async {
    try {
      final repo = ref.read(academicRepositoryProvider);
      await repo.deleteSection(id);
      ref.invalidate(sectionsProvider);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Section deleted')));
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
    final sectionsAsync = ref.watch(sectionsProvider);
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
                      'Section Management',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Create and manage class sections and division intakes.',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: colorScheme.secondaryContainer.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: colorScheme.secondary,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Active',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorScheme.onSecondaryContainer,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Create New Section Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primary.withValues(alpha: 0.06),
                  blurRadius: 20,
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
                            color: colorScheme.primaryFixed,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.add_circle,
                            color: colorScheme.primary,
                            size: 16,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Create New Section',
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
                        color: colorScheme.surfaceContainerLow,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Fast Setup',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Section Name
                Text(
                  'Section / Division Name',
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
                      hintText: 'e.g. Section A',
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

                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Assign to Class',
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(height: 6),
                          classesAsync.when(
                            data: (classes) => Container(
                              height: 44,
                              decoration: BoxDecoration(
                                color: colorScheme.surfaceContainerLow,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<int>(
                                  isExpanded: true,
                                  value: _selectedClassId,
                                  hint: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                    ),
                                    child: Text(
                                      'Select Class',
                                      style: theme.textTheme.bodyMedium
                                          ?.copyWith(
                                            color: colorScheme.outline,
                                          ),
                                    ),
                                  ),
                                  items: classes
                                      .map(
                                        (c) => DropdownMenuItem<int>(
                                          value: c['id'] as int,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 12,
                                            ),
                                            child: Text(
                                              c['name'],
                                              style: theme.textTheme.bodyMedium,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (v) =>
                                      setState(() => _selectedClassId = v),
                                  icon: Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Icon(
                                      Icons.expand_more,
                                      color: colorScheme.onSurfaceVariant,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            loading: () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            error: (e, st) => Text('Error: $e'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Max Student Intake',
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
                              controller: _capacityController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'e.g. 40',
                                prefixIcon: Icon(
                                  Icons.groups,
                                  color: colorScheme.onSurfaceVariant,
                                  size: 20,
                                ),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                ElevatedButton.icon(
                  onPressed: _createSection,
                  icon: const Icon(Icons.add, size: 20),
                  label: const Text('Add Section'),
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

          // Existing Sections Header
          sectionsAsync.maybeWhen(
            data: (sectionsList) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Existing Sections',
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
                        '${sectionsList.length} Active',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            orElse: () => Text(
              'Existing Sections',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
          ),

          const SizedBox(height: 12),

          // List
          sectionsAsync.when(
            data: (sectionsList) {
              if (sectionsList.isEmpty) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('No sections found.'),
                  ),
                );
              }
              return Column(
                children: sectionsList.map((item) {
                  final shortName = item['name'] ?? '';
                  final name = 'Section $shortName';
                  final details =
                      '${item['capacity'] ?? 0} Max Intake • Class: ${item['className'] ?? '-'}';
                  return _buildSectionItem(
                    item['id'] as int,
                    shortName,
                    name,
                    details,
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
        ],
      ),
    );
  }

  Widget _buildSectionItem(
    int id,
    String shortName,
    String name,
    String details,
    bool isActiveStyle,
    ColorScheme colorScheme,
    ThemeData theme,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
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
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: isActiveStyle
                        ? colorScheme.primaryFixed
                        : colorScheme.surfaceContainerHigh,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      shortName,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 9,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              name,
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.onSurface,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: colorScheme.secondary,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        details,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontSize: 11,
                        ),
                        overflow: TextOverflow.ellipsis,
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
                onTap: () => _deleteSection(id),
                child: Container(
                  width: 32,
                  height: 32,
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
