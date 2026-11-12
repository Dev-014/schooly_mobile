import 'package:flutter/material.dart';

class AdminStudentReportsScreen extends StatefulWidget {
  const AdminStudentReportsScreen({super.key});

  @override
  State<AdminStudentReportsScreen> createState() =>
      _AdminStudentReportsScreenState();
}

class _AdminStudentReportsScreenState extends State<AdminStudentReportsScreen> {
  int _selectedReportType = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Stack(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: 80,
          ), // Padding for sticky bottom
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Section Context
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Whole-School Student Reports',
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Generate, filter, and export consolidated student records.',
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
                      color: colorScheme.surfaceContainerHigh,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.verified,
                          size: 14,
                          color: colorScheme.primary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'AY 2025-26',
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

              const SizedBox(height: 20),

              // Report Type Carousel / Horizontal Grid
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildReportTypeChip(
                      'Academic Card',
                      0,
                      colorScheme,
                      theme,
                    ),
                    _buildReportTypeChip(
                      'Attendance Report',
                      1,
                      colorScheme,
                      theme,
                    ),
                    _buildReportTypeChip('Fee Report', 2, colorScheme, theme),
                    _buildReportTypeChip(
                      'Performance Analysis',
                      3,
                      colorScheme,
                      theme,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Filter & Selection Bar
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerLowest,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search student name or roll no...',
                          hintStyle: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant.withValues(
                              alpha: 0.7,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            size: 20,
                            color: colorScheme.primary,
                          ),
                          suffixIcon: Icon(
                            Icons.close,
                            size: 16,
                            color: colorScheme.onSurfaceVariant,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 48,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerLowest,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Class 10-A',
                            style: theme.textTheme.labelMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.expand_more,
                            size: 18,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Student Report List Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Student Records',
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
                          color: colorScheme.surfaceContainerHigh,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '42 students',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Class 10-A',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Student Record List Items
              _buildStudentRecordCard(
                'Aarav Patel',
                'Roll 01 • Adm #2026-104',
                'AP',
                Colors.blue,
                colorScheme,
                theme,
              ),
              _buildStudentRecordCard(
                'Ananya Iyer',
                'Roll 02 • Adm #2026-108',
                'AI',
                Colors.pink,
                colorScheme,
                theme,
              ),
              _buildStudentRecordCard(
                'Kabir Malhotra',
                'Roll 03 • Adm #2026-115',
                'KM',
                Colors.orange,
                colorScheme,
                theme,
              ),
              _buildStudentRecordCard(
                'Sneha Sharma',
                'Roll 04 • Adm #2026-121',
                'SS',
                Colors.green,
                colorScheme,
                theme,
              ),
              _buildStudentRecordCard(
                'Rohan Varma',
                'Roll 05 • Adm #2026-128',
                'RV',
                Colors.purple,
                colorScheme,
                theme,
              ),
            ],
          ),
        ),

        // Sticky Bottom Bulk Export Pill Action Bar
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.picture_as_pdf, size: 20),
            label: const Text('Export All Reports (PDF)'),
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
              elevation: 4,
              shadowColor: colorScheme.primary.withValues(alpha: 0.5),
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              textStyle: theme.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReportTypeChip(
    String label,
    int index,
    ColorScheme colorScheme,
    ThemeData theme,
  ) {
    final isSelected = _selectedReportType == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedReportType = index),
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.primary
              : colorScheme.surfaceContainerLow,
          borderRadius: BorderRadius.circular(24),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: colorScheme.primary.withValues(alpha: 0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Text(
          label,
          style: theme.textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: isSelected
                ? colorScheme.onPrimary
                : colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }

  Widget _buildStudentRecordCard(
    String name,
    String subtitle,
    String initials,
    Color avatarColor,
    ColorScheme colorScheme,
    ThemeData theme,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: avatarColor.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                initials,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: avatarColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLow,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.download, size: 18, color: colorScheme.primary),
          ),
        ],
      ),
    );
  }
}
