import 'package:flutter/material.dart';

class ParentAttendanceScreen extends StatelessWidget {
  const ParentAttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface.withValues(alpha: 0.85),
        elevation: 0,
        scrolledUnderElevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.calendar_today,
                color: colorScheme.onPrimaryContainer,
                size: 22,
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PARENT PORTAL',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    fontSize: 9,
                  ),
                ),
                Text(
                  'Attendance',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Stack(
              children: [
                const Icon(Icons.notifications_outlined),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color(0xFFA33900),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {},
          ),
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHigh,
              shape: BoxShape.circle,
            ),
            child: const CircleAvatar(
              radius: 14,
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Child context pill
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 4,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 18,
                      backgroundColor: Color(0xFFCCE5FF),
                      child: Text(
                        'AP',
                        style: TextStyle(
                          color: Color(0xFF006194),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            'Arun Patel',
                            style: theme.textTheme.labelLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '•',
                            style: TextStyle(color: colorScheme.outline),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Class 7-A',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainer,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.swap_horiz,
                            size: 14,
                            color: colorScheme.primary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Switch',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 2. Month Header & Rate
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'September 2026',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: colorScheme.primary,
                        size: 24,
                      ),
                    ],
                  ),
                  Text(
                    '92% Rate',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme
                          .secondary, // Assuming secondary is a green-ish color for Good Standing
                    ),
                  ),
                ],
              ),
            ),

            // 3. Calendar Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Day headers
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: ['M', 'T', 'W', 'T', 'F', 'S', 'S']
                          .map(
                            (d) => SizedBox(
                              width: 36,
                              child: Text(
                                d,
                                textAlign: TextAlign.center,
                                style: theme.textTheme.labelMedium?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 12),

                    // Calendar grid
                    GridView.count(
                      crossAxisCount: 7,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      childAspectRatio: 1.0,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      children: [
                        // Week 1 (Starts on Tuesday in Sept 2026)
                        const SizedBox(),
                        _buildDayCell('1', 'P', colorScheme),
                        _buildDayCell('2', 'P', colorScheme),
                        _buildDayCell('3', 'P', colorScheme),
                        _buildDayCell('4', 'P', colorScheme),
                        _buildDayCell('5', '-', colorScheme),
                        _buildDayCell('6', '-', colorScheme),
                        // Week 2
                        _buildDayCell('7', 'P', colorScheme),
                        _buildDayCell('8', 'P', colorScheme),
                        _buildDayCell('9', 'P', colorScheme),
                        _buildDayCell('10', 'A', colorScheme),
                        _buildDayCell('11', 'P', colorScheme),
                        _buildDayCell('12', '-', colorScheme),
                        _buildDayCell('13', '-', colorScheme),
                        // Week 3
                        _buildDayCell('14', 'P', colorScheme),
                        _buildDayCell('15', 'L', colorScheme),
                        _buildDayCell('16', 'P', colorScheme),
                        _buildDayCell('17', 'P', colorScheme),
                        _buildDayCell('18', 'P', colorScheme),
                        _buildDayCell('19', '-', colorScheme),
                        _buildDayCell('20', '-', colorScheme),
                        // Week 4
                        _buildDayCell('21', 'P', colorScheme),
                        _buildDayCell('22', 'P', colorScheme),
                        _buildDayCell('23', 'P', colorScheme),
                        _buildDayCell('24', 'P', colorScheme, isToday: true),
                        _buildDayCell('25', 'F', colorScheme),
                        _buildDayCell('26', '-', colorScheme),
                        _buildDayCell('27', '-', colorScheme),
                        // Week 5
                        _buildDayCell('28', 'F', colorScheme),
                        _buildDayCell('29', 'F', colorScheme),
                        _buildDayCell('30', 'F', colorScheme),
                        const SizedBox(),
                        const SizedBox(),
                        const SizedBox(),
                        const SizedBox(),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // 4. Month Summary Chips
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: _buildSummaryChip(
                      '22 Days',
                      'Present',
                      Icons.check_circle,
                      colorScheme.secondary,
                      colorScheme.secondaryContainer,
                      colorScheme,
                      theme,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildSummaryChip(
                      '2 Days',
                      'Absent',
                      Icons.cancel,
                      colorScheme.error,
                      colorScheme.errorContainer,
                      colorScheme,
                      theme,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildSummaryChip(
                      '1 Day',
                      'Leave',
                      Icons.event_busy,
                      colorScheme.tertiary,
                      colorScheme.tertiaryContainer,
                      colorScheme,
                      theme,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDayCell(
    String day,
    String status,
    ColorScheme colorScheme, {
    bool isToday = false,
  }) {
    final isWeekend = status == '-';
    final isFuture = status == 'F';

    Color bgColor = Colors.transparent;
    Color textColor = colorScheme.onSurface;
    Color borderColor = Colors.transparent;

    if (isToday) {
      bgColor = colorScheme.primary;
      textColor = colorScheme.onPrimary;
    } else if (status == 'P') {
      bgColor = colorScheme.secondaryContainer.withValues(alpha: 0.5);
      textColor = colorScheme.secondary;
      borderColor = colorScheme.secondary.withValues(alpha: 0.2);
    } else if (status == 'A') {
      bgColor = colorScheme.errorContainer.withValues(alpha: 0.5);
      textColor = colorScheme.error;
      borderColor = colorScheme.error.withValues(alpha: 0.2);
    } else if (status == 'L') {
      bgColor = colorScheme.tertiaryContainer.withValues(alpha: 0.5);
      textColor = colorScheme.tertiary;
      borderColor = colorScheme.tertiary.withValues(alpha: 0.2);
    } else if (isWeekend) {
      textColor = colorScheme.outline;
    } else if (isFuture) {
      textColor = colorScheme.outline;
    }

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
        border: borderColor != Colors.transparent
            ? Border.all(color: borderColor)
            : null,
      ),
      child: Center(
        child: Text(
          day,
          style: TextStyle(
            fontSize: 14,
            fontWeight: (isWeekend || isFuture)
                ? FontWeight.normal
                : FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryChip(
    String title,
    String subtitle,
    IconData icon,
    Color iconColor,
    Color bgColor,
    ColorScheme colorScheme,
    ThemeData theme,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: bgColor.withValues(alpha: 0.5),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 16, color: iconColor),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
              Text(
                subtitle,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
