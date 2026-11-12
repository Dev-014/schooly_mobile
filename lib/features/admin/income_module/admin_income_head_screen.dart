import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'data/income_providers.dart';
import 'data/income_repository.dart';

class AdminIncomeHeadScreen extends ConsumerStatefulWidget {
  const AdminIncomeHeadScreen({super.key});

  @override
  ConsumerState<AdminIncomeHeadScreen> createState() =>
      _AdminIncomeHeadScreenState();
}

class _AdminIncomeHeadScreenState extends ConsumerState<AdminIncomeHeadScreen> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  Future<void> _createIncomeHead() async {
    final name = _nameController.text.trim();
    final description = _descriptionController.text.trim();

    if (name.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Name is required')));
      return;
    }

    try {
      final repo = ref.read(incomeRepositoryProvider);
      await repo.createIncomeHead({'name': name, 'description': description});
      _nameController.clear();
      _descriptionController.clear();
      ref.invalidate(incomeHeadsProvider);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Income head created successfully')),
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

  Future<void> _deleteIncomeHead(int id) async {
    try {
      final repo = ref.read(incomeRepositoryProvider);
      await repo.deleteIncomeHead(id);
      ref.invalidate(incomeHeadsProvider);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Income head deleted')));
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
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Income Head',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Define and manage revenue categories and accounting heads.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(height: 20),

          // Create Income Head Card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: colorScheme.surfaceContainerHigh),
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
                            color: colorScheme.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.add_chart,
                            color: colorScheme.primary,
                            size: 16,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Create Income Head',
                          style: theme.textTheme.titleSmall?.copyWith(
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
                        color: colorScheme.primaryFixed.withValues(alpha: 0.4),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'New Category',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                Text(
                  'Income Head Title',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                _buildTextField(
                  controller: _nameController,
                  hint: 'e.g. Canteen Rent, Lab Fee, Donation',
                  colorScheme: colorScheme,
                  theme: theme,
                ),

                const SizedBox(height: 12),

                Text(
                  'Description',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                _buildTextField(
                  controller: _descriptionController,
                  hint: 'Optional details',
                  colorScheme: colorScheme,
                  theme: theme,
                ),

                const SizedBox(height: 16),

                ElevatedButton.icon(
                  onPressed: _createIncomeHead,
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text('Add Income Head'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                    minimumSize: const Size(double.infinity, 44),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Configured Income Heads Section
          ref
              .watch(incomeHeadsProvider)
              .when(
                data: (heads) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Configured Income Heads',
                                style: theme.textTheme.titleSmall?.copyWith(
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
                                  color: colorScheme.surfaceContainerHigh,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: colorScheme.outlineVariant
                                        .withValues(alpha: 0.3),
                                  ),
                                ),
                                child: Text(
                                  '${heads.length} Active Heads',
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      if (heads.isEmpty)
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Text('No income heads found.'),
                          ),
                        )
                      else
                        ...heads.map((head) {
                          final name = head['name'] ?? 'Unknown';
                          final codeStr = name.isNotEmpty
                              ? name
                                    .substring(0, min(3, name.length))
                                    .toUpperCase()
                              : 'INC';
                          final description =
                              head['description'] ?? 'No description';
                          final id = head['id'];
                          return _buildHeadItem(
                            id: id,
                            title: name,
                            codeStr: codeStr,
                            fullCode: 'INC-$id',
                            records: description,
                            isPrimary: true,
                            colorScheme: colorScheme,
                            theme: theme,
                          );
                        }),
                    ],
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, st) => Center(child: Text('Error: $e')),
              ),
        ],
      ),
    );
  }

  int min(int a, int b) => a < b ? a : b;

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required ColorScheme colorScheme,
    required ThemeData theme,
  }) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.5),
        ),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.outlineVariant,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
        ),
        style: theme.textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurface,
        ),
      ),
    );
  }

  Widget _buildHeadItem({
    required int id,
    required String title,
    required String codeStr,
    required String fullCode,
    required String records,
    required bool isPrimary,
    required ColorScheme colorScheme,
    required ThemeData theme,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.3),
        ),
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
                    color: isPrimary
                        ? colorScheme.surfaceContainerHigh
                        : colorScheme.primaryFixed.withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      codeStr,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: isPrimary
                            ? colorScheme.primary
                            : colorScheme.onPrimaryFixedVariant,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
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
                          Expanded(
                            child: Text(
                              title,
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.onSurface,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 8),
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
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Text(
                            'Code: ',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                          Text(
                            fullCode,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurface,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '•',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.outlineVariant,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              records,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.primary,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
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
          Row(
            children: [
              IconButton(
                onPressed: () => _deleteIncomeHead(id),
                icon: const Icon(Icons.delete, size: 16),
                color: colorScheme.error,
                padding: const EdgeInsets.all(6),
                constraints: const BoxConstraints(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
