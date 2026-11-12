import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class ParentTimetableScreen extends StatelessWidget {
  const ParentTimetableScreen({super.key});

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
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: colorScheme.primary,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.primary.withValues(alpha: 0.2),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Icon(Icons.school, color: colorScheme.onPrimary, size: 20),
            ),
            const SizedBox(width: 8),
            Text(
              'Schooly',
              style: theme.textTheme.titleMedium?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.5,
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFF2F3FF), // surface-container-low
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white, // surface-container-lowest
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(
                            0xFF006194,
                          ).withValues(alpha: 0.12),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.face, size: 16, color: colorScheme.primary),
                        const SizedBox(width: 4),
                        Text(
                          'Arun 7-A',
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 2),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.sentiment_satisfied,
                          size: 16,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Priya 4-B',
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: colorScheme.primary,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.person, color: colorScheme.onPrimary, size: 16),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100),
        child: Column(
          children: [
            // Class & Schedule Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Class Timetable',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      Text(
                        'Class 7-A • Academic Year 2024–25',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.04),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.download,
                          size: 16,
                          color: colorScheme.primary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Download PDF',
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // View Switcher
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 4,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _DayTab(
                        label: 'Weekly Matrix',
                        isSelected: false,
                        isPrimary: true,
                      ),
                      _DayTab(label: 'Mon', isSelected: false),
                      _DayTab(label: 'Tue', isSelected: false),
                      _DayTab(label: 'Wed (Today)', isSelected: true),
                      _DayTab(label: 'Thu', isSelected: false),
                      _DayTab(label: 'Fri', isSelected: false),
                      _DayTab(label: 'Sat', isSelected: false),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Class Teacher & Room Meta Strip
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F3FF), // surface-container-low
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: colorScheme.surfaceContainerHighest.withValues(
                      alpha: 0.6,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.badge, size: 18, color: colorScheme.primary),
                        const SizedBox(width: 8),
                        RichText(
                          text: TextSpan(
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: colorScheme.onSurface,
                            ),
                            children: const [
                              TextSpan(text: 'Class Teacher: '),
                              TextSpan(
                                text: 'Mrs. A. Sharma',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.04),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Text(
                        'Room 204',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Traditional Timetable Grid Chart
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: colorScheme.surfaceContainerHighest.withValues(
                      alpha: 0.6,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 8,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Table(
                        columnWidths: const {
                          0: FixedColumnWidth(90),
                          1: FixedColumnWidth(90),
                          2: FixedColumnWidth(90),
                          3: FixedColumnWidth(90),
                          4: FixedColumnWidth(90),
                          5: FixedColumnWidth(90),
                          6: FixedColumnWidth(90),
                        },
                        border: TableBorder(
                          horizontalInside: BorderSide(
                            color: colorScheme.surfaceContainer,
                          ),
                          verticalInside: BorderSide.none,
                        ),
                        children: [
                          _buildHeaderRow(theme, colorScheme),
                          _buildPeriodRow('P1', '08:30-09:15', [
                            _cMath(),
                            _cEng(),
                            _cSci(true),
                            _cHin(),
                            _cMath(),
                            _cAct(),
                          ]),
                          _buildPeriodRow('P2', '09:15-10:00', [
                            _cEng(),
                            _cMath(),
                            _cSoc(true),
                            _cSci(),
                            _cEng(),
                            _cSpo(),
                          ]),
                          _buildPeriodRow('P3', '10:00-10:45', [
                            _cSci(),
                            _cHin(),
                            _cMath(true),
                            _cEng(),
                            _cCom(),
                            _cLib(),
                          ]),
                          _buildBreakRow(),
                          _buildPeriodRow('P4', '11:20-12:05', [
                            _cHin(),
                            _cSci(),
                            _cHin(true),
                            _cSoc(),
                            _cSci(),
                            _cArt(),
                          ]),
                          _buildPeriodRow('P5', '12:05-12:50', [
                            _cSoc(),
                            _cCom(),
                            _cSoc(true),
                            _cMath(),
                            _cHin(),
                            _cMus(),
                          ]),
                          _buildPeriodRow('P6', '12:50-01:30', [
                            _cArtC(),
                            _cGam(),
                            _cArtC(true),
                            _cVal(),
                            _cSoc(),
                            _cClu(),
                          ]),
                        ],
                      ),
                    ),

                    // Legend
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2F3FF),
                        border: Border(
                          top: BorderSide(
                            color: colorScheme.surfaceContainerHighest,
                          ),
                        ),
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(16),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              _LegendItem(
                                color: colorScheme.primary,
                                label: 'Active Day (Wed)',
                              ),
                              const SizedBox(width: 8),
                              _LegendItem(
                                color: const Color(0xFF006E2D),
                                label: 'Labs / Activity',
                              ),
                              const SizedBox(width: 8),
                              _LegendItem(
                                color: const Color(0xFFA33900),
                                label: 'Languages',
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.swipe,
                                size: 14,
                                color: colorScheme.primary,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Scroll table sideways',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Bottom Action
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                  elevation: 2,
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                icon: const Icon(Icons.download, size: 20),
                label: const Text(
                  'Download PDF Timetable (Weekly Grid)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TableRow _buildHeaderRow(ThemeData theme, ColorScheme colorScheme) {
    return TableRow(
      decoration: BoxDecoration(color: colorScheme.surfaceContainer),
      children: [
        _HeaderCell(label: 'Period', isFirst: true),
        _HeaderCell(label: 'Mon'),
        _HeaderCell(label: 'Tue'),
        _HeaderCell(label: 'Wed ★', isActive: true),
        _HeaderCell(label: 'Thu'),
        _HeaderCell(label: 'Fri'),
        _HeaderCell(label: 'Sat'),
      ],
    );
  }

  TableRow _buildPeriodRow(String title, String time, List<Widget> classes) {
    return TableRow(
      children: [
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.fill,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                right: BorderSide(color: Color(0xFFE2E7FF)),
              ), // surface-container-high
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF006194),
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
                Text(
                  time,
                  style: const TextStyle(
                    color: Color(0xFF3F4850),
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
        ...classes.map(
          (c) => Padding(padding: const EdgeInsets.all(6), child: c),
        ),
      ],
    );
  }

  TableRow _buildBreakRow() {
    return TableRow(
      decoration: const BoxDecoration(
        color: Color(0x4DFFDBCE), // tertiary-fixed/30
      ),
      children: [
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.fill,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: const BoxDecoration(
              color: Color(0x66FFDBCE), // tertiary-fixed/40
              border: Border(right: BorderSide(color: Color(0x33A33900))),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.restaurant,
                      size: 12,
                      color: Color(0xFFA33900),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'Break',
                      style: TextStyle(
                        color: Color(0xFFA33900),
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Text(
                  '10:45-11:20',
                  style: TextStyle(color: Color(0xFF3F4850), fontSize: 10),
                ),
              ],
            ),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.fill,
          child: Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.lunch_dining,
                  size: 16,
                  color: Color(0xFFA33900),
                ),
                const SizedBox(width: 6),
                const Text(
                  'Recess & Mid-Day Lunch Break (35 mins)',
                  style: TextStyle(
                    color: Color(0xFFA33900),
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(),
        const SizedBox(),
        const SizedBox(),
        const SizedBox(),
        const SizedBox(),
      ],
    );
  }

  // Cell Builders
  Widget _cMath([bool isActive = false]) => _ClassCell(
    subject: 'Math',
    teacher: 'R. Verma',
    textColor: const Color(0xFF006194),
    bgColor: const Color(0x66CCE5FF),
    isActive: isActive,
  );

  Widget _cEng() => _ClassCell(
    subject: 'English',
    teacher: 'A. Sharma',
    textColor: const Color(0xFF131B2E),
    bgColor: const Color(0xFFEAEDFF),
  );

  Widget _cSci([bool isActive = false]) => _ClassCell(
    subject: 'Science',
    teacher: 'K. Iyer',
    textColor: const Color(0xFF006194),
    bgColor: const Color(0xFFDAE2FD),
    isActive: isActive,
  );

  Widget _cHin([bool isActive = false]) => _ClassCell(
    subject: 'Hindi',
    teacher: 'S. Gupta',
    textColor: const Color(0xFFA33900),
    bgColor: const Color(0x66FFDBCE),
    isActive: isActive,
  );

  Widget _cSoc([bool isActive = false]) => _ClassCell(
    subject: 'Social St.',
    teacher: 'Mukherjee',
    textColor: const Color(0xFF006194),
    bgColor: const Color(0xFFEAEDFF),
    isActive: isActive,
  );

  Widget _cCom() => _ClassCell(
    subject: 'Computer',
    teacher: 'Lab 1',
    textColor: const Color(0xFF131B2E),
    bgColor: const Color(0xFFDAE2FD),
  );

  Widget _cLib() => _ClassCell(
    subject: 'Library',
    teacher: 'Reading',
    textColor: const Color(0xFF131B2E),
    bgColor: const Color(0xFFEAEDFF),
  );

  Widget _cAct() => _ClassCell(
    subject: 'Activity',
    teacher: 'P. Roy',
    textColor: const Color(0xFF006E2D),
    bgColor: const Color(0x667CF994),
  );

  Widget _cSpo() => _ClassCell(
    subject: 'Sports',
    teacher: 'Coach D.',
    textColor: const Color(0xFF006E2D),
    bgColor: const Color(0x667CF994),
  );

  Widget _cArt() => _ClassCell(
    subject: 'Art',
    teacher: 'P. Roy',
    textColor: const Color(0xFF006E2D),
    bgColor: const Color(0x667CF994),
  );

  Widget _cMus() => _ClassCell(
    subject: 'Music',
    teacher: 'Choir',
    textColor: const Color(0xFF006E2D),
    bgColor: const Color(0x667CF994),
  );

  Widget _cArtC([bool isActive = false]) => _ClassCell(
    subject: 'Art & Craft',
    teacher: 'P. Roy',
    textColor: const Color(0xFF131B2E),
    bgColor: const Color(0x667CF994),
    isActive: isActive,
  );

  Widget _cGam() => _ClassCell(
    subject: 'Games',
    teacher: 'Ground',
    textColor: const Color(0xFF131B2E),
    bgColor: const Color(0x667CF994),
  );

  Widget _cVal() => _ClassCell(
    subject: 'Value Ed',
    teacher: 'Fr. Luke',
    textColor: const Color(0xFF131B2E),
    bgColor: const Color(0xFFEAEDFF),
  );

  Widget _cClu() => _ClassCell(
    subject: 'Club',
    teacher: 'Activities',
    textColor: const Color(0xFF131B2E),
    bgColor: const Color(0xFFEAEDFF),
  );
}

class _HeaderCell extends StatelessWidget {
  final String label;
  final bool isActive;
  final bool isFirst;

  const _HeaderCell({
    required this.label,
    this.isActive = false,
    this.isFirst = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
        color: isActive ? colorScheme.primary : colorScheme.surfaceContainer,
        border: isFirst
            ? Border(right: BorderSide(color: colorScheme.surfaceContainerHigh))
            : null,
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: isActive
              ? colorScheme.onPrimary
              : (isFirst
                    ? colorScheme.onSurfaceVariant
                    : colorScheme.onSurface),
          letterSpacing: isFirst ? 1.0 : 0,
        ),
      ),
    );
  }
}

class _ClassCell extends StatelessWidget {
  final String subject;
  final String teacher;
  final Color textColor;
  final Color bgColor;
  final bool isActive;

  const _ClassCell({
    required this.subject,
    required this.teacher,
    required this.textColor,
    required this.bgColor,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isActive ? const EdgeInsets.all(2) : EdgeInsets.zero,
      decoration: isActive
          ? BoxDecoration(
              color: const Color(0x33CCE5FF),
              borderRadius: BorderRadius.circular(10),
            ) // primary-fixed/20
          : null,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
          border: isActive
              ? Border.all(color: const Color(0x33006194))
              : null, // primary/20
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              subject,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              teacher,
              style: const TextStyle(color: Color(0xFF3F4850), fontSize: 10),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _DayTab extends StatelessWidget {
  final String label;
  final bool isSelected;
  final bool isPrimary;

  const _DayTab({
    required this.label,
    required this.isSelected,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected
            ? const Color(0x80CCE5FF) // primary-fixed/50
            : (isPrimary ? colorScheme.primary : Colors.transparent),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
          color: isSelected
              ? colorScheme.primary
              : (isPrimary
                    ? colorScheme.onPrimary
                    : colorScheme.onSurfaceVariant),
        ),
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(color: Color(0xFF3F4850), fontSize: 10),
        ),
      ],
    );
  }
}
