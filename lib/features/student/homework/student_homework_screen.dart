import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';

class StudentHomeworkScreen extends StatelessWidget {
  const StudentHomeworkScreen({super.key});

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
        title: Column(
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
              'Homework',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colorScheme.onSurface),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: Badge(
              backgroundColor: colorScheme.tertiaryContainer,
              smallSize: 8,
              child: Icon(
                Icons.notifications,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.widgets, color: colorScheme.onSurfaceVariant),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 4),
            child: CircleAvatar(
              radius: 14,
              backgroundColor: colorScheme.primary.withValues(alpha: 0.2),
              backgroundImage: const NetworkImage(
                'https://i.pravatar.cc/150?img=11',
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Day Selector Pill Bar
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerLow,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: colorScheme.surfaceContainerHigh.withValues(
                    alpha: 0.6,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildDayPill('Mon', '23', false, theme, colorScheme),
                  _buildDayPill('Today', '24', true, theme, colorScheme),
                  _buildDayPill('Wed', '25', false, theme, colorScheme),
                  _buildDayPill('Thu', '26', false, theme, colorScheme),
                  _buildDayPill('Fri', '27', false, theme, colorScheme),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Quick Summary Bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Today\'s Tasks',
                      style: theme.textTheme.labelMedium?.copyWith(
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
                        '3 Assigned',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Tue, 24 Sep',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Today's Table / List View
            Container(
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: colorScheme.surfaceContainerHigh.withValues(
                    alpha: 0.8,
                  ),
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
                children: [
                  // Table Header
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerLow,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      border: Border(
                        bottom: BorderSide(
                          color: colorScheme.surfaceContainerHigh.withValues(
                            alpha: 0.8,
                          ),
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 80,
                          child: Text(
                            'SUBJECT',
                            style: theme.textTheme.labelSmall?.copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'HOMEWORK TASK',
                            style: theme.textTheme.labelSmall?.copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 90,
                          child: Text(
                            'STATUS / ACTION',
                            textAlign: TextAlign.right,
                            style: theme.textTheme.labelSmall?.copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Row 1: Upload Needed (Math)
                  _buildTableRow(
                    'Math',
                    'Tomorrow',
                    colorScheme.primary,
                    Icons.schedule,
                    colorScheme.tertiary,
                    'Ex 4.2 Q1–Q8',
                    'Quadratic equations in homework notebook.',
                    'Ex_4.2.pdf',
                    _buildUploadButton(colorScheme),
                    theme,
                    colorScheme,
                  ),
                  Divider(
                    height: 1,
                    color: colorScheme.surfaceContainerHigh.withValues(
                      alpha: 0.6,
                    ),
                  ),
                  // Row 2: Read Only (English)
                  _buildTableRow(
                    'English',
                    'Due Thu',
                    colorScheme.secondary,
                    null,
                    colorScheme.onSurfaceVariant,
                    'Merchant of Venice',
                    'Act 3 Scene 2, read lines 1–107 aloud.',
                    null,
                    _buildReadOnlyBadge(colorScheme),
                    theme,
                    colorScheme,
                  ),
                  Divider(
                    height: 1,
                    color: colorScheme.surfaceContainerHigh.withValues(
                      alpha: 0.6,
                    ),
                  ),
                  // Row 3: Science Submitted
                  _buildTableRow(
                    'Science',
                    'Submitted',
                    colorScheme.primaryContainer,
                    null,
                    colorScheme.secondary,
                    'Lab Diagram pg 44',
                    'Human digestive system colored chart.',
                    null,
                    _buildDoneBadge(colorScheme),
                    theme,
                    colorScheme,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Tomorrow / Upcoming Group
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.schedule,
                      size: 16,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Tomorrow (Wed, 25 Sep)',
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  '2 Tasks Scheduled',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: colorScheme.surfaceContainerHigh.withValues(
                    alpha: 0.8,
                  ),
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
                children: [
                  _buildUpcomingRow(
                    'HIN',
                    'Hindi Vyakaran — Chapter 5',
                    'Page 32 exercise questions 1–5 in rough copy',
                    Colors.orange.shade100,
                    colorScheme.tertiary,
                    _buildOutlineUploadButton(colorScheme),
                    theme,
                    colorScheme,
                  ),
                  Divider(
                    height: 1,
                    color: colorScheme.surfaceContainerHigh.withValues(
                      alpha: 0.6,
                    ),
                  ),
                  _buildUpcomingRow(
                    'SST',
                    'Civics — Indian Judiciary',
                    'Memorize Supreme Court powers & tenure',
                    Colors.blue.shade100,
                    colorScheme.primary,
                    _buildOralReadBadge(colorScheme),
                    theme,
                    colorScheme,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Yesterday (Monday) Completed Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: 16,
                      color: colorScheme.secondary,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Yesterday (Mon, 23 Sep)',
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  'All Completed',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.secondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: colorScheme.surfaceContainerHigh.withValues(
                    alpha: 0.8,
                  ),
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
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'BIO',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cell Structure Questions',
                          style: theme.textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.lineThrough,
                            color: colorScheme.onSurfaceVariant.withValues(
                              alpha: 0.8,
                            ),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Submitted on Sep 23, 4:15 PM',
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontSize: 11,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.verified,
                        size: 14,
                        color: colorScheme.secondary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '100% Done',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildDayPill(
    String dayName,
    String date,
    bool isSelected,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.primary
              : AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(12),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: colorScheme.primary.withValues(alpha: 0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  ),
                ]
              : null,
        ),
        child: Column(
          children: [
            Text(
              dayName,
              style: theme.textTheme.labelSmall?.copyWith(
                fontSize: 10,
                color: isSelected
                    ? colorScheme.onPrimary.withValues(alpha: 0.8)
                    : colorScheme.onSurfaceVariant.withValues(alpha: 0.8),
              ),
            ),
            Text(
              date,
              style: theme.textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: isSelected
                    ? colorScheme.onPrimary
                    : colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTableRow(
    String subject,
    String timeText,
    Color subjectColor,
    IconData? timeIcon,
    Color timeColor,
    String taskTitle,
    String taskDesc,
    String? attachment,
    Widget actionBtn,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subject,
                  style: theme.textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: subjectColor,
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    if (timeIcon != null) ...[
                      Icon(timeIcon, size: 12, color: timeColor),
                      const SizedBox(width: 2),
                    ],
                    Text(
                      timeText,
                      style: theme.textTheme.labelSmall?.copyWith(
                        fontSize: 10,
                        color: timeColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskTitle,
                  style: theme.textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  taskDesc,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 11,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                if (attachment != null) ...[
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainer,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.attach_file,
                          size: 12,
                          color: colorScheme.primary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          attachment,
                          style: theme.textTheme.labelSmall?.copyWith(
                            fontSize: 10,
                            color: colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
          SizedBox(
            width: 90,
            child: Align(alignment: Alignment.topRight, child: actionBtn),
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingRow(
    String shortCode,
    String title,
    String desc,
    Color iconBg,
    Color iconColor,
    Widget trailing,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                shortCode,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: iconColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
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
                Text(
                  desc,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 11,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          trailing,
        ],
      ),
    );
  }

  Widget _buildUploadButton(ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.upload_file, size: 14, color: colorScheme.onPrimary),
          const SizedBox(width: 4),
          Text(
            'Upload',
            style: TextStyle(
              color: colorScheme.onPrimary,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOutlineUploadButton(ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: colorScheme.primary.withValues(alpha: 0.4)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.add, size: 12, color: colorScheme.primary),
          const SizedBox(width: 2),
          Text(
            'Upload',
            style: TextStyle(
              color: colorScheme.primary,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReadOnlyBadge(ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.menu_book, size: 12, color: colorScheme.secondary),
          const SizedBox(width: 4),
          Text(
            'Read Only',
            style: TextStyle(
              color: colorScheme.onSurfaceVariant,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOralReadBadge(ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.visibility, size: 12, color: colorScheme.secondary),
          const SizedBox(width: 4),
          Text(
            'Oral / Read',
            style: TextStyle(
              color: colorScheme.onSurfaceVariant,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDoneBadge(ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: colorScheme.secondaryContainer.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check_circle, size: 12, color: colorScheme.secondary),
          const SizedBox(width: 4),
          Text(
            'Done',
            style: TextStyle(
              color: colorScheme.secondary,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
