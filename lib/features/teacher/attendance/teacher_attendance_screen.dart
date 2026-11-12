import 'package:flutter/material.dart';

class TeacherAttendanceScreen extends StatefulWidget {
  const TeacherAttendanceScreen({super.key});

  @override
  State<TeacherAttendanceScreen> createState() =>
      _TeacherAttendanceScreenState();
}

class _TeacherAttendanceScreenState extends State<TeacherAttendanceScreen> {
  int _viewMode = 0; // 0: Grid (Fast), 1: Absent-Only, 2: List Roster

  // Mock data for grid. 0: Present, 1: Absent, 2: Leave
  final List<int> _attendanceState = List.generate(36, (index) {
    if (index == 2 || index == 8) return 1; // #03 Farhan, #09 Riya -> Absent
    if (index == 3) return 2; // #04 Ishaan -> Leave
    return 0; // Present
  });

  final List<String> _names = [
    'Aarav',
    'Aditi',
    'Farhan',
    'Ishaan',
    'Meera',
    'Vihaan',
    'Ananya',
    'Rohan',
    'Riya',
    'Arjun',
    'Diya',
    'Kabir',
    'Neha',
    'Aryan',
    'Kriti',
    'Vivaan',
    'Sai',
    'Mira',
    'Yash',
    'Shaurya',
    'Kavya',
    'Ayush',
    'Tara',
    'Reyansh',
    'Anvi',
    'Atharv',
    'Sara',
    'Kunal',
    'Pari',
    'Dhruv',
    'Zoya',
    'Manav',
    'Ira',
    'Pranav',
    'Rhea',
    'Siddharth',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    int presentCount = _attendanceState.where((s) => s == 0).length;
    int absentCount = _attendanceState.where((s) => s == 1).length;
    int leaveCount = _attendanceState.where((s) => s == 2).length;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        scrolledUnderElevation: 1,
        title: const Text(
          'Roll Call',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Top Header Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: colorScheme.surfaceContainer),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.02),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Class 8-B',
                                style: theme.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: colorScheme.primaryContainer,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: colorScheme.outlineVariant
                                        .withValues(alpha: 0.5),
                                  ),
                                ),
                                child: Text(
                                  'Mathematics',
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Thursday, 24 Sep • Period 4 • Room 204',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.check_circle,
                              size: 16,
                              color: Colors.green,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '36 Enrolled',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildClassPill(
                          '8-A (Done)',
                          Icons.check,
                          Colors.green,
                          false,
                          colorScheme,
                        ),
                        _buildClassPill(
                          '8-B (Active)',
                          Icons.circle,
                          colorScheme.primary,
                          true,
                          colorScheme,
                        ),
                        _buildClassPill(
                          '9-A (Pending)',
                          Icons.schedule,
                          colorScheme.onSurfaceVariant,
                          false,
                          colorScheme,
                        ),
                        _buildClassPill(
                          '9-B (Pending)',
                          Icons.schedule,
                          colorScheme.onSurfaceVariant,
                          false,
                          colorScheme,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Mode Switcher
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  _buildModeTab(
                    0,
                    'Grid (Fast)',
                    Icons.grid_view,
                    colorScheme,
                    theme,
                  ),
                  _buildModeTab(
                    1,
                    'Absent-Only',
                    Icons.bolt,
                    colorScheme,
                    theme,
                  ),
                  _buildModeTab(
                    2,
                    'List Roster',
                    Icons.format_list_bulleted,
                    colorScheme,
                    theme,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Rapid Action Bar
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.done_all, size: 16),
                    label: const Text('Mark All Present'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 2,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.clear_all, size: 16),
                  label: const Text('Clear'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.errorContainer,
                    foregroundColor: colorScheme.onErrorContainer,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.9,
              ),
              itemCount: 36,
              itemBuilder: (context, index) {
                final state = _attendanceState[index];
                Color bgColor;
                if (state == 0) {
                  bgColor = Colors.green.shade700;
                } else if (state == 1) {
                  bgColor = Colors.red.shade600;
                } else {
                  bgColor = Colors.orange.shade700;
                }

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _attendanceState[index] = (state + 1) % 3;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: bgColor.withValues(alpha: 0.3),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${index + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          _names[index],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),

            // Exceptions Bar
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: colorScheme.surfaceContainer),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.02),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Text(
                    'Marked Off:',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildExceptionChip(
                            '#03 Farhan',
                            Icons.close,
                            Colors.red,
                          ),
                          const SizedBox(width: 6),
                          _buildExceptionChip(
                            '#09 Riya',
                            Icons.close,
                            Colors.red,
                          ),
                          const SizedBox(width: 6),
                          _buildExceptionChip(
                            '#04 Ishaan',
                            Icons.medical_services,
                            Colors.orange,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '3 of 36',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Submission Banner
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: colorScheme.surfaceContainer),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.02),
                    blurRadius: 4,
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
                          const Icon(
                            Icons.verified,
                            color: Colors.green,
                            size: 22,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'All 36 Students Accounted For',
                            style: theme.textTheme.labelMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '$presentCount P • $absentCount A • $leaveCount L',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.send, size: 18),
                    label: const Text('Submit Attendance (Class 8-B)'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      minimumSize: const Size(double.infinity, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      elevation: 4,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.schedule,
                        size: 14,
                        color: colorScheme.onSurfaceVariant.withValues(
                          alpha: 0.7,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Editable until 5:00 PM today',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant.withValues(
                            alpha: 0.7,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Widget _buildClassPill(
    String text,
    IconData icon,
    Color color,
    bool isActive,
    ColorScheme colorScheme,
  ) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: isActive ? colorScheme.primary : colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(20),
          border: isActive
              ? Border.all(color: colorScheme.primaryContainer, width: 2)
              : null,
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: colorScheme.primary.withValues(alpha: 0.3),
                    blurRadius: 6,
                  ),
                ]
              : null,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 12,
              color: isActive ? colorScheme.onPrimary : color,
            ),
            const SizedBox(width: 6),
            Text(
              text,
              style: TextStyle(
                color: isActive
                    ? colorScheme.onPrimary
                    : colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModeTab(
    int index,
    String title,
    IconData icon,
    ColorScheme colorScheme,
    ThemeData theme,
  ) {
    bool isSelected = _viewMode == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _viewMode = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? colorScheme.surface : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            boxShadow: isSelected
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
                icon,
                size: 16,
                color: isSelected
                    ? colorScheme.primary
                    : colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: 6),
              Text(
                title,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: isSelected
                      ? colorScheme.primary
                      : colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExceptionChip(String text, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
