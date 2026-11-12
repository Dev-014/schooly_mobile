import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/exams_and_results_repository.dart';
import '../../providers/exams_and_results_providers.dart';



class DivisionSetupScreen extends ConsumerWidget {
  const DivisionSetupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final divisionsState = ref.watch(examDivisionsProvider);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text('Division Setup', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: colorScheme.surface,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Define the performance thresholds and nomenclature for academic divisions.', style: theme.textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant)),
            const SizedBox(height: 24),
            Expanded(
              child: divisionsState.when(
                data: (divisions) {
                  if (divisions.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.pie_chart, size: 48, color: colorScheme.primary.withValues(alpha: 0.5)),
                          const SizedBox(height: 16),
                          Text('No divisions found', style: theme.textTheme.titleMedium),
                          const SizedBox(height: 8),
                          Text('Tap the + button to add a new division.', style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                        ],
                      ),
                    );
                  }
                  return ListView.separated(
                    itemCount: divisions.length,
                    separatorBuilder: (c, i) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final div = divisions[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: colorScheme.secondaryContainer,
                          child: Text(div['name']?.substring(0, 1) ?? '', style: TextStyle(color: colorScheme.onSecondaryContainer, fontWeight: FontWeight.bold)),
                        ),
                        title: Text(div['name'] ?? 'Division', style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text('Threshold: ${div['percentFrom'] ?? 0}% - ${div['percentTo'] ?? 0}%\nDesc: ${div['description'] ?? 'N/A'}'),
                        isThreeLine: true,
                        trailing: const Icon(Icons.chevron_right), // Simplified no-delete for now, like web
                      );
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Center(child: Text('Error: $e')),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (ctx) => const _DivisionSetupSheet(),
          );
        },
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _DivisionSetupSheet extends ConsumerStatefulWidget {
  const _DivisionSetupSheet();

  @override
  ConsumerState<_DivisionSetupSheet> createState() => _DivisionSetupSheetState();
}

class _DivisionSetupSheetState extends ConsumerState<_DivisionSetupSheet> {
  final _nameController = TextEditingController();
  final _minController = TextEditingController(text: '60');
  final _maxController = TextEditingController(text: '100');
  final _descController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 24,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Add Division', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Division Name (e.g. First Class)', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _minController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'From %', border: OutlineInputBorder()),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: _maxController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'To %', border: OutlineInputBorder()),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descController,
              decoration: const InputDecoration(labelText: 'Description', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _isLoading ? null : () async {
                setState(() => _isLoading = true);
                try {
                  final repo = ref.read(examsAndResultsRepositoryProvider);
                  await repo.createExamDivision({
                    'name': _nameController.text.trim(),
                    'percentFrom': double.tryParse(_minController.text) ?? 0.0,
                    'percentTo': double.tryParse(_maxController.text) ?? 0.0,
                    'description': _descController.text.trim(),
                    'colorTag': 'BLUE',
                    'status': 'ACTIVE',
                  });
                  // ignore: unused_result
                  ref.refresh(examDivisionsProvider.future);
                  if (context.mounted) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Division saved!')));
                  }
                } catch (e) {
                  if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
                } finally {
                  if (mounted) setState(() => _isLoading = false);
                }
              },
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16)),
              child: _isLoading ? const CircularProgressIndicator() : const Text('Save'),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
