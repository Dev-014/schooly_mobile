import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../auth/providers/auth_provider.dart';

import 'providers/admin_student_siblings_provider.dart';

class AdminLinkSiblingScreen extends ConsumerStatefulWidget {
  const AdminLinkSiblingScreen({super.key});

  @override
  ConsumerState<AdminLinkSiblingScreen> createState() =>
      _AdminLinkSiblingScreenState();
}

class _AdminLinkSiblingScreenState
    extends ConsumerState<AdminLinkSiblingScreen> {
  String get _schoolId =>
      ref.read(authProvider)?.schoolId?.toString() ?? '1000';
  final _primaryController = TextEditingController();
  final _siblingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // We only fetch siblings if a primary student ID is entered
    final primaryId = _primaryController.text.trim();
    final siblingsAsync = ref.watch(
      studentSiblingsControllerProvider(primaryId, _schoolId),
    );

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
                  blurRadius: 8,
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.family_restroom,
                    size: 26,
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Link Sibling Students',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Connect accounts under a single parent/guardian.',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
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
              border: Border.all(
                color: colorScheme.outlineVariant.withValues(alpha: 0.5),
              ),
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
                        color: colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '1',
                          style: TextStyle(
                            color: colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Primary Student ID',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _primaryController,
                  decoration: InputDecoration(
                    hintText: 'Enter Student ID...',
                    prefixIcon: Icon(Icons.search, color: colorScheme.outline),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: colorScheme.surfaceContainerLow,
                  ),
                  onSubmitted: (v) {
                    setState(() {});
                  },
                ),

                if (primaryId.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  Text(
                    'Linked Siblings:',
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  siblingsAsync.when(
                    data: (sibs) {
                      if (sibs.isEmpty)
                        return const Text('No siblings linked yet.');
                      return Column(
                        children: sibs.map((s) {
                          return ListTile(
                            leading: const Icon(Icons.person),
                            title: Text("${s['firstName']} ${s['lastName']}"),
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.link_off,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                ref
                                    .read(
                                      studentSiblingsControllerProvider(
                                        primaryId,
                                        _schoolId,
                                      ).notifier,
                                    )
                                    .unlinkSibling(s['id'].toString());
                              },
                            ),
                          );
                        }).toList(),
                      );
                    },
                    loading: () => const CircularProgressIndicator(),
                    error: (err, stack) => Text('Error: $err'),
                  ),
                ],
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Center(child: Icon(Icons.link, size: 28)),
          ),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: colorScheme.outlineVariant.withValues(alpha: 0.5),
              ),
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
                        color: colorScheme.secondary,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '2',
                          style: TextStyle(
                            color: colorScheme.onSecondary,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Sibling Student ID to Link',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _siblingController,
                  decoration: InputDecoration(
                    hintText: 'Enter Sibling Student ID...',
                    prefixIcon: Icon(Icons.search, color: colorScheme.outline),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: colorScheme.surfaceContainerLow,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              final siblingId = _siblingController.text.trim();
              if (primaryId.isNotEmpty && siblingId.isNotEmpty) {
                ref
                    .read(
                      studentSiblingsControllerProvider(
                        primaryId,
                        _schoolId,
                      ).notifier,
                    )
                    .linkSibling(siblingId);
                _siblingController.clear();
              }
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
              elevation: 2,
            ),
            child: const Text(
              'Confirm Sibling Link',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
