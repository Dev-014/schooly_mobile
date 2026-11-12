import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class ParentExamsScreen extends StatelessWidget {
  const ParentExamsScreen({super.key});

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
            Image.network(
              'https://lh3.googleusercontent.com/aida/AEtjO1VhmYOOgfjA8H4EWrvi20LrXSc2KriGgLNrcG8lnpaje84tI8QE36rdXfvRWvEgxrrNQv27CuyUp1XlHwhUY7FlWhfs6L6VCzJF1jH4HPltVZkGtOrnuQij9ZcuZapCQNVPEWtmZrySiZDZxYqhJX7Ibt6wyJHlGS1YG1M2qegNL5oXVkKDkzXx1dmmv2NnRr5fHnp9bR164btk2sUnIiUvpKPy72ljU4rY7fxFz4jNdy3mxheX9z6305R9',
              height: 32,
              errorBuilder: (context, error, stackTrace) => Container(
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
            ),
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: colorScheme.surfaceContainerHighest),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.face,
                      size: 14,
                      color: colorScheme.onPrimary,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Arun (7-A)',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.face_3,
                    size: 14,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Priya (4-B)',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Stack(
              children: [
                Icon(
                  Icons.notifications_none,
                  color: colorScheme.onSurfaceVariant,
                ),
                Positioned(
                  right: 2,
                  top: 2,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: colorScheme.error,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: colorScheme.surface,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {},
          ),
          Container(
            margin: const EdgeInsets.only(right: 16, left: 4),
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: colorScheme.primary,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.person, color: colorScheme.onPrimary, size: 18),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 120), // Bottom navigation bar
        child: Column(
          children: [
            // Term Selection Bar
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
              child: Row(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _TermChip(
                            label: 'Term 1 Final (2026)',
                            isSelected: true,
                            icon: Icons.verified,
                          ),
                          const SizedBox(width: 8),
                          _TermChip(label: 'Unit Test 2', isSelected: false),
                          const SizedBox(width: 8),
                          _TermChip(label: 'Unit Test 1', isSelected: false),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFCCE5FF), // primary-fixed
                      foregroundColor: const Color(
                        0xFF001D31,
                      ), // on-primary-fixed
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      minimumSize: Size.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    icon: const Icon(Icons.picture_as_pdf, size: 16),
                    label: const Text(
                      'PDF',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Compact Summary Score Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                margin: const EdgeInsets.only(top: 4),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: colorScheme.surfaceContainer),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'OVERALL RESULT',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                                letterSpacing: 1.2,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  '89.4%',
                                  style: theme.textTheme.headlineMedium
                                      ?.copyWith(
                                        color: colorScheme.primary,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: -1.0,
                                      ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  width: 28,
                                  height: 28,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFCCE5FF), // primary-fixed
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'A',
                                    style: TextStyle(
                                      color: Color(0xFF001D31),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(
                                  0xFF7CF994,
                                ), // secondary-container
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                'Passed with Distinction',
                                style: TextStyle(
                                  color: Color(0xFF007230),
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.military_tech,
                                  size: 15,
                                  color: Color(0xFFA33900),
                                ), // tertiary
                                const SizedBox(width: 4),
                                RichText(
                                  text: TextSpan(
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                    children: [
                                      const TextSpan(text: 'Rank '),
                                      TextSpan(
                                        text: '4th',
                                        style: theme.textTheme.titleSmall
                                            ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: colorScheme.onSurface,
                                            ),
                                      ),
                                      const TextSpan(text: ' in 7-A'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Divider(height: 1),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: _SummaryStat(
                            title: 'Total Marks',
                            value: '447',
                            suffix: '/500',
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: _SummaryStat(
                            title: 'Class Average',
                            value: '74.2%',
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: _SummaryStat(
                            title: 'Attendance',
                            value: '97.8%',
                            valueColor: const Color(0xFF006E2D), // secondary
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Subject Marks Table
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Subject Marks',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Max Marks: 100',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: colorScheme.surfaceContainer),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.02),
                          blurRadius: 4,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _SubjectRow(
                          icon: Icons.calculate,
                          iconColor: colorScheme.primary,
                          iconBg: const Color(0xFFCCE5FF), // primary-fixed
                          subject: 'Mathematics',
                          highest: '98',
                          score: '96',
                          grade: 'A+',
                          gradeColor: const Color(
                            0xFF007230,
                          ), // on-secondary-container
                          gradeBg: const Color(
                            0xFF7CF994,
                          ), // secondary-container
                        ),
                        const Divider(height: 1),
                        _SubjectRow(
                          icon: Icons.biotech,
                          iconColor: const Color(0xFF006E2D), // secondary
                          iconBg: const Color(
                            0xFF7CF994,
                          ).withValues(alpha: 0.5), // secondary-container
                          subject: 'Science',
                          highest: '95',
                          score: '92',
                          grade: 'A+',
                          gradeColor: const Color(0xFF007230),
                          gradeBg: const Color(0xFF7CF994),
                        ),
                        const Divider(height: 1),
                        _SubjectRow(
                          icon: Icons.public,
                          iconColor: colorScheme.primary,
                          iconBg: colorScheme.surfaceContainer,
                          subject: 'Social Studies',
                          highest: '94',
                          score: '88',
                          grade: 'A',
                          gradeColor: colorScheme.primary,
                          gradeBg: colorScheme.surfaceContainer,
                        ),
                        const Divider(height: 1),
                        _SubjectRow(
                          icon: Icons.translate,
                          iconColor: colorScheme.onSurfaceVariant,
                          iconBg: colorScheme.surfaceContainer,
                          subject: 'Hindi / 2nd Lang',
                          highest: '91',
                          score: '87',
                          grade: 'A',
                          gradeColor: colorScheme.primary,
                          gradeBg: colorScheme.surfaceContainer,
                        ),
                        const Divider(height: 1),
                        _SubjectRow(
                          icon: Icons.menu_book,
                          iconColor: const Color(0xFFA33900), // tertiary
                          iconBg: const Color(0xFFFFDBCE), // tertiary-fixed
                          subject: 'English',
                          highest: '92',
                          score: '84',
                          grade: 'A',
                          gradeColor: colorScheme.primary,
                          gradeBg: colorScheme.surfaceContainer,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Prominent Action Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
                      elevation: 4,
                      shadowColor: colorScheme.primary.withValues(alpha: 0.4),
                      minimumSize: const Size(double.infinity, 52),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26),
                      ),
                    ),
                    icon: const Icon(Icons.download, size: 20),
                    label: const Text(
                      'Download Official Report Card (PDF)',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: colorScheme.onSurface,
                      elevation: 0,
                      side: BorderSide(color: colorScheme.surfaceContainer),
                      minimumSize: const Size(double.infinity, 44),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                    icon: Icon(
                      Icons.chat,
                      size: 18,
                      color: colorScheme.primary,
                    ),
                    label: const Text(
                      'Message Teacher',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
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
}

class _TermChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final IconData? icon;

  const _TermChip({required this.label, required this.isSelected, this.icon});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? colorScheme.primary : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: isSelected
            ? null
            : Border.all(color: colorScheme.surfaceContainer),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ]
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: 16,
              color: isSelected
                  ? colorScheme.onPrimary
                  : colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: 6),
          ],
          Text(
            label,
            style: TextStyle(
              color: isSelected
                  ? colorScheme.onPrimary
                  : colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryStat extends StatelessWidget {
  final String title;
  final String value;
  final String? suffix;
  final Color? valueColor;

  const _SummaryStat({
    required this.title,
    required this.value,
    this.suffix,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F3FF), // surface-container-low
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 11, color: colorScheme.onSurfaceVariant),
          ),
          const SizedBox(height: 2),
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: valueColor ?? colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(text: value),
                if (suffix != null)
                  TextSpan(
                    text: suffix,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SubjectRow extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final String subject;
  final String highest;
  final String score;
  final String grade;
  final Color gradeColor;
  final Color gradeBg;

  const _SubjectRow({
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    required this.subject,
    required this.highest,
    required this.score,
    required this.grade,
    required this.gradeColor,
    required this.gradeBg,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.all(14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: iconBg,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: 18),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subject,
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Highest: $highest',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  RichText(
                    text: TextSpan(
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(text: score),
                        TextSpan(
                          text: '/100',
                          style: TextStyle(
                            fontSize: 12,
                            color: colorScheme.onSurfaceVariant,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Container(
                width: 32,
                padding: const EdgeInsets.symmetric(vertical: 2),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: gradeBg,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  grade,
                  style: TextStyle(
                    color: gradeColor,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
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
