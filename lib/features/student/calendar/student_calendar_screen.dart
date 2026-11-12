import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';

class StudentCalendarScreen extends StatefulWidget {
  const StudentCalendarScreen({super.key});

  @override
  State<StudentCalendarScreen> createState() => _StudentCalendarScreenState();
}

class _StudentCalendarScreenState extends State<StudentCalendarScreen> {
  String _selectedCategory = 'all';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface.withValues(alpha: 0.9),
        elevation: 0,
        scrolledUnderElevation: 1,
        title: Text(
          'Academic Calendar',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLow,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_back,
              size: 20,
              color: colorScheme.onSurface,
            ),
          ),
          onPressed: () => context.pop(),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16, top: 10, bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 14,
                  color: colorScheme.primary,
                ),
                const SizedBox(width: 4),
                Text(
                  'Sep 2026',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Compact Month Calendar Card
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
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
                          Text(
                            _getCategoryTitle(),
                            style: theme.textTheme.titleSmall?.copyWith(
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
                              color: AppColors.primaryFixed,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '5 Dates',
                              style: theme.textTheme.labelSmall?.copyWith(
                                fontSize: 10,
                                color: colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Term 1 • 2026',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Days Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: ['M', 'T', 'W', 'T', 'F', 'S', 'S']
                        .asMap()
                        .entries
                        .map(
                          (e) => SizedBox(
                            width: 32,
                            child: Text(
                              e.value,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: e.key == 5
                                    ? colorScheme.primary
                                    : e.key == 6
                                    ? colorScheme.tertiary
                                    : colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 8),
                  // Calendar Matrix
                  GridView.count(
                    crossAxisCount: 7,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: 1.0,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    children: [
                      _buildDateText('31', true, null, colorScheme),
                      _buildDateText('1', false, null, colorScheme),
                      _buildDateText('2', false, null, colorScheme),
                      _buildDateText('3', false, null, colorScheme),
                      _buildDateText('4', false, null, colorScheme),
                      _buildDateEvent(
                        '5',
                        colorScheme.secondary,
                        false,
                        colorScheme,
                      ),
                      _buildDateText(
                        '6',
                        false,
                        colorScheme.tertiary,
                        colorScheme,
                      ),
                      _buildDateText('7', false, null, colorScheme),
                      _buildDateText('8', false, null, colorScheme),
                      _buildDateText('9', false, null, colorScheme),
                      _buildDateText('10', false, null, colorScheme),
                      _buildDateText('11', false, null, colorScheme),
                      _buildDateText('12', false, null, colorScheme),
                      _buildDateText(
                        '13',
                        false,
                        colorScheme.tertiary,
                        colorScheme,
                      ),
                      _buildDateText('14', false, null, colorScheme),
                      _buildDateText('15', false, null, colorScheme),
                      _buildDateText('16', false, null, colorScheme),
                      _buildDateText('17', false, null, colorScheme),
                      _buildDateText('18', false, null, colorScheme),
                      _buildDateEvent(
                        '19',
                        colorScheme.tertiaryContainer,
                        false,
                        colorScheme,
                      ),
                      _buildDateText(
                        '20',
                        false,
                        colorScheme.tertiary,
                        colorScheme,
                      ),
                      _buildDateText('21', false, null, colorScheme),
                      _buildDateText('22', false, null, colorScheme),
                      _buildDateText('23', false, null, colorScheme),
                      _buildDateEvent(
                        '24',
                        colorScheme.primary,
                        true,
                        colorScheme,
                      ), // Today
                      _buildDateText('25', false, null, colorScheme),
                      _buildDateText('26', false, null, colorScheme),
                      _buildDateText(
                        '27',
                        false,
                        colorScheme.tertiary,
                        colorScheme,
                      ),
                      _buildSelectedDate('28', colorScheme), // Selected
                      _buildDateText('29', false, null, colorScheme),
                      _buildDateEvent(
                        '30',
                        colorScheme.tertiary,
                        false,
                        colorScheme,
                      ),
                      _buildDateText('1', true, null, colorScheme),
                      _buildDateText('2', true, null, colorScheme),
                      _buildDateText('3', true, null, colorScheme),
                      _buildDateText('4', true, null, colorScheme),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Indicator Key
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: colorScheme.surfaceContainer),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildKeyItem('Exam', colorScheme.primary, theme),
                        const SizedBox(width: 16),
                        _buildKeyItem('Holiday', colorScheme.secondary, theme),
                        const SizedBox(width: 16),
                        _buildKeyItem(
                          'Event / PTM',
                          colorScheme.tertiaryContainer,
                          theme,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Category filter bar
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildCategoryTab(
                    'all',
                    'All Dates',
                    Icons.calendar_view_day,
                    null,
                    colorScheme,
                    theme,
                  ),
                  const SizedBox(width: 8),
                  _buildCategoryTab(
                    'exam',
                    'Exams (4)',
                    null,
                    colorScheme.primary,
                    colorScheme,
                    theme,
                  ),
                  const SizedBox(width: 8),
                  _buildCategoryTab(
                    'holiday',
                    'Holidays (2)',
                    null,
                    colorScheme.secondary,
                    colorScheme,
                    theme,
                  ),
                  const SizedBox(width: 8),
                  _buildCategoryTab(
                    'event',
                    'Events (3)',
                    null,
                    colorScheme.tertiaryContainer,
                    colorScheme,
                    theme,
                  ),
                  const SizedBox(width: 8),
                  _buildCategoryTab(
                    'ptm',
                    'PTM (2)',
                    null,
                    colorScheme.tertiary,
                    colorScheme,
                    theme,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Categorized events list
            if (_selectedCategory == 'all' || _selectedCategory == 'exam')
              _buildEventCard(
                '28',
                'Sep',
                'Mathematics Mid-Term',
                'Exam Date',
                'Hall A',
                '10:00 AM – 12:00 PM • Theory Exam',
                AppColors.primaryFixed,
                colorScheme.primary,
                theme,
                colorScheme,
              ),

            if (_selectedCategory == 'all' || _selectedCategory == 'ptm')
              _buildEventCard(
                '28',
                'Sep',
                'Quarterly PTM (Term 1)',
                'PTM Date',
                'Auditorium',
                '02:00 PM – 05:00 PM • Parent Interaction',
                AppColors.tertiaryFixed,
                colorScheme.onTertiaryContainer,
                theme,
                colorScheme,
              ),

            if (_selectedCategory == 'all' || _selectedCategory == 'ptm')
              _buildEventCard(
                '30',
                'Sep',
                'Parent-Teacher Review',
                'PTM Date',
                null,
                '02:00 PM • Auditorium & One-on-One',
                AppColors.tertiaryFixed,
                colorScheme.onTertiaryContainer,
                theme,
                colorScheme,
              ),

            if (_selectedCategory == 'all' || _selectedCategory == 'holiday')
              _buildEventCard(
                '02',
                'Oct',
                'Gandhi Jayanti',
                'Holiday Date',
                null,
                'Full Day • School Closed',
                colorScheme.secondaryContainer,
                colorScheme.onSecondaryContainer,
                theme,
                colorScheme,
              ),

            if (_selectedCategory == 'all' || _selectedCategory == 'event')
              _buildEventCard(
                '15',
                'Oct',
                'Annual Sports Meet',
                'Event Date',
                null,
                '08:30 AM – 04:00 PM • Sports Complex',
                colorScheme.tertiaryContainer,
                colorScheme.onTertiaryContainer,
                theme,
                colorScheme,
              ),

            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  String _getCategoryTitle() {
    switch (_selectedCategory) {
      case 'exam':
        return 'Exam Dates (Term 1)';
      case 'holiday':
        return 'Official Holidays';
      case 'event':
        return 'School Events';
      case 'ptm':
        return 'PTM & Review Dates';
      default:
        return 'All Schedule Dates';
    }
  }

  Widget _buildDateText(
    String date,
    bool isMuted,
    Color? color,
    ColorScheme colorScheme,
  ) {
    return Center(
      child: Text(
        date,
        style: TextStyle(
          fontSize: 12,
          color: isMuted
              ? colorScheme.outlineVariant.withValues(alpha: 0.5)
              : color ?? colorScheme.onSurface,
        ),
      ),
    );
  }

  Widget _buildDateEvent(
    String date,
    Color dotColor,
    bool isToday,
    ColorScheme colorScheme,
  ) {
    return Container(
      decoration: isToday
          ? BoxDecoration(
              color: colorScheme.surfaceContainerHigh,
              borderRadius: BorderRadius.circular(20),
            )
          : null,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            date,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
              color: isToday ? colorScheme.primary : colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 2),
          Container(
            width: 4,
            height: 4,
            decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedDate(String date, ColorScheme colorScheme) {
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.primary,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withValues(alpha: 0.3),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            date,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: colorScheme.onPrimary,
            ),
          ),
          const SizedBox(height: 2),
          Container(
            width: 4,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.primaryFixed,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKeyItem(String label, Color color, ThemeData theme) {
    return Row(
      children: [
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            fontSize: 11,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryTab(
    String id,
    String label,
    IconData? icon,
    Color? dotColor,
    ColorScheme colorScheme,
    ThemeData theme,
  ) {
    final isSelected = _selectedCategory == id;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategory = id;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.primary
              : colorScheme.surfaceContainerLow,
          borderRadius: BorderRadius.circular(20),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: colorScheme.primary.withValues(alpha: 0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Row(
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: 14,
                color: isSelected
                    ? colorScheme.onPrimary
                    : colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: 6),
            ],
            if (dotColor != null) ...[
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: dotColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
            ],
            Text(
              label,
              style: theme.textTheme.labelSmall?.copyWith(
                color: isSelected
                    ? colorScheme.onPrimary
                    : colorScheme.onSurfaceVariant,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventCard(
    String date,
    String month,
    String title,
    String badge,
    String? location,
    String desc,
    Color avatarBg,
    Color avatarColor,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: avatarBg,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        date,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: avatarColor,
                          height: 1,
                        ),
                      ),
                      Text(
                        month,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 9,
                          color: avatarColor,
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
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 6,
                        runSpacing: 4,
                        children: [
                          Text(
                            title,
                            style: theme.textTheme.labelMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: avatarBg,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              badge,
                              style: theme.textTheme.labelSmall?.copyWith(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: avatarColor,
                              ),
                            ),
                          ),
                          if (location != null)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: colorScheme.surfaceContainerLow,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                location,
                                style: theme.textTheme.labelSmall?.copyWith(
                                  fontSize: 10,
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        desc,
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 11,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right,
            size: 20,
            color: colorScheme.outlineVariant,
          ),
        ],
      ),
    );
  }
}
