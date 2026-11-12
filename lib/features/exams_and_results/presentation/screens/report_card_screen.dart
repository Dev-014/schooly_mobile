import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReportCardScreen extends ConsumerStatefulWidget {
  const ReportCardScreen({super.key});

  @override
  ConsumerState<ReportCardScreen> createState() => _ReportCardScreenState();
}

class _ReportCardScreenState extends ConsumerState<ReportCardScreen> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text('Report Cards', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: colorScheme.surface,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Refreshing data...')));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('View and manage individual student report cards.', style: theme.textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant)),
            const SizedBox(height: 24),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.insert_drive_file, size: 48, color: colorScheme.primary.withValues(alpha: 0.5)),
                    const SizedBox(height: 16),
                    Text('Ready to View Report', style: theme.textTheme.titleMedium),
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
          // Simulate network delay
          await Future.delayed(const Duration(seconds: 1));
          if (mounted) {
            setState(() => _isLoading = false);
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (ctx) => const _ReportCardScreenSheet(),
            );
          }
        },
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        icon: _isLoading ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)) : const Icon(Icons.visibility),
        label: const Text('View Report'),
      ),
    );
  }
}

class _ReportCardScreenSheet extends StatefulWidget {
  const _ReportCardScreenSheet();

  @override
  State<_ReportCardScreenSheet> createState() => _ReportCardScreenSheetState();
}

class _ReportCardScreenSheetState extends State<_ReportCardScreenSheet> {
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
              const Text('Find Report Card', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              TextFormField(decoration: const InputDecoration(labelText: 'Student ID', border: OutlineInputBorder()), validator: (v) => v!.isEmpty ? 'Required' : null),
              const SizedBox(height: 16),
              TextFormField(decoration: const InputDecoration(labelText: 'Term ID', border: OutlineInputBorder()), validator: (v) => v!.isEmpty ? 'Required' : null),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _isSaving ? null : () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() => _isSaving = true);
                    await Future.delayed(const Duration(seconds: 1));
                    if (mounted) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Action completed successfully!')));
                    }
                  }
                },
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16)),
                child: _isSaving ? const CircularProgressIndicator() : const Text('Search'),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
