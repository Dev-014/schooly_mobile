import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../providers/exams_and_results_providers.dart';
import '../../data/exams_and_results_repository.dart';

final examFilterProvider = StateProvider<String>((ref) => 'All');
final examSearchQueryProvider = StateProvider<String>((ref) => '');

class ExamWorkspaceHubScreen extends ConsumerWidget {
  const ExamWorkspaceHubScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final setupsState = ref.watch(examSetupsProvider);
    final activeTab = ref.watch(examFilterProvider);
    final searchQuery = ref.watch(examSearchQueryProvider);

    final tabs = ["All", "Draft", "Scheduled", "Completed", "Published"];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Examinations'),
        backgroundColor: colorScheme.surface.withValues(alpha: 0.85),
        scrolledUnderElevation: 1,
      ),
      body: Column(
        children: [
          // Header / Search
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create and manage examinations, subjects, schedules, and results.',
                  style: theme.textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant),
                ),
                const SizedBox(height: 16),
                TextField(
                  onChanged: (value) => ref.read(examSearchQueryProvider.notifier).state = value,
                  decoration: InputDecoration(
                    hintText: 'Search examinations...',
                    prefixIcon: Icon(Icons.search, color: colorScheme.primary),
                    filled: true,
                    fillColor: colorScheme.surface,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: colorScheme.surfaceContainer),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: colorScheme.surfaceContainer),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: tabs.map((tab) {
                      final isSelected = activeTab == tab;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: FilterChip(
                          label: Text(tab),
                          selected: isSelected,
                          onSelected: (_) => ref.read(examFilterProvider.notifier).state = tab,
                          backgroundColor: colorScheme.surface,
                          selectedColor: colorScheme.primaryContainer,
                          labelStyle: TextStyle(
                            color: isSelected ? colorScheme.onPrimaryContainer : colorScheme.onSurfaceVariant,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                              color: isSelected ? colorScheme.primaryContainer : colorScheme.surfaceContainer,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          
          // List
          Expanded(
            child: setupsState.when(
              data: (setups) {
                final filtered = setups.where((exam) {
                  final status = (exam['status'] ?? '').toString().toUpperCase();
                  if (activeTab != 'All' && status != activeTab.toUpperCase()) return false;
                  
                  final name = (exam['name'] ?? '').toString().toLowerCase();
                  if (searchQuery.isNotEmpty && !name.contains(searchQuery.toLowerCase())) return false;
                  
                  return true;
                }).toList();

                if (filtered.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.file_copy_outlined, size: 48, color: colorScheme.surfaceContainerHighest),
                        const SizedBox(height: 16),
                        Text('No examinations found', style: theme.textTheme.titleMedium),
                      ],
                    ),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () async => ref.refresh(examSetupsProvider.future),
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    itemCount: filtered.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final exam = filtered[index];
                      return _buildExamCard(context, exam, theme, colorScheme);
                    },
                  ),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text('Error: $err', style: TextStyle(color: colorScheme.error))),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showCreateExamSheet(context, ref),
        icon: const Icon(Icons.add),
        label: const Text('Create'),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      ),
    );
  }

  void _showCreateExamSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => const _CreateExamSheet(),
    ).then((_) {
      ref.refresh(examSetupsProvider.future);
    });
  }

  Widget _buildExamCard(BuildContext context, dynamic exam, ThemeData theme, ColorScheme colorScheme) {
// ... existing card builder remains ...

    final status = (exam['status'] ?? 'DRAFT').toString().toUpperCase();
    final statusColor = _getStatusColor(status, colorScheme);

    return InkWell(
      onTap: () => context.push('/exams-and-results/workspace-hub/${exam['id']}'),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: colorScheme.surfaceContainer),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.02),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    exam['name'] ?? 'Unnamed Exam',
                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: statusColor.withValues(alpha: 0.2)),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: statusColor,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.category, size: 14, color: colorScheme.onSurfaceVariant),
                const SizedBox(width: 4),
                Text(
                  exam['groupName'] ?? 'Standard',
                  style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant),
                ),
                const SizedBox(width: 12),
                Icon(Icons.event_note, size: 14, color: colorScheme.onSurfaceVariant),
                const SizedBox(width: 4),
                Text(
                  exam['termName'] ?? 'No Term',
                  style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant),
                ),
              ],
            ),
            const Divider(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.calendar_month, size: 16, color: AppColors.primaryFixed),
                    const SizedBox(width: 6),
                    Text(
                      '${exam['scheduleCount'] ?? 0} Schedules',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ],
                ),
                Text(
                  'Manage',
                  style: TextStyle(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status, ColorScheme colorScheme) {
    switch (status) {
      case 'DRAFT':
        return Colors.orange;
      case 'SCHEDULED':
        return AppColors.primaryFixed;
      case 'COMPLETED':
        return Colors.green;
      case 'PUBLISHED':
        return Colors.purple;
      case 'ACTIVE':
        return AppColors.primaryFixed;
      default:
        return colorScheme.onSurfaceVariant;
    }
  }
}

class _CreateExamSheet extends ConsumerStatefulWidget {
  const _CreateExamSheet();

  @override
  ConsumerState<_CreateExamSheet> createState() => _CreateExamSheetState();
}

class _CreateExamSheetState extends ConsumerState<_CreateExamSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  String _examType = 'Unit Test';
  String _termId = '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final termsState = ref.watch(examTermsProvider);

    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 24,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Create Examination', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nameCtrl,
                decoration: const InputDecoration(labelText: 'Exam Name', border: OutlineInputBorder()),
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: _examType,
                decoration: const InputDecoration(labelText: 'Exam Type', border: OutlineInputBorder()),
                items: const [
                  DropdownMenuItem(value: 'Unit Test', child: Text('Unit Test')),
                  DropdownMenuItem(value: 'Half Yearly', child: Text('Half Yearly')),
                  DropdownMenuItem(value: 'Annual', child: Text('Annual')),
                  DropdownMenuItem(value: 'Mock Test', child: Text('Mock Test')),
                ],
                onChanged: (v) => setState(() => _examType = v!),
              ),
              const SizedBox(height: 12),
              termsState.when(
                data: (terms) => DropdownButtonFormField<String>(
                  value: _termId.isEmpty ? null : _termId,
                  decoration: const InputDecoration(labelText: 'Term', border: OutlineInputBorder()),
                  items: terms.map<DropdownMenuItem<String>>((t) {
                    return DropdownMenuItem(value: t['id'].toString(), child: Text(t['name']));
                  }).toList(),
                  onChanged: (v) => setState(() => _termId = v ?? ''),
                  validator: (v) => v == null ? 'Required' : null,
                ),
                loading: () => const CircularProgressIndicator(),
                error: (e, _) => Text('Error: $e'),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) return;
                  final repo = ref.read(examsAndResultsRepositoryProvider);
                  // Not strictly adding auth checks here to save space, but relying on backend
                  try {
                    await repo.createExamSetup({
                      'name': _nameCtrl.text,
                      'groupName': _examType,
                      'termId': int.parse(_termId),
                      'orderNo': 1,
                      'weightageActive': false,
                      'weightagePercent': 0,
                      'evaluationType': 'STANDARD',
                      'status': 'ACTIVE',
                    });
                    if (mounted) Navigator.pop(context);
                  } catch (e) {
                    if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
                  }
                },
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16)),
                child: const Text('Create Examination'),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
