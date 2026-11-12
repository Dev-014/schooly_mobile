import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/exams_and_results_providers.dart';

class ExamOverviewTab extends ConsumerWidget {
  final String examId;
  const ExamOverviewTab({super.key, required this.examId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final intId = int.tryParse(examId) ?? 0;

    final overviewState = ref.watch(examWorkspaceOverviewProvider(intId));

    return overviewState.when(
      data: (overview) {
        if (overview == null) return const Center(child: Text('Not found'));

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Details Card
              Card(
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
                      Text(
                        'Examination Details',
                        style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      _buildDetailRow('Exam Name', overview['name'] ?? 'N/A', 'Exam Type', overview['examType'] ?? 'N/A'),
                      const SizedBox(height: 16),
                      _buildDetailRow('Term', overview['termName'] ?? 'N/A', 'Evaluation', overview['evaluationType'] ?? 'N/A'),
                      const SizedBox(height: 16),
                      _buildDetailRow('Status', overview['status'] ?? 'N/A', 'Subjects', overview['subjectCount']?.toString() ?? '0'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Readiness Card
              Card(
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
                      Text(
                        'Exam Readiness',
                        style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      _buildReadinessItem(
                        icon: Icons.check_circle,
                        iconColor: Colors.green,
                        title: 'Basic Details',
                        subtitle: 'Complete',
                      ),
                      _buildReadinessItem(
                        icon: (overview['subjectCount'] ?? 0) > 0 ? Icons.check_circle : Icons.warning_amber_rounded,
                        iconColor: (overview['subjectCount'] ?? 0) > 0 ? Colors.green : Colors.orange,
                        title: 'Subjects',
                        subtitle: '${overview['subjectCount'] ?? 0} configured',
                      ),
                      _buildReadinessItem(
                        icon: (overview['classCount'] ?? 0) > 0 ? Icons.check_circle : Icons.warning_amber_rounded,
                        iconColor: (overview['classCount'] ?? 0) > 0 ? Colors.green : Colors.orange,
                        title: 'Classes & Sections',
                        subtitle: '${overview['classCount'] ?? 0} configured',
                      ),
                      _buildReadinessItem(
                        icon: (overview['studentCount'] ?? 0) > 0 ? Icons.check_circle : Icons.warning_amber_rounded,
                        iconColor: (overview['studentCount'] ?? 0) > 0 ? Colors.green : Colors.orange,
                        title: 'Students',
                        subtitle: '${overview['studentCount'] ?? 0} eligible',
                      ),
                      _buildReadinessItem(
                        icon: (overview['scheduleCount'] ?? 0) > 0 ? Icons.check_circle : Icons.schedule,
                        iconColor: (overview['scheduleCount'] ?? 0) > 0 ? Colors.green : Colors.grey,
                        title: 'Schedule',
                        subtitle: '${overview['scheduleCount'] ?? 0} scheduled',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
    );
  }

  Widget _buildDetailRow(String label1, String value1, String label2, String value2) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label1, style: const TextStyle(fontSize: 12, color: Colors.grey)),
              const SizedBox(height: 2),
              Text(value1, style: const TextStyle(fontWeight: FontWeight.w500)),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label2, style: const TextStyle(fontSize: 12, color: Colors.grey)),
              const SizedBox(height: 2),
              Text(value2, style: const TextStyle(fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildReadinessItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
                Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
