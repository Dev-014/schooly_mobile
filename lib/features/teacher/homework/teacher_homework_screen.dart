import 'package:flutter/material.dart';

class TeacherHomeworkScreen extends StatefulWidget {
  const TeacherHomeworkScreen({super.key});

  @override
  State<TeacherHomeworkScreen> createState() => _TeacherHomeworkScreenState();
}

class _TeacherHomeworkScreenState extends State<TeacherHomeworkScreen> {
  int _selectedTab = 0; // 0: Homework, 1: Classwork
  int _selectedClassIndex = 1; // Default to Class 10-A

  final List<String> _classes = [
    'All Classes',
    'Class 10-A',
    'Class 9-B',
    'Class 8-A',
  ];

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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'SESSION 2024-25',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    fontSize: 10,
                  ),
                ),
                Text(
                  _selectedTab == 0 ? '3 Active Tasks' : '3 Logs',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'Homework & Classwork',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Segmented Pill Tab Switcher
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedTab = 0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: _selectedTab == 0
                              ? colorScheme.surface
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: _selectedTab == 0
                              ? [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.05),
                                    blurRadius: 4,
                                  ),
                                ]
                              : null,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.edit_note,
                              size: 18,
                              color: _selectedTab == 0
                                  ? colorScheme.primary
                                  : colorScheme.onSurfaceVariant,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Homework',
                              style: theme.textTheme.labelMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: _selectedTab == 0
                                    ? colorScheme.primary
                                    : colorScheme.onSurfaceVariant,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: _selectedTab == 0
                                    ? colorScheme.primaryContainer
                                    : colorScheme.surfaceContainerHighest,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                '3',
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: _selectedTab == 0
                                      ? colorScheme.onPrimaryContainer
                                      : colorScheme.onSurfaceVariant,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedTab = 1),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: _selectedTab == 1
                              ? colorScheme.surface
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: _selectedTab == 1
                              ? [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.05),
                                    blurRadius: 4,
                                  ),
                                ]
                              : null,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.menu_book,
                              size: 18,
                              color: _selectedTab == 1
                                  ? colorScheme.primary
                                  : colorScheme.onSurfaceVariant,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Classwork',
                              style: theme.textTheme.labelMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: _selectedTab == 1
                                    ? colorScheme.primary
                                    : colorScheme.onSurfaceVariant,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: _selectedTab == 1
                                    ? colorScheme.primaryContainer
                                    : colorScheme.surfaceContainerHighest,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                '2',
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: _selectedTab == 1
                                      ? colorScheme.onPrimaryContainer
                                      : colorScheme.onSurfaceVariant,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Prominent Primary Action
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(
                _selectedTab == 0 ? Icons.add_circle : Icons.add,
                size: 20,
              ),
              label: Text(
                _selectedTab == 0
                    ? 'Assign New Homework'
                    : 'Record Today\'s Classwork',
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                foregroundColor: colorScheme.onPrimary,
                padding: const EdgeInsets.symmetric(vertical: 14),
                minimumSize: const Size(double.infinity, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 2,
              ),
            ),
            const SizedBox(height: 16),

            // Class Filter Chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(_classes.length, (index) {
                  final isSelected = _selectedClassIndex == index;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
                      label: Text(_classes[index]),
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() => _selectedClassIndex = index);
                      },
                      labelStyle: TextStyle(
                        color: isSelected
                            ? colorScheme.onPrimary
                            : colorScheme.onSurfaceVariant,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.w500,
                        fontSize: 12,
                      ),
                      backgroundColor: colorScheme.surface,
                      selectedColor: colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color: isSelected
                              ? Colors.transparent
                              : colorScheme.outlineVariant,
                        ),
                      ),
                      showCheckmark: false,
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 16),

            if (_selectedTab == 0) ...[
              // Homework List
              _buildHomeworkCard(
                subject: 'Maths',
                className: 'Class 10-A',
                dueStatus: 'Due Tomorrow, 26 Sep',
                dueIcon: Icons.schedule,
                dueColor: Colors.orange,
                title: 'Quadratic Equations - Ex 4.2',
                subtitle: 'NCERT Problems 1 to 10 • 10 Marks',
                submitted: 28,
                total: 34,
                pending: 6,
                statusColor: colorScheme.primary,
                actionButtons: [
                  _buildActionButton(
                    'View Submissions',
                    Icons.checklist,
                    colorScheme.primary,
                    true,
                    colorScheme,
                    isExpanded: true,
                  ),
                ],
                theme: theme,
                colorScheme: colorScheme,
              ),
              const SizedBox(height: 14),

              _buildHomeworkCard(
                subject: 'Physics',
                className: 'Class 10-B',
                dueStatus: 'Due Fri, 27 Sep',
                dueIcon: Icons.event,
                dueColor: Colors.green,
                title: 'Ray Optics Numerical Practice',
                subtitle: 'Mirror Formula & Magnification sheet',
                submitted: 15,
                total: 32,
                pending: 17,
                statusColor: colorScheme.primary,
                pendingColor: Colors.orange,
                actionButtons: [
                  _buildActionButton(
                    'Submissions (15)',
                    Icons.checklist,
                    colorScheme.primaryContainer,
                    false,
                    colorScheme,
                    textColor: colorScheme.primary,
                    isExpanded: true,
                  ),
                  const SizedBox(width: 8),
                  _buildActionButton(
                    'Remind',
                    Icons.send,
                    colorScheme.surfaceContainerHigh,
                    false,
                    colorScheme,
                    textColor: colorScheme.onSurfaceVariant,
                    isExpanded: false,
                  ),
                ],
                theme: theme,
                colorScheme: colorScheme,
              ),
              const SizedBox(height: 14),

              _buildHomeworkCard(
                subject: 'Maths',
                className: 'Class 8-A',
                dueStatus: 'Completed • 22 Sep',
                dueIcon: Icons.task_alt,
                dueColor: Colors.green,
                title: 'Linear Equations Worksheet',
                subtitle: 'Chapter Review & Graphing Practice',
                submitted: 30,
                total: 30,
                pending: 0,
                statusColor: Colors.green,
                customStatusText: 'All Checked • 30/30',
                customStatusIcon: Icons.verified,
                customPendingBadge: 'Avg: 8.8/10',
                actionButtons: [
                  _buildActionButton(
                    'View Results & Feedback',
                    Icons.analytics,
                    colorScheme.surfaceContainerHigh,
                    false,
                    colorScheme,
                    textColor: colorScheme.onSurfaceVariant,
                    isExpanded: true,
                  ),
                ],
                theme: theme,
                colorScheme: colorScheme,
              ),
            ] else ...[
              // Classwork List
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Classwork Logs',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '3 Entries',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _buildClassworkCard(
                subject: 'Maths',
                className: 'Class 10-A',
                subjectColor: colorScheme.primary,
                title: 'Quadratic Equations — Ex 4.1',
                subtitle:
                    'Covered roots formula & derivation. Board notes saved.',
                theme: theme,
                colorScheme: colorScheme,
              ),
              const SizedBox(height: 12),
              _buildClassworkCard(
                subject: 'Physics',
                className: 'Class 9-B',
                subjectColor: colorScheme.primary,
                title: 'Newton\'s Laws of Motion',
                subtitle: '2nd law derivation & demo completed in Lab 1.',
                theme: theme,
                colorScheme: colorScheme,
              ),
              const SizedBox(height: 12),
              _buildClassworkCard(
                subject: 'Science',
                className: 'Class 8-A',
                subjectColor: colorScheme.outlineVariant,
                title: 'Cell Structure & Functions',
                subtitle: 'Introduction & plant cell diagram drawn on board.',
                theme: theme,
                colorScheme: colorScheme,
              ),
            ],
            const SizedBox(height: 80), // Padding for bottom bar
          ],
        ),
      ),
    );
  }

  Widget _buildHomeworkCard({
    required String subject,
    required String className,
    required String dueStatus,
    required IconData dueIcon,
    required Color dueColor,
    required String title,
    required String subtitle,
    required int submitted,
    required int total,
    required int pending,
    required Color statusColor,
    Color? pendingColor,
    String? customStatusText,
    IconData? customStatusIcon,
    String? customPendingBadge,
    required List<Widget> actionButtons,
    required ThemeData theme,
    required ColorScheme colorScheme,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.surfaceContainer),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 4),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '$subject • $className',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: dueColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(dueIcon, size: 12, color: dueColor),
                    const SizedBox(width: 4),
                    Text(
                      dueStatus,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: dueColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHigh.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: colorScheme.surfaceContainer),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      customStatusIcon ?? Icons.assignment_turned_in,
                      size: 18,
                      color: statusColor,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      customStatusText ?? '$submitted / $total Submitted',
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color:
                        pendingColor?.withValues(alpha: 0.1) ??
                        statusColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    customPendingBadge ?? '$pending Pending',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: pendingColor ?? statusColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(children: actionButtons),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    String label,
    IconData icon,
    Color bgColor,
    bool isPrimary,
    ColorScheme colorScheme, {
    Color? textColor,
    bool isExpanded = false,
  }) {
    final button = ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor:
            textColor ??
            (isPrimary ? colorScheme.onPrimary : colorScheme.onSurface),
        elevation: isPrimary ? 2 : 0,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        minimumSize: Size(isExpanded ? double.infinity : 0, 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
    return isExpanded ? Expanded(child: button) : button;
  }

  Widget _buildClassworkCard({
    required String subject,
    required String className,
    required Color subjectColor,
    required String title,
    required String subtitle,
    required ThemeData theme,
    required ColorScheme colorScheme,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.surfaceContainer),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 4),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: subjectColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '$subject • $className',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainer,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.edit,
                  size: 16,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
