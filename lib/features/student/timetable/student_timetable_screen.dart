import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class StudentTimetableScreen extends StatefulWidget {
  const StudentTimetableScreen({super.key});

  @override
  State<StudentTimetableScreen> createState() => _StudentTimetableScreenState();
}

class _StudentTimetableScreenState extends State<StudentTimetableScreen> {
  bool isWeeklyView = false;
  String selectedDayPill = 'Mon 23'; // To make pills interactive

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
                  'Timetable',
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
          IconButton(
            icon: const Icon(Icons.widgets_outlined),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with controls
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isWeeklyView ? 'Weekly Timetable' : 'Timetable',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryFixed,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  'Class 10-A',
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: AppColors.onPrimaryContainer,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '• Year 2026-27',
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  _buildViewSwitcher(theme, colorScheme),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Animated Switcher for the Views
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: isWeeklyView
                  ? _buildWeeklyView(context, theme, colorScheme)
                  : _buildTodayView(context, theme, colorScheme),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildViewSwitcher(ThemeData theme, ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () => setState(() => isWeeklyView = false),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: !isWeeklyView
                    ? AppColors.surfaceContainerLowest
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(16),
                boxShadow: !isWeeklyView
                    ? [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ]
                    : null,
              ),
              child: Text(
                'Today',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: !isWeeklyView
                      ? colorScheme.primary
                      : colorScheme.onSurfaceVariant,
                  fontWeight: !isWeeklyView
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => setState(() => isWeeklyView = true),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: isWeeklyView
                    ? AppColors.surfaceContainerLowest
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(16),
                boxShadow: isWeeklyView
                    ? [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ]
                    : null,
              ),
              child: Text(
                'Weekly',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: isWeeklyView
                      ? colorScheme.primary
                      : colorScheme.onSurfaceVariant,
                  fontWeight: isWeeklyView
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTodayView(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Column(
      key: const ValueKey('TodayView'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Day Selector Pill Bar
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              _buildDayPill('Mon 23', theme, colorScheme),
              const SizedBox(width: 6),
              _buildDayPill('Tue 24', theme, colorScheme),
              const SizedBox(width: 6),
              _buildDayPill('Wed 25', theme, colorScheme),
              const SizedBox(width: 6),
              _buildDayPill('Thu 26', theme, colorScheme),
              const SizedBox(width: 6),
              _buildDayPill('Fri 27', theme, colorScheme),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Today's Schedule Overview Card
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: colorScheme.outlineVariant.withValues(alpha: 0.2),
              ),
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
                        color: colorScheme.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.event_note,
                        size: 18,
                        color: colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${selectedDayPill.split(' ').first}'s Schedule",
                          style: theme.textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '6 Periods Scheduled • Class in session',
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontSize: 12,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: colorScheme.secondary,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Active',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSecondaryContainer,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Periods Timeline List
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const _PeriodCard(
                period: 'P1',
                subject: 'Mathematics',
                teacher: 'Mrs. R. Gupta',
                status: _PeriodStatus.completed,
              ),
              const SizedBox(height: 8),
              const _PeriodCard(
                period: 'P2',
                subject: 'Physics',
                teacher: 'Mr. V. Nair',
                status: _PeriodStatus.completed,
              ),
              const SizedBox(height: 8),
              const _PeriodCard(
                period: 'P3',
                subject: 'English Literature',
                teacher: 'Ms. S. Sen',
                status: _PeriodStatus.active,
              ),
              const SizedBox(height: 8),
              _buildRecessDivider(context, theme, colorScheme),
              const SizedBox(height: 8),
              const _PeriodCard(
                period: 'P4',
                subject: 'Chemistry',
                teacher: 'Dr. K. Rao',
                status: _PeriodStatus.upcoming,
              ),
              const SizedBox(height: 8),
              const _PeriodCard(
                period: 'P5',
                subject: 'Computer Science',
                teacher: 'Mr. A. Sharma',
                status: _PeriodStatus.upcoming,
              ),
              const SizedBox(height: 8),
              const _PeriodCard(
                period: 'P6',
                subject: 'Physical Education',
                teacher: 'Coach Rakesh',
                status: _PeriodStatus.upcoming,
              ),
              const SizedBox(height: 48), // Padding for bottom nav
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDayPill(
    String dayText,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    final isActive = selectedDayPill == dayText;

    return GestureDetector(
      onTap: () => setState(() => selectedDayPill = dayText),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: isActive ? colorScheme.primary : colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(20),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Row(
          children: [
            Text(
              dayText,
              style: theme.textTheme.labelSmall?.copyWith(
                color: isActive
                    ? colorScheme.onPrimary
                    : colorScheme.onSurfaceVariant,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            if (isActive) ...[
              const SizedBox(width: 6),
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: AppColors.secondaryFixed,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildWeeklyView(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Column(
      key: const ValueKey('WeeklyView'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Schedule Quick Bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLow.withValues(alpha: 0.8),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: colorScheme.surfaceContainerHigh.withValues(alpha: 0.7),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.schedule, size: 16, color: colorScheme.primary),
                    const SizedBox(width: 6),
                    Text(
                      '08:30 AM – 01:45 PM',
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurfaceVariant,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
                Text(
                  '•',
                  style: TextStyle(color: colorScheme.onSurfaceVariant),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.restaurant,
                      size: 14,
                      color: colorScheme.tertiary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Recess: 11:00 AM (20m)',
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.tertiary,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Traditional Timetable Matrix Card
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: colorScheme.surfaceContainerHigh.withValues(alpha: 0.7),
              ),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primary.withValues(alpha: 0.06),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.grid_on,
                            color: colorScheme.primary,
                            size: 18,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Weekly Matrix',
                            style: theme.textTheme.labelMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '6 Periods / Day',
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: colorScheme.surfaceContainerHigh.withValues(
                    alpha: 0.6,
                  ),
                  height: 1,
                ),

                // Matrix Grid
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SizedBox(
                      width: 500, // Fixed width for scrollable matrix
                      child: Column(
                        children: [
                          _buildMatrixHeader(theme, colorScheme),
                          const SizedBox(height: 6),
                          _buildMatrixRow(
                            'MON',
                            true,
                            ['ENG', 'PHY', 'MTH', 'CS', 'ART', 'PE'],
                            theme,
                            colorScheme,
                          ),
                          _buildMatrixRow(
                            'TUE',
                            false,
                            ['MTH', 'CHE', 'ENG', 'BIO', 'SOC', 'LIB'],
                            theme,
                            colorScheme,
                          ),
                          _buildMatrixRow(
                            'WED',
                            false,
                            ['PHY', 'MTH', 'HIN', 'SOC', 'CS', 'SPT'],
                            theme,
                            colorScheme,
                          ),
                          _buildMatrixRow(
                            'THU',
                            false,
                            ['CHE', 'ENG', 'BIO', 'MTH', 'MOR', 'MUS'],
                            theme,
                            colorScheme,
                          ),
                          _buildMatrixRow(
                            'FRI',
                            false,
                            ['MTH', 'PHY', 'CHE', 'SOC', 'ENG', 'ACT'],
                            theme,
                            colorScheme,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Legend
                Divider(
                  color: colorScheme.surfaceContainerHigh.withValues(
                    alpha: 0.6,
                  ),
                  height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildLegendItem(
                        'Core',
                        colorScheme.onSurfaceVariant,
                        theme,
                      ),
                      _buildLegendItem('STEM', colorScheme.primary, theme),
                      _buildLegendItem(
                        'Bio / Sports',
                        colorScheme.secondary,
                        theme,
                      ),
                      _buildLegendItem(
                        'Arts / Social',
                        colorScheme.tertiary,
                        theme,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Download PDF Timetable Button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: colorScheme.surfaceContainerHigh.withValues(alpha: 0.7),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.02),
                  blurRadius: 4,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.primaryFixed,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.picture_as_pdf,
                        color: colorScheme.primary,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Printable Timetable',
                          style: theme.textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Download official PDF copy',
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontSize: 11,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.download, size: 16),
                  label: const Text('Download'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    textStyle: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 0,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 48), // Padding for bottom nav
      ],
    );
  }

  Widget _buildLegendItem(String title, Color color, ThemeData theme) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(
          title,
          style: theme.textTheme.bodySmall?.copyWith(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildMatrixHeader(ThemeData theme, ColorScheme colorScheme) {
    final style = theme.textTheme.labelSmall?.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.bold,
      color: colorScheme.onSurfaceVariant,
    );
    final timeStyle = theme.textTheme.bodySmall?.copyWith(
      fontSize: 8,
      color: colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
    );

    return Container(
      padding: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: colorScheme.surfaceContainerHigh),
        ),
      ),
      child: Row(
        children: [
          Expanded(flex: 1, child: Text('DAY', style: style)),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text('P1', style: style),
                Text('08:30', style: timeStyle),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text('P2', style: style),
                Text('09:20', style: timeStyle),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text('P3', style: style),
                Text('10:10', style: timeStyle),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Icon(Icons.coffee, size: 10, color: colorScheme.tertiary),
                Text(
                  'REC',
                  style: style?.copyWith(color: colorScheme.tertiary),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text('P4', style: style),
                Text('11:20', style: timeStyle),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text('P5', style: style),
                Text('12:10', style: timeStyle),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text('P6', style: style),
                Text('01:00', style: timeStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMatrixRow(
    String day,
    bool isToday,
    List<String> subjects,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
      decoration: BoxDecoration(
        color: isToday
            ? AppColors.primaryFixed.withValues(alpha: 0.2)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: isToday
            ? Border.all(color: colorScheme.primary.withValues(alpha: 0.2))
            : null,
      ),
      child: Row(
        children: [
          // Day Column
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: isToday
                        ? colorScheme.primary
                        : colorScheme.surfaceContainerHigh,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    day,
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                      color: isToday
                          ? colorScheme.onPrimary
                          : colorScheme.onSurface,
                    ),
                  ),
                ),
                if (isToday)
                  Padding(
                    padding: const EdgeInsets.only(top: 2, left: 2),
                    child: Text(
                      'TODAY',
                      style: theme.textTheme.labelSmall?.copyWith(
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // P1
          Expanded(
            flex: 1,
            child: _buildMatrixCell(subjects[0], theme, colorScheme),
          ),
          // P2
          Expanded(
            flex: 1,
            child: _buildMatrixCell(subjects[1], theme, colorScheme),
          ),
          // P3
          Expanded(
            flex: 1,
            child: _buildMatrixCell(subjects[2], theme, colorScheme),
          ),

          // Recess Dot
          Expanded(
            flex: 1,
            child: Center(
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: AppColors.tertiaryFixed.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(
                    '•',
                    style: TextStyle(
                      color: colorScheme.tertiary,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // P4
          Expanded(
            flex: 1,
            child: _buildMatrixCell(subjects[3], theme, colorScheme),
          ),
          // P5
          Expanded(
            flex: 1,
            child: _buildMatrixCell(subjects[4], theme, colorScheme),
          ),
          // P6
          Expanded(
            flex: 1,
            child: _buildMatrixCell(subjects[5], theme, colorScheme),
          ),
        ],
      ),
    );
  }

  Widget _buildMatrixCell(
    String subject,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    Color textColor = colorScheme.onSurface;
    Color? borderColor;

    // Match the HTML Legend logic
    if (['PHY', 'CHE', 'MTH', 'CS'].contains(subject)) {
      textColor = colorScheme.primary;
      borderColor = colorScheme.primary;
    } else if (['BIO', 'PE', 'SPT'].contains(subject)) {
      textColor = colorScheme.secondary;
      borderColor = colorScheme.secondary;
    } else if (['ART', 'SOC', 'HIN', 'MUS'].contains(subject)) {
      textColor = colorScheme.tertiary;
      borderColor = colorScheme.tertiary;
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
        border: borderColor != null
            ? Border(left: BorderSide(color: borderColor, width: 2))
            : null,
      ),
      child: Center(
        child: Text(
          subject,
          style: theme.textTheme.labelSmall?.copyWith(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }

  Widget _buildRecessDivider(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: colorScheme.outlineVariant.withValues(alpha: 0.3),
            thickness: 1,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.tertiaryFixed.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Icon(Icons.lunch_dining, size: 14, color: colorScheme.tertiary),
              const SizedBox(width: 6),
              Text(
                'Recess Break (20 mins)',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.tertiary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Divider(
            color: colorScheme.outlineVariant.withValues(alpha: 0.3),
            thickness: 1,
          ),
        ),
      ],
    );
  }
}

enum _PeriodStatus { completed, active, upcoming }

class _PeriodCard extends StatelessWidget {
  final String period;
  final String subject;
  final String teacher;
  final _PeriodStatus status;

  const _PeriodCard({
    required this.period,
    required this.subject,
    required this.teacher,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isActive = status == _PeriodStatus.active;

    BoxDecoration decoration;

    if (isActive) {
      decoration = BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.primary, width: 2),
        gradient: LinearGradient(
          colors: [
            AppColors.primaryFixed.withValues(alpha: 0.2),
            AppColors.surfaceContainerLowest,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      );
    } else {
      decoration = BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      );
    }

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: decoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: isActive
                      ? colorScheme.primary
                      : colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    period,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: isActive
                          ? colorScheme.onPrimary
                          : colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subject,
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: isActive
                          ? colorScheme.primary
                          : colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        size: 14,
                        color: isActive
                            ? colorScheme.primary
                            : colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        teacher,
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 12,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          _buildStatusBadge(theme, colorScheme),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(ThemeData theme, ColorScheme colorScheme) {
    String label;
    Color bgColor;
    Color textColor;
    bool showDot = false;

    switch (status) {
      case _PeriodStatus.completed:
        label = 'Completed';
        bgColor = colorScheme.surfaceContainer;
        textColor = colorScheme.onSurfaceVariant;
        break;
      case _PeriodStatus.active:
        label = 'Current';
        bgColor = colorScheme.primary;
        textColor = colorScheme.onPrimary;
        showDot = true;
        break;
      case _PeriodStatus.upcoming:
        label = 'Upcoming';
        bgColor = colorScheme.surfaceContainer;
        textColor = colorScheme.onSurfaceVariant;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showDot) ...[
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: AppColors.secondaryFixed,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 6),
          ],
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
