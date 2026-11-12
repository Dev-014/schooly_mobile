import 'package:flutter/material.dart';

class ExamResultsTab extends StatefulWidget {
  final String examId;
  const ExamResultsTab({super.key, required this.examId});

  @override
  State<ExamResultsTab> createState() => _ExamResultsTabState();
}

class _ExamResultsTabState extends State<ExamResultsTab> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Exam Results', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                      Text(
                        'View and process results for this examination.',
                        style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.emoji_events, size: 48, color: colorScheme.primary.withValues(alpha: 0.5)),
                    const SizedBox(height: 16),
                    Text('Results Processing', style: theme.textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text('Tap the button below to process class results.', style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _isLoading ? null : () async {
          setState(() => _isLoading = true);
          await Future.delayed(const Duration(seconds: 1));
          if (mounted) {
            setState(() => _isLoading = false);
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (ctx) => _ResultsSheet(examId: widget.examId),
            );
          }
        },
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        icon: _isLoading ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)) : const Icon(Icons.analytics),
        label: const Text('Process Results'),
      ),
    );
  }
}

class _ResultsSheet extends StatefulWidget {
  final String examId;
  const _ResultsSheet({required this.examId});

  @override
  State<_ResultsSheet> createState() => _ResultsSheetState();
}

class _ResultsSheetState extends State<_ResultsSheet> {
  final _formKey = GlobalKey<FormState>();
  bool _isSaving = false;

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
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Process Results', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: widget.examId,
                decoration: const InputDecoration(labelText: 'Exam ID', border: OutlineInputBorder()), 
                validator: (v) => v!.isEmpty ? 'Required' : null
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Class ID', border: OutlineInputBorder()), 
                validator: (v) => v!.isEmpty ? 'Required' : null
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _isSaving ? null : () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() => _isSaving = true);
                    await Future.delayed(const Duration(seconds: 2));
                    if (mounted) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Results processed and published successfully!')));
                    }
                  }
                },
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16)),
                child: _isSaving ? const CircularProgressIndicator() : const Text('Process & Publish'),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
