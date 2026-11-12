import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../auth/providers/auth_provider.dart';

import 'providers/admin_student_houses_provider.dart';

class AdminStudentHousesScreen extends ConsumerStatefulWidget {
  const AdminStudentHousesScreen({super.key});

  @override
  ConsumerState<AdminStudentHousesScreen> createState() =>
      _AdminStudentHousesScreenState();
}

class _AdminStudentHousesScreenState
    extends ConsumerState<AdminStudentHousesScreen> {
  String get _schoolId =>
      ref.read(authProvider)?.schoolId?.toString() ?? '1000';
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _colorController = TextEditingController();

  String? _editingId;
  final _editNameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _colorController.dispose();
    _editNameController.dispose();
    super.dispose();
  }

  void _submitHouse() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) return;
    final desc = _descriptionController.text.trim();
    final color = _colorController.text.trim();

    await ref
        .read(studentHousesControllerProvider(_schoolId).notifier)
        .addHouse(name, desc, color);
    _nameController.clear();
    _descriptionController.clear();
    _colorController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final housesAsync = ref.watch(studentHousesControllerProvider(_schoolId));

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
                  child: Icon(Icons.home, color: colorScheme.primary),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Houses Dashboard',
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
                            'Manage student houses',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
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
                      'Create New House',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'House Name *',
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
                const SizedBox(height: 12),
                TextField(
                  controller: _colorController,
                  decoration: InputDecoration(
                    labelText: 'Color Hex Code (e.g. #FF0000)',
                    prefixIcon: Icon(
                      Icons.color_lens,
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
                  onPressed: _submitHouse,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(48),
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                    elevation: 2,
                  ),
                  child: const Text(
                    'Save House',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),
          Text(
            'Existing Houses',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

          housesAsync.when(
            data: (houses) {
              if (houses.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(child: Text('No houses found.')),
                );
              }
              return Column(
                children: houses.map((house) {
                  final id = house['id'].toString();
                  final name = house['name']?.toString() ?? 'Unnamed';
                  final colorStr = house['color']?.toString();
                  Color? houseColor;
                  if (colorStr != null && colorStr.isNotEmpty) {
                    try {
                      houseColor = Color(
                        int.parse(colorStr.replaceAll('#', '0xff')),
                      );
                    } catch (_) {}
                  }

                  if (_editingId == id) {
                    return _buildEditItem(id, name, colorScheme, theme);
                  }

                  return _buildHouseItem(
                    id,
                    name,
                    houseColor,
                    colorScheme,
                    theme,
                  );
                }).toList(),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Text('Error loading houses: $err'),
          ),
        ],
      ),
    );
  }

  Widget _buildHouseItem(
    String id,
    String name,
    Color? houseColor,
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
              color: houseColor ?? colorScheme.surfaceContainerHigh,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.home,
              color: houseColor != null ? Colors.white : colorScheme.primary,
            ),
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
                  .read(studentHousesControllerProvider(_schoolId).notifier)
                  .deleteHouse(id);
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
                    .read(studentHousesControllerProvider(_schoolId).notifier)
                    .updateHouse(id, newName, '', '');
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
