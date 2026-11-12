import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../auth/providers/auth_provider.dart';

import 'providers/admin_student_referrals_provider.dart';

class AdminStudentReferralScreen extends ConsumerStatefulWidget {
  const AdminStudentReferralScreen({super.key});

  @override
  ConsumerState<AdminStudentReferralScreen> createState() =>
      _AdminStudentReferralScreenState();
}

class _AdminStudentReferralScreenState
    extends ConsumerState<AdminStudentReferralScreen> {
  String get _schoolId =>
      ref.read(authProvider)?.schoolId?.toString() ?? '1000';
  final _nameController = TextEditingController();
  final _gradeController = TextEditingController();

  void _showAddReferralDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Log New Referral'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Student Name'),
              ),
              TextField(
                controller: _gradeController,
                decoration: const InputDecoration(labelText: 'Grade / Class'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(
                      studentReferralsControllerProvider(_schoolId).notifier,
                    )
                    .addReferral({
                      'name': _nameController.text.trim(),
                      'grade': _gradeController.text.trim(),
                      'status': 'PENDING_REVIEW',
                    });
                Navigator.pop(context);
                _nameController.clear();
                _gradeController.clear();
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final referralsAsync = ref.watch(
      studentReferralsControllerProvider(_schoolId),
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.02),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(Icons.loyalty, size: 20, color: colorScheme.primary),
                const SizedBox(width: 8),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: 'Referral Scheme: ',
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: '₹2,500 reward per confirmed admission',
                          style: TextStyle(
                            color: colorScheme.onSurface,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'AY 26-27',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildStat(
                  'Total',
                  '48',
                  'Logged',
                  colorScheme.outline,
                  colorScheme.onSurface,
                  colorScheme,
                  theme,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildStat(
                  'Paid',
                  '36',
                  '₹90,000',
                  colorScheme.secondary,
                  colorScheme.secondary,
                  colorScheme,
                  theme,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildStat(
                  'Pending',
                  '12',
                  '₹30,000',
                  colorScheme.tertiary,
                  colorScheme.tertiary,
                  colorScheme,
                  theme,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Referrals',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton.icon(
                onPressed: _showAddReferralDialog,
                icon: const Icon(Icons.add, size: 16),
                label: const Text('Log New'),
              ),
            ],
          ),
          const SizedBox(height: 8),

          referralsAsync.when(
            data: (referrals) {
              if (referrals.isEmpty) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('No referrals found.'),
                  ),
                );
              }
              return Column(
                children: referrals.map((r) {
                  final name = r['name'] ?? 'Unknown';
                  final grade = r['grade'] ?? 'N/A';
                  final status = r['status'] ?? 'PENDING';
                  Color statusColor = colorScheme.tertiary;
                  if (status == 'PAID' || status == 'ADMITTED')
                    statusColor = colorScheme.secondary;
                  if (status == 'REJECTED') statusColor = colorScheme.error;

                  return _buildReferralItem(
                    name,
                    grade,
                    status,
                    statusColor,
                    colorScheme,
                    theme,
                  );
                }).toList(),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Text('Error: $err'),
          ),
        ],
      ),
    );
  }

  Widget _buildStat(
    String topLabel,
    String value,
    String subLabel,
    Color labelColor,
    Color valueColor,
    ColorScheme colorScheme,
    ThemeData theme,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 8),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            topLabel,
            style: theme.textTheme.labelSmall?.copyWith(
              color: labelColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: theme.textTheme.headlineSmall?.copyWith(
              color: valueColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subLabel,
            style: theme.textTheme.labelSmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReferralItem(
    String name,
    String grade,
    String status,
    Color statusColor,
    ColorScheme colorScheme,
    ThemeData theme,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 4),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                grade,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: statusColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              status,
              style: theme.textTheme.labelSmall?.copyWith(
                color: statusColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
