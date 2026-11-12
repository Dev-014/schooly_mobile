import 'package:flutter/material.dart';

class TeacherApplyLeaveScreen extends StatefulWidget {
  const TeacherApplyLeaveScreen({super.key});

  @override
  State<TeacherApplyLeaveScreen> createState() =>
      _TeacherApplyLeaveScreenState();
}

class _TeacherApplyLeaveScreenState extends State<TeacherApplyLeaveScreen> {
  int _leaveTypeIndex = 0; // 0: Casual, 1: Sick, 2: Earned
  int _durationIndex = 0; // 0: Full Day, 1: Half Day

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
          'Apply for Leave',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              'AY 2026–27',
              style: theme.textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Polished Balance Cards Bar
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerLow,
                borderRadius: BorderRadius.circular(16),
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
                          Icon(
                            Icons.account_balance_wallet,
                            size: 16,
                            color: colorScheme.primary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Available Leave Balance',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Annual Quota',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.primary,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _buildMiniBalance('Casual', '8', theme, colorScheme),
                      const SizedBox(width: 8),
                      _buildMiniBalance('Sick', '6', theme, colorScheme),
                      const SizedBox(width: 8),
                      _buildMiniBalance('Earned', '12', theme, colorScheme),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Form Container
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: colorScheme.outlineVariant.withValues(alpha: 0.3),
                ),
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.primary.withValues(alpha: 0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Leave Type Selector
                  Text(
                    'Leave Type',
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        _buildSegmentTab(
                          0,
                          'Casual',
                          _leaveTypeIndex,
                          (i) => setState(() => _leaveTypeIndex = i),
                          theme,
                          colorScheme,
                        ),
                        _buildSegmentTab(
                          1,
                          'Sick',
                          _leaveTypeIndex,
                          (i) => setState(() => _leaveTypeIndex = i),
                          theme,
                          colorScheme,
                        ),
                        _buildSegmentTab(
                          2,
                          'Earned',
                          _leaveTypeIndex,
                          (i) => setState(() => _leaveTypeIndex = i),
                          theme,
                          colorScheme,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Duration Segmented
                  Text(
                    'Duration',
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: _buildDurationButton(
                          0,
                          'Full Day',
                          Icons.check_circle,
                          _durationIndex,
                          (i) => setState(() => _durationIndex = i),
                          theme,
                          colorScheme,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _buildDurationButton(
                          1,
                          'Half Day',
                          Icons.timelapse,
                          _durationIndex,
                          (i) => setState(() => _durationIndex = i),
                          theme,
                          colorScheme,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Date Selection
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Start Date',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                            const SizedBox(height: 4),
                            _buildInputBox(
                              '02 Oct 2026',
                              Icons.calendar_month,
                              theme,
                              colorScheme,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'End Date',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                            const SizedBox(height: 4),
                            _buildInputBox(
                              '03 Oct 2026',
                              Icons.event_available,
                              theme,
                              colorScheme,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Proxy Teacher Handover
                  Text(
                    'Proxy Teacher Handover',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.person_search,
                              size: 20,
                              color: colorScheme.primary,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Select Proxy (Optional)',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.chevron_right,
                          size: 20,
                          color: colorScheme.outlineVariant,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Reason for Absence
                  Text(
                    'Reason for absence',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      maxLines: 3,
                      decoration: InputDecoration.collapsed(
                        hintText:
                            'e.g., Attending academic curriculum workshop...',
                        hintStyle: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant.withValues(
                            alpha: 0.6,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Submit Action
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                foregroundColor: colorScheme.onPrimary,
                minimumSize: const Size(double.infinity, 52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(26),
                ),
                elevation: 4,
                textStyle: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text('Submit Leave Request'),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildMiniBalance(
    String title,
    String value,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.02),
              blurRadius: 2,
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              title,
              style: theme.textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontSize: 10,
              ),
            ),
            Text(
              value,
              style: theme.textTheme.titleMedium?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSegmentTab(
    int index,
    String title,
    int selectedIndex,
    ValueChanged<int> onSelect,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    bool isSelected = index == selectedIndex;
    return Expanded(
      child: GestureDetector(
        onTap: () => onSelect(index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? colorScheme.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: colorScheme.primary.withValues(alpha: 0.2),
                      blurRadius: 4,
                    ),
                  ]
                : null,
          ),
          child: Center(
            child: Text(
              title,
              style: theme.textTheme.labelMedium?.copyWith(
                color: isSelected
                    ? colorScheme.onPrimary
                    : colorScheme.onSurfaceVariant,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDurationButton(
    int index,
    String title,
    IconData icon,
    int selectedIndex,
    ValueChanged<int> onSelect,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    bool isSelected = index == selectedIndex;
    return GestureDetector(
      onTap: () => onSelect(index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.primaryContainer
              : colorScheme.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? colorScheme.primaryContainer
                : colorScheme.surfaceContainer,
          ),
          boxShadow: isSelected
              ? []
              : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.02),
                    blurRadius: 2,
                  ),
                ],
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
              style: theme.textTheme.labelMedium?.copyWith(
                color: isSelected
                    ? colorScheme.onPrimaryContainer
                    : colorScheme.onSurfaceVariant,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputBox(
    String value,
    IconData icon,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: colorScheme.primary),
          const SizedBox(width: 8),
          Text(
            value,
            style: theme.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
