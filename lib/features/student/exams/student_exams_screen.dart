import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import 'providers/exam_provider.dart';
import 'data/models/exam_models.dart';

enum ExamTab { timetable, admitCard, syllabus, results }

class StudentExamsScreen extends ConsumerStatefulWidget {
  const StudentExamsScreen({super.key});

  @override
  ConsumerState<StudentExamsScreen> createState() => _StudentExamsScreenState();
}

class _StudentExamsScreenState extends ConsumerState<StudentExamsScreen> {
  ExamTab _currentTab = ExamTab.timetable;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: colorScheme.surface.withValues(alpha: 0.85),
        elevation: 0,
        scrolledUnderElevation: 1,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.school,
                color: colorScheme.onPrimaryContainer,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SCHOOLY PORTAL',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                Text(
                  _getAppbarTitle(),
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Badge(child: Icon(Icons.notifications_outlined)),
            onPressed: () {},
          ),
          const SizedBox(width: 4),
          const CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          // Segmented Tabs
          Container(
            color: colorScheme.surface.withValues(alpha: 0.9),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                children: [
                  _buildTabButton(
                    'Timetable',
                    ExamTab.timetable,
                    theme,
                    colorScheme,
                  ),
                  _buildTabButton(
                    'Admit Card',
                    ExamTab.admitCard,
                    theme,
                    colorScheme,
                  ),
                  _buildTabButton(
                    'Syllabus',
                    ExamTab.syllabus,
                    theme,
                    colorScheme,
                  ),
                  _buildTabButton(
                    'Results',
                    ExamTab.results,
                    theme,
                    colorScheme,
                  ),
                ],
              ),
            ),
          ),
          // Content
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _buildCurrentView(context, theme, colorScheme),
            ),
          ),
        ],
      ),
    );
  }

  String _getAppbarTitle() {
    switch (_currentTab) {
      case ExamTab.timetable:
        return 'Exams';
      case ExamTab.admitCard:
        return 'Admit Card';
      case ExamTab.syllabus:
        return 'Mid-Term Syllabus';
      case ExamTab.results:
        return 'Marks & Results';
    }
  }

  Widget _buildTabButton(
    String title,
    ExamTab tab,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    final isSelected = _currentTab == tab;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _currentTab = tab),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? colorScheme.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: theme.textTheme.labelMedium?.copyWith(
              color: isSelected
                  ? colorScheme.onPrimary
                  : colorScheme.onSurfaceVariant,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentView(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    switch (_currentTab) {
      case ExamTab.timetable:
        return _buildTimetableView(theme, colorScheme, ref);
      case ExamTab.admitCard:
        return _buildAdmitCardView(theme, colorScheme, ref);
      case ExamTab.syllabus:
        return _buildSyllabusView(theme, colorScheme);
      case ExamTab.results:
        return _buildResultsView(theme, colorScheme, ref);
    }
  }

  Widget _buildTimetableView(
    ThemeData theme,
    ColorScheme colorScheme,
    WidgetRef ref,
  ) {
    final timetableAsync = ref.watch(timetableProvider(examSetupId: null));

    return SingleChildScrollView(
      key: const ValueKey('timetable'),
      padding: const EdgeInsets.all(16),
      child: timetableAsync.when(
        data: (schedules) {
          if (schedules.isEmpty) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(32.0),
                child: Text('No exams scheduled for you yet.'),
              ),
            );
          }

          final nextExam = schedules.first;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Page Title & Context
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Examinations',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${nextExam.className} • ${nextExam.sectionName}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      nextExam.termName ?? 'Term 1',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Next Exam Hero
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [colorScheme.primary, colorScheme.primaryContainer],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.primary.withValues(alpha: 0.2),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: colorScheme.onPrimary.withValues(
                              alpha: 0.15,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 6,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: colorScheme.secondaryContainer,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                'NEXT EXAM',
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: colorScheme.onPrimary,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceContainerLowest.withValues(
                              alpha: 0.2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Upcoming',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: colorScheme.onPrimary,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      nextExam.subjectName ?? 'Subject',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Sub Code: ${nextExam.subjectCode} • Max Marks: ${nextExam.fullMarks}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: AppColors.primaryFixed,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: colorScheme.onPrimary.withValues(
                                alpha: 0.1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.event,
                                  color: AppColors.primaryFixed,
                                  size: 18,
                                ),
                                const SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'DATE & TIME',
                                      style: theme.textTheme.labelSmall
                                          ?.copyWith(
                                            fontSize: 9,
                                            color: AppColors.primaryFixed,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Text(
                                      '${nextExam.examDate?.day}/${nextExam.examDate?.month} • ${nextExam.startTime?.substring(0, 5)}',
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                            color: colorScheme.onPrimary,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: colorScheme.onPrimary.withValues(
                                alpha: 0.1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.meeting_room,
                                  color: AppColors.primaryFixed,
                                  size: 18,
                                ),
                                const SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'SEATING',
                                      style: theme.textTheme.labelSmall
                                          ?.copyWith(
                                            fontSize: 9,
                                            color: AppColors.primaryFixed,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Text(
                                      'Room ${nextExam.roomNumber}',
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                            color: colorScheme.onPrimary,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Timetable List
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Exam Timetable',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${schedules.length} Papers',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ...schedules.map((schedule) {
                final isNext = schedule.id == nextExam.id;
                final month = _getMonthName(schedule.examDate?.month ?? 1);
                final day =
                    schedule.examDate?.day.toString().padLeft(2, '0') ?? '00';
                final weekday = _getWeekdayName(
                  schedule.examDate?.weekday ?? 1,
                );

                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: _buildExamItem(
                    month,
                    day,
                    weekday,
                    schedule.subjectName ?? 'Subject',
                    'Sub Code: ${schedule.subjectCode}',
                    isNext,
                    theme,
                    colorScheme,
                  ),
                );
              }),

              const SizedBox(height: 100),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }

  String _getMonthName(int month) {
    const months = [
      'JAN',
      'FEB',
      'MAR',
      'APR',
      'MAY',
      'JUN',
      'JUL',
      'AUG',
      'SEP',
      'OCT',
      'NOV',
      'DEC',
    ];
    return months[month - 1];
  }

  String _getWeekdayName(int weekday) {
    const weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return weekdays[weekday - 1];
  }

  Widget _buildExamItem(
    String month,
    String day,
    String weekday,
    String subject,
    String subInfo,
    bool isNext,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isNext
              ? colorScheme.primary.withValues(alpha: 0.3)
              : colorScheme.surfaceContainer,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: isNext
                  ? colorScheme.primary
                  : colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
              border: isNext
                  ? null
                  : Border.all(color: colorScheme.surfaceContainer),
            ),
            child: Column(
              children: [
                Text(
                  month,
                  style: theme.textTheme.labelSmall?.copyWith(
                    fontSize: 10,
                    color: isNext
                        ? AppColors.primaryFixed
                        : colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  day,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: isNext
                        ? colorScheme.onPrimary
                        : colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                    height: 1.1,
                  ),
                ),
                Text(
                  weekday,
                  style: theme.textTheme.labelSmall?.copyWith(
                    fontSize: 10,
                    color: isNext
                        ? AppColors.primaryFixed
                        : colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subject,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                Text(
                  subInfo,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 11,
                    color: isNext
                        ? colorScheme.primary
                        : colorScheme.onSurfaceVariant,
                    fontWeight: isNext ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          if (isNext)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: colorScheme.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                'Next',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildAdmitCardView(
    ThemeData theme,
    ColorScheme colorScheme,
    WidgetRef ref,
  ) {
    // Assuming we pass an examSetupId, for example 1. In a real app this would be dynamic.
    final admitCardAsync = ref.watch(admitCardProvider(1));

    return admitCardAsync.when(
      data: (AdmitCardPreviewResponse? admitCard) {
        if (admitCard == null)
          return const Center(child: Text('No Admit Card Available'));
        return SingleChildScrollView(
          key: const ValueKey('admitCard'),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Term Banner
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: colorScheme.primary.withValues(alpha: 0.1),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: colorScheme.primary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.school,
                            color: colorScheme.onPrimary,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              admitCard.termName ?? 'Final Exams',
                              style: theme.textTheme.labelLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${admitCard.gradeAndSection} • Roll No: ${admitCard.rollNumber}',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Digital Admit Card Pass
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.primary.withValues(alpha: 0.08),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  border: Border(
                    top: BorderSide(color: colorScheme.primary, width: 4),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: colorScheme.surfaceContainer,
                              width: 2,
                            ),
                            image: const DecorationImage(
                              image: NetworkImage(
                                'https://i.pravatar.cc/150?img=11',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${admitCard.gradeAndSection?.toUpperCase()} • ROLL #${admitCard.rollNumber}',
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                              Text(
                                admitCard.candidateName ?? 'Student Name',
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'ID: ${admitCard.cardNumber}',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.qr_code_2,
                          size: 40,
                          color: colorScheme.primary,
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Divider(),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: colorScheme.primary,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Examination Center & Venue',
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                admitCard.schoolName ?? 'School Name',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Status',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              admitCard.verificationStatus ?? 'Verified',
                              style: theme.textTheme.labelMedium?.copyWith(
                                color: colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Essentials
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: colorScheme.primary.withValues(alpha: 0.1),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.info, color: colorScheme.primary, size: 18),
                        const SizedBox(width: 8),
                        Text(
                          'Exam Day Essentials',
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _buildEssentialItem(
                      Icons.badge,
                      colorScheme.secondary,
                      'Mandatory: ',
                      'Printed Admit Card & School ID Badge',
                      theme,
                    ),
                    const SizedBox(height: 8),
                    _buildEssentialItem(
                      Icons.schedule,
                      colorScheme.primary,
                      'Reporting: ',
                      '09:30 AM (Gate closes 09:45 AM)',
                      theme,
                    ),
                    const SizedBox(height: 8),
                    _buildEssentialItem(
                      Icons.do_not_disturb_on,
                      colorScheme.error,
                      'Strict: ',
                      'No mobile phones or smartwatches allowed',
                      theme,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Action Buttons
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.download),
                label: const Text('Download Admit Card (PDF)'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  elevation: 2,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.print, size: 18),
                      label: const Text('Print Ticket'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorScheme.surfaceContainer,
                        foregroundColor: colorScheme.primary,
                        minimumSize: const Size(double.infinity, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 0,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.share, size: 18),
                      label: const Text('Share'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorScheme.surfaceContainer,
                        foregroundColor: colorScheme.primary,
                        minimumSize: const Size(double.infinity, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 0,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 100),
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) =>
          Center(child: Text('Error loading admit card: $err')),
    );
  }

  Widget _buildEssentialItem(
    IconData icon,
    Color color,
    String boldText,
    String normalText,
    ThemeData theme,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: color, size: 16),
        const SizedBox(width: 8),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface,
              ),
              children: [
                TextSpan(
                  text: boldText,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: normalText),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSyllabusView(ThemeData theme, ColorScheme colorScheme) {
    return SingleChildScrollView(
      key: const ValueKey('syllabus'),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Info Banner
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: colorScheme.outlineVariant.withValues(alpha: 0.3),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.02),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: colorScheme.secondary,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'MID-TERM EXAMINATIONS 2026-27',
                      style: theme.textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Class 10-A',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Section Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subject Syllabus & Portions',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Term 1 Coverage',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Cards
          _buildSyllabusCard(
            Icons.calculate,
            'Mathematics',
            '4 Chapters',
            'Real Numbers, Polynomials, Quadratic Equations, Triangles',
            theme,
            colorScheme,
          ),
          const SizedBox(height: 12),
          _buildSyllabusCard(
            Icons.biotech,
            'Science',
            '3 Units',
            'Light Reflection & Refraction, Chemical Reactions, Life Processes',
            theme,
            colorScheme,
          ),
          const SizedBox(height: 12),
          _buildSyllabusCard(
            Icons.menu_book,
            'English Literature',
            '3 Units',
            'First Flight: Ch 1-4, Poems 1-3, Grammar (Tenses, Modals)',
            theme,
            colorScheme,
          ),
          const SizedBox(height: 12),
          _buildSyllabusCard(
            Icons.public,
            'Social Science',
            '3 Units',
            'History (Ch 1-2), Geography (Ch 1-3), Political Science',
            theme,
            colorScheme,
          ),
          const SizedBox(height: 12),
          _buildSyllabusCard(
            Icons.translate,
            'Hindi (Course B)',
            '2 Units',
            'Sparsh: Ch 1-3, Vyakaran (Samas, Vakya Bhed, Muhavare)',
            theme,
            colorScheme,
          ),

          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.picture_as_pdf),
            label: const Text('Download Complete Syllabus (PDF)'),
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
              minimumSize: const Size(double.infinity, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
            ),
          ),

          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildSyllabusCard(
    IconData icon,
    String title,
    String badgeText,
    String description,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.3),
        ),
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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(icon, color: colorScheme.primary, size: 20),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    title,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  badgeText,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultsView(
    ThemeData theme,
    ColorScheme colorScheme,
    WidgetRef ref,
  ) {
    final resultsAsync = ref.watch(resultsProvider);

    return resultsAsync.when(
      data: (results) {
        if (results.isEmpty) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(32.0),
              child: Text('No results published yet.'),
            ),
          );
        }

        final report = results.first;

        return SingleChildScrollView(
          key: const ValueKey('results'),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Student Info Strip
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Marks & Results',
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${report.studentName} • ${report.className} • ${report.sectionName}',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: colorScheme.secondary,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          report.status ?? 'Published',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: colorScheme.onSecondaryContainer,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Exam Selector & Download Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(12),
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
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.event_note,
                              color: colorScheme.primary,
                              size: 16,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'SELECT EXAMINATION',
                              style: theme.textTheme.labelSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.onSurfaceVariant,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Current Academic Year',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerLow,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            report.termName ?? 'Term Examination',
                            style: theme.textTheme.labelMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.expand_more,
                            color: colorScheme.onSurfaceVariant,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorScheme.primary,
                        foregroundColor: colorScheme.onPrimary,
                        minimumSize: const Size(double.infinity, 44),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 2,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.download, size: 20),
                              const SizedBox(width: 8),
                              const Text(
                                'Download Report Card',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: colorScheme.onPrimary.withValues(
                                alpha: 0.2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              'PDF',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Performance Summary Card
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [colorScheme.primary, colorScheme.primaryContainer],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.primary.withValues(alpha: 0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Results Summary',
                                style: theme.textTheme.labelMedium?.copyWith(
                                  color: colorScheme.onPrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: colorScheme.secondaryContainer,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  report.division ?? 'PASSED',
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    fontSize: 9,
                                    color: colorScheme.onSecondaryContainer,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${report.termName}',
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontSize: 11,
                              color: colorScheme.onPrimary.withValues(
                                alpha: 0.8,
                              ),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: theme.textTheme.titleMedium?.copyWith(
                                  color: colorScheme.onPrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(text: '${report.totalMarks}'),
                                  TextSpan(
                                    text: '/${report.maxMarks}',
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      fontSize: 10,
                                      color: colorScheme.onPrimary.withValues(
                                        alpha: 0.7,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              '${report.percentage}% Aggregate',
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontSize: 10,
                                color: AppColors.secondaryFixed,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 12),
                        Container(
                          width: 40,
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                            color: colorScheme.onPrimary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              report.grade ?? 'B+',
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: colorScheme.onPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Subject Breakdown Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subject Breakdown',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '5 Key Subjects',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Subject Breakdown List
              Container(
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(12),
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
                  children: [
                    _buildSubjectResultItem(
                      Icons.calculate,
                      'Mathematics',
                      'Theory & Lab Assignment',
                      '76/100',
                      '76.0%',
                      'A',
                      colorScheme.secondary,
                      theme,
                      colorScheme,
                    ),
                    Divider(height: 1, color: colorScheme.surfaceContainerLow),
                    _buildSubjectResultItem(
                      Icons.science,
                      'Science',
                      'Physics, Chem & Bio',
                      '82/100',
                      '82.0%',
                      'A+',
                      colorScheme.secondary,
                      theme,
                      colorScheme,
                    ),
                    Divider(height: 1, color: colorScheme.surfaceContainerLow),
                    _buildSubjectResultItem(
                      Icons.menu_book,
                      'English',
                      'Literature & Grammar',
                      '74/100',
                      '74.0%',
                      'B+',
                      colorScheme.primary,
                      theme,
                      colorScheme,
                    ),
                    Divider(height: 1, color: colorScheme.surfaceContainerLow),
                    _buildSubjectResultItem(
                      Icons.public,
                      'Social Science',
                      'History, Civics & Geog',
                      '81/100',
                      '81.0%',
                      'A+',
                      colorScheme.secondary,
                      theme,
                      colorScheme,
                    ),
                    Divider(height: 1, color: colorScheme.surfaceContainerLow),
                    _buildSubjectResultItem(
                      Icons.terminal,
                      'Computer',
                      'Python & Database Practical',
                      '89/100',
                      '89.0%',
                      'A+',
                      colorScheme.secondary,
                      theme,
                      colorScheme,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Previous Records
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Previous Records',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'View All',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: colorScheme.surfaceContainer),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.02),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: colorScheme.surfaceContainer,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.history,
                            size: 18,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Annual Exam (Class 9)',
                              style: theme.textTheme.labelMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '494/600 • Session 2025-26',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '82.4%',
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          Icons.chevron_right,
                          color: colorScheme.onSurfaceVariant,
                          size: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // CBSE Authentication footnote
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: colorScheme.surfaceContainer),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.verified,
                          color: colorScheme.secondary,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'CBSE Board Authenticated',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Need Help?',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 100),
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error loading results: $err')),
    );
  }

  Widget _buildSubjectResultItem(
    IconData icon,
    String title,
    String subtitle,
    String marks,
    String percentage,
    String grade,
    Color percentageColor,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: AppColors.primaryFixed,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: colorScheme.onPrimaryContainer,
                    size: 18,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: theme.textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        subtitle,
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
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    marks,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    percentage,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: percentageColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12),
              Container(
                width: 36,
                padding: const EdgeInsets.symmetric(vertical: 2),
                decoration: BoxDecoration(
                  color: grade.contains('A')
                      ? colorScheme.secondaryContainer
                      : AppColors.primaryFixed,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    grade,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: grade.contains('A')
                          ? colorScheme.onSecondaryContainer
                          : colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
