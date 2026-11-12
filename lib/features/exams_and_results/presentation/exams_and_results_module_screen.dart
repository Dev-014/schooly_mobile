import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../auth/providers/auth_provider.dart';
import '../../../core/auth/permissions.dart';
import '../../../core/theme/app_colors.dart';

class ExamsAndResultsModuleScreen extends ConsumerWidget {
  const ExamsAndResultsModuleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider);
    if (user == null) return const SizedBox.shrink();

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Check base permission
    final hasExamAccess = ref.watch(rbacProvider.notifier).hasPermission(
      Permissions.onlineExams.exam.view,
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: colorScheme.surface.withValues(alpha: 0.85),
        elevation: 0,
        scrolledUnderElevation: 1,
        title: Text(
          'Exams & Results',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Offline exams, report cards, grade list, and marks entry',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 24),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1.3,
              children: [
                if (hasExamAccess)
                  _buildGridItem(
                    'Term Setup',
                    'Manage terms',
                    Icons.event_note,
                    colorScheme.primaryContainer,
                    colorScheme.onPrimaryContainer,
                    theme,
                    colorScheme,
                    onTap: () => context.push('/exams-and-results/terms'),
                  ),
                if (hasExamAccess)
                  _buildGridItem(
                    'Exam Setup (V2)',
                    'Workspace & configs',
                    Icons.auto_awesome,
                    colorScheme.secondaryContainer,
                    colorScheme.onSecondaryContainer,
                    theme,
                    colorScheme,
                    onTap: () =>
                        context.push('/exams-and-results/workspace-hub'),
                  ),
                if (hasExamAccess)
                  _buildGridItem(
                    'Exam Schedule',
                    'Timetables',
                    Icons.calendar_month,
                    colorScheme.tertiaryContainer,
                    colorScheme.onTertiaryContainer,
                    theme,
                    colorScheme,
                    onTap: () => context.push('/exams-and-results/schedules'),
                  ),
                if (hasExamAccess)
                  _buildGridItem(
                    'Admit Card',
                    'Generate cards',
                    Icons.art_track,
                    AppColors.primaryFixed,
                    colorScheme.onPrimary,
                    theme,
                    colorScheme,
                    onTap: () => context.push('/exams-and-results/admit-cards'),
                  ),
                if (hasExamAccess)
                  _buildGridItem(
                    'Marks Entry',
                    'Record scores',
                    Icons.edit_note,
                    colorScheme.errorContainer,
                    colorScheme.onErrorContainer,
                    theme,
                    colorScheme,
                    onTap: () => context.push('/exams-and-results/marks'),
                  ),
                if (hasExamAccess)
                  _buildGridItem(
                    'Co-Curricular Grades',
                    'Extra activities',
                    Icons.sports_soccer,
                    AppColors.tertiaryFixed,
                    colorScheme.onTertiary,
                    theme,
                    colorScheme,
                    onTap: () =>
                        context.push('/exams-and-results/co-curricular'),
                  ),
                if (hasExamAccess)
                  _buildGridItem(
                    'Teacher Remark',
                    'Add comments',
                    Icons.comment,
                    colorScheme.secondaryContainer,
                    colorScheme.onSecondaryContainer,
                    theme,
                    colorScheme,
                    onTap: () => context.push('/exams-and-results/remarks'),
                  ),
                if (hasExamAccess)
                  _buildGridItem(
                    'Grade List',
                    'Grading scale',
                    Icons.grade,
                    colorScheme.primaryContainer,
                    colorScheme.onPrimaryContainer,
                    theme,
                    colorScheme,
                    onTap: () => context.push('/exams-and-results/grades'),
                  ),
                if (hasExamAccess)
                  _buildGridItem(
                    'Division',
                    'Manage divisions',
                    Icons.splitscreen,
                    colorScheme.tertiaryContainer,
                    colorScheme.onTertiaryContainer,
                    theme,
                    colorScheme,
                    onTap: () => context.push('/exams-and-results/divisions'),
                  ),
                if (hasExamAccess)
                  _buildGridItem(
                    'Exam Attendance',
                    'Track presence',
                    Icons.how_to_reg,
                    colorScheme.errorContainer,
                    colorScheme.onErrorContainer,
                    theme,
                    colorScheme,
                    onTap: () => context.push('/exams-and-results/attendance'),
                  ),
                if (hasExamAccess)
                  _buildGridItem(
                    'Report Card',
                    'Manage cards',
                    Icons.description,
                    AppColors.primaryFixed,
                    colorScheme.onPrimary,
                    theme,
                    colorScheme,
                    onTap: () =>
                        context.push('/exams-and-results/report-cards'),
                  ),
                if (hasExamAccess)
                  _buildGridItem(
                    'Examination Reports',
                    'Analytics',
                    Icons.analytics,
                    colorScheme.secondaryContainer,
                    colorScheme.onSecondaryContainer,
                    theme,
                    colorScheme,
                    onTap: () => context.push('/exams-and-results/reports'),
                  ),
                if (hasExamAccess)
                  _buildGridItem(
                    'Report Generation',
                    'Export data',
                    Icons.print,
                    AppColors.tertiaryFixed,
                    colorScheme.onTertiary,
                    theme,
                    colorScheme,
                    onTap: () =>
                        context.push('/exams-and-results/generate-reports'),
                  ),
              ],
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(
    String title,
    String subtitle,
    IconData icon,
    Color iconBg,
    Color iconColor,
    ThemeData theme,
    ColorScheme colorScheme, {
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLowest,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 11,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
