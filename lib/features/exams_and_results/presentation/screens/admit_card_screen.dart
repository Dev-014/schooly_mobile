import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/exams_and_results_repository.dart';
import '../../providers/exams_and_results_providers.dart';


final acExamIdProvider = StateProvider<String>((ref) => '');
final acClassIdProvider = StateProvider<String>((ref) => '1');

class AdmitCardScreen extends ConsumerWidget {
  const AdmitCardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    final examId = ref.watch(acExamIdProvider);
    final classId = ref.watch(acClassIdProvider);
    
    final setupsState = ref.watch(examSetupsProvider);
    final admitCardsState = ref.watch(examAdmitCardsProvider((
      examId: examId.isEmpty ? null : examId,
      classId: classId,
    )));

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text('Admit Cards', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: colorScheme.surface,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Filters
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: setupsState.when(
                    data: (setups) {
                      if (setups.isEmpty) return const Text('No exams');
                      if (examId.isEmpty) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          ref.read(acExamIdProvider.notifier).state = setups[0]['id'].toString();
                        });
                      }
                      return DropdownButtonFormField<String>(
                        value: examId.isEmpty ? setups[0]['id'].toString() : examId,
                        decoration: const InputDecoration(labelText: 'Exam', border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(horizontal: 8)),
                        items: setups.map<DropdownMenuItem<String>>((s) => DropdownMenuItem(value: s['id'].toString(), child: Text(s['name'] ?? ''))).toList(),
                        onChanged: (val) {
                          if (val != null) ref.read(acExamIdProvider.notifier).state = val;
                        },
                      );
                    },
                    loading: () => const CircularProgressIndicator(),
                    error: (e, _) => Text('Error: $e'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    initialValue: classId,
                    decoration: const InputDecoration(labelText: 'Class ID', border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(horizontal: 8)),
                    onChanged: (val) => ref.read(acClassIdProvider.notifier).state = val,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // List
            Expanded(
              child: admitCardsState.when(
                data: (cards) {
                  if (cards.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.badge, size: 48, color: colorScheme.primary.withValues(alpha: 0.5)),
                          const SizedBox(height: 16),
                          Text('No admit cards generated', style: theme.textTheme.titleMedium),
                          const SizedBox(height: 8),
                          Text('Use the + button to generate for this class.', style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                        ],
                      ),
                    );
                  }
                  return ListView.separated(
                    itemCount: cards.length,
                    separatorBuilder: (c, i) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final card = cards[index];
                      return ListTile(
                        leading: const CircleAvatar(child: Icon(Icons.person)),
                        title: Text(card['studentName'] ?? 'Unknown', style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text('Roll: ${card['rollNumber'] ?? 'N/A'}\nStatus: ${card['status'] ?? 'DRAFT'}'),
                        isThreeLine: true,
                        trailing: OutlinedButton.icon(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Downloading/Printing Admit Card...')));
                          },
                          icon: const Icon(Icons.download, size: 16),
                          label: const Text('PDF'),
                        ),
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
        onPressed: () async {
          if (examId.isEmpty || classId.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please select Exam and Class')));
            return;
          }
          final confirm = await showDialog<bool>(
            context: context,
            builder: (c) => AlertDialog(
              title: const Text('Generate Admit Cards'),
              content: const Text('Are you sure you want to generate admit cards for this class?'),
              actions: [
                TextButton(onPressed: () => Navigator.pop(c, false), child: const Text('Cancel')),
                TextButton(onPressed: () => Navigator.pop(c, true), child: const Text('Generate')),
              ],
            ),
          );
          if (confirm == true) {
            try {
              final repo = ref.read(examsAndResultsRepositoryProvider);
              await repo.generateAdmitCards({
                'examSetupId': int.parse(examId),
                'classId': int.parse(classId),
              });
              // ignore: unused_result
              ref.refresh(examAdmitCardsProvider((
                examId: examId,
                classId: classId,
              )).future);
              if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Generation triggered successfully!')));
            } catch (e) {
              if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
            }
          }
        },
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        child: const Icon(Icons.precision_manufacturing),
      ),
    );
  }
}
