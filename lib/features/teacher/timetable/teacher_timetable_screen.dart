import 'package:flutter/material.dart';

class TeacherTimetableScreen extends StatefulWidget {
  const TeacherTimetableScreen({super.key});

  @override
  State<TeacherTimetableScreen> createState() => _TeacherTimetableScreenState();
}

class _TeacherTimetableScreenState extends State<TeacherTimetableScreen> {
  int _selectedTab = 0; // 0: Daily, 1: Weekly
  int _selectedDayIndex = 1; // For daily view

  final List<String> _days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'];
  final List<String> _dates = ['14', '15', '16', '17', '18'];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        scrolledUnderElevation: 1,
        title: const Text(
          'Timetable',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Segmented Switcher
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  _buildTab(0, 'Daily', colorScheme, theme),
                  _buildTab(1, 'Weekly', colorScheme, theme),
                ],
              ),
            ),
            const SizedBox(height: 24),

            if (_selectedTab == 0)
              _buildDailyView(theme, colorScheme)
            else
              _buildWeeklyView(theme, colorScheme),

            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(
    int index,
    String title,
    ColorScheme colorScheme,
    ThemeData theme,
  ) {
    bool isSelected = _selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedTab = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? colorScheme.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 4,
                    ),
                  ]
                : null,
          ),
          child: Center(
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
      ),
    );
  }

  Widget _buildDailyView(ThemeData theme, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Horizontal Day Scroller
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(_days.length, (index) {
              bool isSelected = _selectedDayIndex == index;
              return GestureDetector(
                onTap: () => setState(() => _selectedDayIndex = index),
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? colorScheme.primary
                        : colorScheme.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: colorScheme.primary.withValues(alpha: 0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ]
                        : null,
                  ),
                  child: Column(
                    children: [
                      Text(
                        _days[index],
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: isSelected
                              ? colorScheme.primaryContainer
                              : colorScheme.onSurfaceVariant.withValues(
                                  alpha: 0.7,
                                ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _dates[index],
                        style: theme.textTheme.headlineSmall?.copyWith(
                          color: isSelected
                              ? colorScheme.onPrimary
                              : colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (isSelected)
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: colorScheme.primaryContainer,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Today\'s Schedule',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        _buildDailyTimelineItem(
          '08:00 AM',
          '08:45 AM',
          'Period 1',
          'Mathematics',
          'Class 8-A • Room 102',
          Colors.blue,
          true,
          theme,
          colorScheme,
        ),
        _buildDailyTimelineItem(
          '08:45 AM',
          '09:30 AM',
          'Period 2',
          'Physics',
          'Class 9-B • Lab 2',
          Colors.indigo,
          false,
          theme,
          colorScheme,
        ),
        _buildDailyTimelineItem(
          '09:30 AM',
          '10:15 AM',
          'Period 3',
          'Free Period',
          'Staff Room',
          Colors.grey,
          false,
          theme,
          colorScheme,
        ),
        _buildDailyTimelineItem(
          '10:15 AM',
          '11:00 AM',
          'Period 4',
          'Mathematics',
          'Class 10-A • Room 205',
          Colors.blue,
          false,
          theme,
          colorScheme,
        ),
      ],
    );
  }

  Widget _buildDailyTimelineItem(
    String startTime,
    String endTime,
    String period,
    String subject,
    String details,
    Color color,
    bool isActive,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  startTime,
                  style: theme.textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isActive
                        ? colorScheme.primary
                        : colorScheme.onSurface,
                  ),
                ),
                Text(
                  endTime,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 10,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Column(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: isActive
                      ? colorScheme.primary
                      : colorScheme.surfaceContainerHighest,
                  shape: BoxShape.circle,
                  border: Border.all(color: colorScheme.surface, width: 2),
                ),
              ),
              Container(
                width: 2,
                height: 60,
                color: colorScheme.surfaceContainerHighest,
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isActive
                    ? color.withValues(alpha: 0.1)
                    : colorScheme.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isActive
                      ? color.withValues(alpha: 0.3)
                      : colorScheme.surfaceContainer,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        period,
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: isActive
                              ? color
                              : colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (isActive)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            'NOW',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subject,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 14,
                        color: colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        details,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
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
    );
  }

  Widget _buildWeeklyView(ThemeData theme, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Weekly Summary Card
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [colorScheme.primary, colorScheme.primaryContainer],
            ),
            borderRadius: BorderRadius.circular(20),
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
                    Text(
                      'WEEKLY TEACHING LOAD',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorScheme.onPrimary.withValues(alpha: 0.7),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '28 Periods / Wk • 6 Free',
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
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
                        Expanded(
                          child: Text(
                            'Sections: 8-A, 9-B, 10-A, 10-B (Maths & Phys)',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.onPrimary.withValues(
                                alpha: 0.9,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.2),
                  ),
                ),
                child: Icon(
                  Icons.calendar_view_week,
                  color: colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'Weekly Schedule',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
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
                    'Mon – Sat',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),

        _buildWeeklyRow('Monday', '5 Periods', '1 Free', colorScheme, theme),
        _buildWeeklyRow('Tuesday', '4 Periods', '2 Free', colorScheme, theme),
        _buildWeeklyRow('Wednesday', '6 Periods', '0 Free', colorScheme, theme),
        _buildWeeklyRow('Thursday', '5 Periods', '1 Free', colorScheme, theme),
        _buildWeeklyRow('Friday', '5 Periods', '1 Free', colorScheme, theme),
        _buildWeeklyRow(
          'Saturday',
          '3 Periods',
          '1 Free',
          colorScheme,
          theme,
          isLast: true,
        ),
      ],
    );
  }

  Widget _buildWeeklyRow(
    String day,
    String periods,
    String free,
    ColorScheme colorScheme,
    ThemeData theme, {
    bool isLast = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.surfaceContainer),
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
                  color: colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    day.substring(0, 3),
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    day,
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '$periods • $free',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Icon(
            Icons.chevron_right,
            color: colorScheme.outlineVariant,
            size: 20,
          ),
        ],
      ),
    );
  }
}
