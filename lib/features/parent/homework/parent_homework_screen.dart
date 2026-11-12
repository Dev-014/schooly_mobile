import 'package:flutter/material.dart';

class ParentHomeworkScreen extends StatefulWidget {
  const ParentHomeworkScreen({super.key});

  @override
  State<ParentHomeworkScreen> createState() => _ParentHomeworkScreenState();
}

class _ParentHomeworkScreenState extends State<ParentHomeworkScreen> {
  String _selectedFilter = 'pending';

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
                Icons.menu_book,
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
                  'Academics & Homework',
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
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
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

            // 2. Summary Chart
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: colorScheme.surfaceContainer),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 48,
                          height: 48,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CircularProgressIndicator(
                                value: 1.0,
                                strokeWidth: 5,
                                color: colorScheme.surfaceContainerHigh,
                              ),
                              CircularProgressIndicator(
                                value: 10 / 12,
                                strokeWidth: 5,
                                color: colorScheme.secondary,
                                strokeCap: StrokeCap.round,
                              ),
                              Text(
                                '83%',
                                style: theme.textTheme.labelSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Homework Rate',
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'This week • 12 Tasks Total',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        _buildSummaryStat('2', 'Pending', theme, colorScheme),
                        const SizedBox(width: 12),
                        Container(
                          width: 1,
                          height: 24,
                          color: colorScheme.outlineVariant.withValues(
                            alpha: 0.5,
                          ),
                        ),
                        const SizedBox(width: 12),
                        _buildSummaryStat(
                          '10',
                          'Completed',
                          theme,
                          colorScheme,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // 3. Filters
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  _buildFilterTab(
                    'pending',
                    'Pending (2)',
                    colorScheme.error,
                    _selectedFilter == 'pending',
                    colorScheme,
                    theme,
                  ),
                  const SizedBox(width: 8),
                  _buildFilterTab(
                    'completed',
                    'Completed (10)',
                    colorScheme.secondary,
                    _selectedFilter == 'completed',
                    colorScheme,
                    theme,
                  ),
                  const SizedBox(width: 8),
                  _buildFilterTab(
                    'all',
                    'All (12)',
                    null,
                    _selectedFilter == 'all',
                    colorScheme,
                    theme,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // 4. Homework Cards
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  if (_selectedFilter == 'pending' ||
                      _selectedFilter == 'all') ...[
                    _buildPendingCard(
                      'Mathematics',
                      'Linear Equations Ex 4.2',
                      'Mrs. R. Gupta',
                      'Due Tomorrow',
                      Icons.calculate,
                      colorScheme,
                      theme,
                    ),
                    const SizedBox(height: 12),
                    _buildPendingCard(
                      'Science',
                      'Plant Cell Structure & Q&A',
                      'Mr. V. Nair',
                      'Due Friday',
                      Icons.science,
                      colorScheme,
                      theme,
                    ),
                    const SizedBox(height: 12),
                  ],
                  if (_selectedFilter == 'completed' ||
                      _selectedFilter == 'all') ...[
                    _buildCompletedCard(
                      'English Literature',
                      'Ch 5 Reading & Summary',
                      'Submitted • Verified by teacher',
                      colorScheme,
                      theme,
                    ),
                    const SizedBox(height: 12),
                    _buildCompletedCard(
                      'Social Studies',
                      'Map Work: River Basins',
                      'Submitted 22 Sep',
                      colorScheme,
                      theme,
                    ),
                    const SizedBox(height: 12),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 24),

            // 5. Download Summary
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.download, size: 20),
                label: const Text(
                  'Download Monthly Summary (PDF)',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.surfaceContainerLowest,
                  foregroundColor: colorScheme.primary,
                  side: BorderSide(
                    color: colorScheme.primary.withValues(alpha: 0.2),
                  ),
                  minimumSize: const Size(double.infinity, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                  elevation: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryStat(
    String value,
    String label,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Column(
      children: [
        Text(
          value,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildFilterTab(
    String id,
    String label,
    Color? dotColor,
    bool isSelected,
    ColorScheme colorScheme,
    ThemeData theme,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() => _selectedFilter = id);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.primary
              : colorScheme.surfaceContainer,
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
            if (dotColor != null) ...[
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: isSelected ? colorScheme.onPrimary : dotColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
            ],
            Text(
              label,
              style: theme.textTheme.labelMedium?.copyWith(
                color: isSelected
                    ? colorScheme.onPrimary
                    : colorScheme.onSurfaceVariant,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPendingCard(
    String subject,
    String title,
    String teacher,
    String due,
    IconData icon,
    ColorScheme colorScheme,
    ThemeData theme,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.surfaceContainer.withValues(alpha: 0.6),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer.withValues(alpha: 0.5),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: colorScheme.primary, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subject.toUpperCase(),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  teacher,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: colorScheme.tertiaryContainer.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.schedule,
                  size: 14,
                  color: colorScheme.onTertiaryContainer,
                ),
                const SizedBox(width: 4),
                Text(
                  due,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.onTertiaryContainer,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompletedCard(
    String subject,
    String title,
    String subtitle,
    ColorScheme colorScheme,
    ThemeData theme,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.surfaceContainer.withValues(alpha: 0.4),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: colorScheme.secondaryContainer.withValues(alpha: 0.4),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.check_circle,
              color: colorScheme.secondary,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subject.toUpperCase(),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.secondary,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
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
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: colorScheme.secondaryContainer.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Completed',
              style: theme.textTheme.labelSmall?.copyWith(
                color: colorScheme.onSecondaryContainer,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
