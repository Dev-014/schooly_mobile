import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../providers/exams_and_results_providers.dart';
import '../../data/exams_and_results_repository.dart';
import '../../../auth/providers/auth_provider.dart';

class TermSetupScreen extends ConsumerWidget {
  const TermSetupScreen({super.key});

  void _showForm(BuildContext context, WidgetRef ref, [dynamic term]) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => _TermFormSheet(term: term),
    ).then((_) {
      ref.refresh(examTermsProvider.future);
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final termsState = ref.watch(examTermsProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Term Setup'),
        backgroundColor: colorScheme.surface.withValues(alpha: 0.85),
      ),
      body: termsState.when(
        data: (terms) {
          if (terms.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.event_note, size: 48, color: colorScheme.surfaceContainerHighest),
                  const SizedBox(height: 16),
                  Text('No academic terms found', style: theme.textTheme.titleMedium),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async => ref.refresh(examTermsProvider.future),
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: terms.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final term = terms[index];
                final status = (term['status'] ?? 'ACTIVE').toString().toUpperCase();
                
                return Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(color: colorScheme.surfaceContainer),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(term['name'] ?? 'Unnamed Term', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: status == 'ACTIVE' ? Colors.green.withValues(alpha: 0.1) : Colors.grey.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                status,
                                style: TextStyle(color: status == 'ACTIVE' ? Colors.green : Colors.grey, fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        if (term['description'] != null && term['description'].toString().isNotEmpty) ...[
                          const SizedBox(height: 8),
                          Text(term['description'], style: TextStyle(color: colorScheme.onSurfaceVariant, fontSize: 13)),
                        ],
                        const Divider(height: 24),
                        Row(
                          children: [
                            const Icon(Icons.date_range, size: 14, color: AppColors.primaryFixed),
                            const SizedBox(width: 4),
                            Text('${term['startDate'] ?? 'N/A'} - ${term['endDate'] ?? 'N/A'}', style: const TextStyle(fontSize: 12)),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton.icon(
                              onPressed: () => _showForm(context, ref, term),
                              icon: const Icon(Icons.edit, size: 16),
                              label: const Text('Edit'),
                            ),
                            TextButton.icon(
                              onPressed: () async {
                                final repo = ref.read(examsAndResultsRepositoryProvider);
                                try {
                                  await repo.deleteExamTerm(term['id']);
                                  ref.refresh(examTermsProvider.future);
                                  if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Term deleted')));
                                } catch (e) {
                                  if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
                                }
                              },
                              icon: Icon(Icons.delete, size: 16, color: colorScheme.error),
                              label: Text('Delete', style: TextStyle(color: colorScheme.error)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(context, ref),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _TermFormSheet extends ConsumerStatefulWidget {
  final dynamic term;
  const _TermFormSheet({this.term});

  @override
  ConsumerState<_TermFormSheet> createState() => _TermFormSheetState();
}

class _TermFormSheetState extends ConsumerState<_TermFormSheet> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameCtrl;
  late TextEditingController _descCtrl;
  late TextEditingController _startCtrl;
  late TextEditingController _endCtrl;
  String _status = 'ACTIVE';

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: widget.term?['name'] ?? '');
    _descCtrl = TextEditingController(text: widget.term?['description'] ?? '');
    _startCtrl = TextEditingController(text: widget.term?['startDate'] ?? '');
    _endCtrl = TextEditingController(text: widget.term?['endDate'] ?? '');
    _status = widget.term?['status'] ?? 'ACTIVE';
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    final repo = ref.read(examsAndResultsRepositoryProvider);
    final user = ref.read(authProvider);

    final data = {
      'schoolId': user?.schoolId,
      'name': _nameCtrl.text,
      'description': _descCtrl.text,
      'startDate': _startCtrl.text,
      'endDate': _endCtrl.text,
      'status': _status,
    };

    try {
      if (widget.term != null) {
        await repo.updateExamTerm(widget.term['id'], data);
      } else {
        await repo.createExamTerm(data);
      }
      if (mounted) Navigator.pop(context);
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

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
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(widget.term != null ? 'Edit Term' : 'Create Term', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nameCtrl,
                decoration: const InputDecoration(labelText: 'Term Name', border: OutlineInputBorder()),
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _descCtrl,
                decoration: const InputDecoration(labelText: 'Description', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _startCtrl,
                      decoration: const InputDecoration(labelText: 'Start Date (YYYY-MM-DD)', border: OutlineInputBorder()),
                      validator: (v) => v!.isEmpty ? 'Required' : null,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: _endCtrl,
                      decoration: const InputDecoration(labelText: 'End Date (YYYY-MM-DD)', border: OutlineInputBorder()),
                      validator: (v) => v!.isEmpty ? 'Required' : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16)),
                child: const Text('Save Term'),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
