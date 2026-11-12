import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

/// Data model for a child entry
class ChildInfo {
  final String name;
  final String initials;
  final String className;
  final int rollNo;
  final String school;
  final String house;
  final int attendancePct;
  final bool isSelected;

  const ChildInfo({
    required this.name,
    required this.initials,
    required this.className,
    required this.rollNo,
    required this.school,
    required this.house,
    required this.attendancePct,
    this.isSelected = false,
  });

  ChildInfo copyWith({bool? isSelected}) => ChildInfo(
    name: name,
    initials: initials,
    className: className,
    rollNo: rollNo,
    school: school,
    house: house,
    attendancePct: attendancePct,
    isSelected: isSelected ?? this.isSelected,
  );
}

/// Shows a bottom sheet for selecting which child to view.
/// Returns the selected [ChildInfo] or null if dismissed.
Future<ChildInfo?> showChildSwitcherSheet(
  BuildContext context, {
  required List<ChildInfo> children,
  required ChildInfo selectedChild,
}) {
  return showModalBottomSheet<ChildInfo>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: 0.4),
    builder: (ctx) =>
        _ChildSwitcherSheet(children: children, selectedChild: selectedChild),
  );
}

class _ChildSwitcherSheet extends StatefulWidget {
  final List<ChildInfo> children;
  final ChildInfo selectedChild;

  const _ChildSwitcherSheet({
    required this.children,
    required this.selectedChild,
  });

  @override
  State<_ChildSwitcherSheet> createState() => _ChildSwitcherSheetState();
}

class _ChildSwitcherSheetState extends State<_ChildSwitcherSheet> {
  late ChildInfo _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.selectedChild;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Drag handle
            Container(
              margin: const EdgeInsets.only(top: 12, bottom: 4),
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: colorScheme.outlineVariant,
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My Children',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      Text(
                        'Switch portal context or view student profiles',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerHigh,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: colorScheme.secondary,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '${widget.children.length} Linked',
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Children cards list
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
                child: Column(
                  children: widget.children.map((child) {
                    final isActive = child.name == _selected.name;
                    return _ChildCard(
                      child: child,
                      isActive: isActive,
                      onTap: () => setState(() => _selected = child),
                    );
                  }).toList(),
                ),
              ),
            ),

            // Confirm button
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(_selected),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  elevation: 2,
                ),
                child: Text(
                  'View ${_selected.name.split(' ').first}\'s Dashboard',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChildCard extends StatelessWidget {
  final ChildInfo child;
  final bool isActive;
  final VoidCallback onTap;

  const _ChildCard({
    required this.child,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isActive
                ? colorScheme.primary
                : colorScheme.outlineVariant.withValues(alpha: 0.6),
            width: isActive ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: isActive
                  ? colorScheme.primary.withValues(alpha: 0.08)
                  : Colors.black.withValues(alpha: 0.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                // Avatar with active indicator
                Stack(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: isActive
                            ? AppColors.primaryFixed
                            : colorScheme.surfaceContainerHighest,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        child.initials,
                        style: TextStyle(
                          color: isActive
                              ? colorScheme.primary
                              : colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    if (isActive)
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: colorScheme.secondary,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: Icon(
                            Icons.check,
                            color: colorScheme.onSecondary,
                            size: 10,
                          ),
                        ),
                      ),
                  ],
                ),

                const SizedBox(width: 12),

                // Name + class info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            child.name,
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onSurface,
                            ),
                          ),
                          if (isActive) ...[
                            const SizedBox(width: 6),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: colorScheme.secondaryContainer,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                'Active',
                                style: TextStyle(
                                  color: colorScheme.onSecondaryContainer,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${child.className} • Roll ${child.rollNo} • ${child.school}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),

                // Attendance badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${child.attendancePct}% Attn',
                    style: TextStyle(
                      color: colorScheme.primary,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Footer row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.shield_outlined,
                      size: 14,
                      color: colorScheme.outline,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      child.house,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                // Selected indicator or select button
                isActive
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.secondary.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.radio_button_checked,
                              size: 16,
                              color: colorScheme.secondary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Selected',
                              style: TextStyle(
                                color: colorScheme.secondary,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceContainer,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.radio_button_unchecked,
                              size: 16,
                              color: colorScheme.onSurfaceVariant,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Select',
                              style: TextStyle(
                                color: colorScheme.onSurfaceVariant,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
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
    );
  }
}
