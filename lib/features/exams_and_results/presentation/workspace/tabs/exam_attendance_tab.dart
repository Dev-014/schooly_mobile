import 'package:flutter/material.dart';

class ExamAttendanceTab extends StatefulWidget {
  final String examId;
  const ExamAttendanceTab({super.key, required this.examId});

  @override
  State<ExamAttendanceTab> createState() => _ExamAttendanceTabState();
}

class _ExamAttendanceTabState extends State<ExamAttendanceTab> {
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
                      Text('Exam Attendance', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                      Text(
                        'Mark student attendance for exams.',
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
                    Icon(Icons.fact_check, size: 48, color: colorScheme.primary.withValues(alpha: 0.5)),
                    const SizedBox(height: 16),
                    Text('Ready to mark attendance', style: theme.textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text('Tap the button below to get started.', style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
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
              builder: (ctx) => _AttendanceSheet(examId: widget.examId),
            );
          }
        },
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        icon: _isLoading ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)) : const Icon(Icons.checklist),
        label: const Text('Record Attendance'),
      ),
    );
  }
}

class _AttendanceSheet extends StatefulWidget {
  final String examId;
  const _AttendanceSheet({required this.examId});

  @override
  State<_AttendanceSheet> createState() => _AttendanceSheetState();
}

class _AttendanceSheetState extends State<_AttendanceSheet> {
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
              const Text('Mark Attendance', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Subject ID', border: OutlineInputBorder()), 
                validator: (v) => v!.isEmpty ? 'Required' : null
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _isSaving ? null : () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() => _isSaving = true);
                    await Future.delayed(const Duration(seconds: 1));
                    if (mounted) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Attendance recorded successfully!')));
                    }
                  }
                },
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16)),
                child: _isSaving ? const CircularProgressIndicator() : const Text('Save'),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
