import 'package:flutter/material.dart';

class TeacherMarksEntryScreen extends StatefulWidget {
  const TeacherMarksEntryScreen({super.key});

  @override
  State<TeacherMarksEntryScreen> createState() =>
      _TeacherMarksEntryScreenState();
}

class _TeacherMarksEntryScreenState extends State<TeacherMarksEntryScreen> {
  int _selectedClassIndex = 0;
  final List<String> _classes = [
    'Class 10-A',
    'Class 9-B',
    'Class 8-A',
    'Class 11-C',
  ];

  // Mock student data
  final List<Map<String, dynamic>> _students = [
    {
      'roll': '01',
      'name': 'Aarav Sharma',
      'reg': 'Reg #10041',
      'score': '46',
      'grade': 'A1',
      'isAbsent': false,
    },
    {
      'roll': '02',
      'name': 'Ananya Patel',
      'reg': 'Reg #10042',
      'score': '42',
      'grade': 'A2',
      'isAbsent': false,
    },
    {
      'roll': '03',
      'name': 'Devansh Gupta',
      'reg': 'Reg #10043',
      'score': '',
      'grade': 'F',
      'isAbsent': true,
    },
    {
      'roll': '04',
      'name': 'Diya Reddy',
      'reg': 'Reg #10044',
      'score': '38',
      'grade': 'B1',
      'isAbsent': false,
    },
    {
      'roll': '05',
      'name': 'Ishaan Verma',
      'reg': 'Reg #10045',
      'score': '25',
      'grade': 'C2',
      'isAbsent': false,
    },
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
        title: const Text(
          'Marks Entry',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Assessment Context Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.primary.withValues(alpha: 0.05),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'SELECT CLASS & DIVISION',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          letterSpacing: 1.2,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.primaryContainer.withValues(
                            alpha: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.tune,
                              size: 14,
                              color: colorScheme.primary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Filter',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Class Horizontal Chips
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(_classes.length, (index) {
                        bool isSelected = index == _selectedClassIndex;
                        return GestureDetector(
                          onTap: () =>
                              setState(() => _selectedClassIndex = index),
                          child: Container(
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? colorScheme.primary
                                  : colorScheme.surfaceContainer,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: isSelected
                                  ? [
                                      BoxShadow(
                                        color: colorScheme.primary.withValues(
                                          alpha: 0.2,
                                        ),
                                        blurRadius: 4,
                                      ),
                                    ]
                                  : null,
                            ),
                            child: Row(
                              children: [
                                if (isSelected) ...[
                                  Icon(
                                    Icons.school,
                                    size: 16,
                                    color: colorScheme.onPrimary,
                                  ),
                                  const SizedBox(width: 6),
                                ],
                                Text(
                                  _classes[index],
                                  style: theme.textTheme.labelMedium?.copyWith(
                                    color: isSelected
                                        ? colorScheme.onPrimary
                                        : colorScheme.onSurfaceVariant,
                                    fontWeight: isSelected
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                ),
                                if (isSelected) ...[
                                  const SizedBox(width: 8),
                                  Container(
                                    width: 6,
                                    height: 6,
                                    decoration: BoxDecoration(
                                      color: colorScheme.secondaryContainer,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Exam & Subject Selector Card
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(16),
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
                                color: colorScheme.primaryContainer.withValues(
                                  alpha: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                Icons.menu_book,
                                color: colorScheme.primary,
                                size: 20,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Mathematics',
                                      style: theme.textTheme.titleMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    const SizedBox(width: 4),
                                    Icon(
                                      Icons.expand_more,
                                      size: 16,
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                  ],
                                ),
                                Text(
                                  'Mid-Term Exam 2026',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'MAX MARKS',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                                fontSize: 9,
                                letterSpacing: 1.1,
                              ),
                            ),
                            Text(
                              '50',
                              style: theme.textTheme.headlineSmall?.copyWith(
                                color: colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Submission & Live Auto-Save Pill
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: colorScheme.secondaryContainer,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  size: 14,
                                  color: colorScheme.onSecondaryContainer,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '28/32 Entered',
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: colorScheme.onSecondaryContainer,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Row(
                            children: [
                              Icon(
                                Icons.cloud_done,
                                size: 14,
                                color: colorScheme.onSurfaceVariant,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Auto-saved 11:20 AM',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
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
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.bolt,
                              size: 14,
                              color: colorScheme.primary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Quick Fill',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Section Header & Micro Analytics Strip
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Student Score Sheet',
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
                        color: colorScheme.surfaceContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '32 Students',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Sorted by Roll No',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.swap_vert,
                      size: 16,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            // List Header Legend
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      'ROLL & STUDENT',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Text(
                        'SCORE (/50)',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'GRADE',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),

            // Marks Entry List
            ..._students.map(
              (student) => _buildStudentRow(
                student['roll'] as String,
                student['name'] as String,
                student['reg'] as String,
                student['score'] as String,
                student['grade'] as String,
                student['isAbsent'] as bool,
                theme,
                colorScheme,
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildStudentRow(
    String roll,
    String name,
    String reg,
    String score,
    String grade,
    bool isAbsent,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 4),
        ],
      ),
      child: Row(
        children: [
          // Roll & Student
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainer,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      roll,
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        reg,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Score & AB button
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: isAbsent
                          ? colorScheme.errorContainer
                          : colorScheme.surfaceContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'AB',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: isAbsent
                            ? colorScheme.onErrorContainer
                            : colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 24,
                        child: Text(
                          isAbsent ? '--' : score,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: isAbsent
                                ? colorScheme.onSurfaceVariant
                                : colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        '/50',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Grade
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isAbsent
                      ? colorScheme.errorContainer
                      : (grade.startsWith('A')
                            ? colorScheme.primaryContainer
                            : colorScheme.surfaceContainerHigh),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  isAbsent ? 'F' : grade,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: isAbsent
                        ? colorScheme.error
                        : (grade.startsWith('A')
                              ? colorScheme.primary
                              : colorScheme.onSurfaceVariant),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
