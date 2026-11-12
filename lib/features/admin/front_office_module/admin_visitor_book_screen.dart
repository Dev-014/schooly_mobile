import 'forms/add_visitor_form.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/front_office_providers.dart';
import 'package:flutter/material.dart';

class AdminVisitorBookScreen extends ConsumerWidget {
  const AdminVisitorBookScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final asyncData = ref.watch(visitorsProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Campus Activity / Summary Card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: colorScheme.outlineVariant.withValues(alpha: 0.3),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
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
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: colorScheme.primaryContainer.withValues(
                          alpha: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.badge,
                        color: colorScheme.primary,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CAMPUS ACTIVITY',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                            fontSize: 10,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Today's Visitors",
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
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
                        Text(
                          'Total',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                            fontSize: 11,
                          ),
                        ),
                        Text(
                          '14',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 1,
                      height: 24,
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      color: colorScheme.outlineVariant.withValues(alpha: 0.3),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 6,
                              height: 6,
                              decoration: const BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Inside',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: Colors.green,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '5',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 1,
                      height: 24,
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      color: colorScheme.outlineVariant.withValues(alpha: 0.3),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Checked Out',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                            fontSize: 11,
                          ),
                        ),
                        Text(
                          '9',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Actions Section: Add New & Search
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: colorScheme.outlineVariant.withValues(alpha: 0.5),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.02),
                        blurRadius: 4,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search by visitor name, pass #...',
                      hintStyle: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        size: 20,
                        color: colorScheme.onSurfaceVariant,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => const AddVisitorForm(),
                  );
                },
                icon: const Icon(Icons.person_add, size: 18),
                label: const Text(
                  'Log Visitor',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                  shadowColor: colorScheme.primary.withValues(alpha: 0.2),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Filter Pills
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildFilterPill(
                  'All',
                  '14',
                  colorScheme.inverseSurface,
                  colorScheme.onInverseSurface,
                  theme,
                  isSelected: true,
                ),
                _buildFilterPill(
                  'Inside',
                  '5',
                  colorScheme.surfaceContainerLowest,
                  colorScheme.onSurfaceVariant,
                  theme,
                  dotColor: Colors.green,
                ),
                _buildFilterPill(
                  'Checked Out',
                  '9',
                  colorScheme.surfaceContainerLowest,
                  colorScheme.onSurfaceVariant,
                  theme,
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Visitor Roster List
          asyncData.when(
            data: (items) {
              if (items.isEmpty)
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(32),
                    child: Text('No visitors found'),
                  ),
                );
              return Column(
                children: items.map((item) {
                  final name = item['visitorName'] ?? 'Unknown';
                  final initials = name.isNotEmpty
                      ? name[0].toUpperCase()
                      : '?';
                  final isInside = item['status'] == 'IN';
                  final reason = item['purpose'] ?? 'No reason';
                  final idStr = '#VB-${item['id'] ?? ''}';
                  final checkIn = item['checkInTime'] ?? '';
                  final checkOut = item['checkOutTime'] ?? '';
                  final timeText = isInside
                      ? 'In: $checkIn'
                      : '$checkIn - $checkOut';
                  return _buildVisitorCard(
                    name,
                    initials,
                    Colors.blue,
                    idStr,
                    reason,
                    isInside,
                    timeText,
                    colorScheme,
                    theme,
                  );
                }).toList(),
              );
            },
            loading: () => const Center(
              child: Padding(
                padding: EdgeInsets.all(32),
                child: CircularProgressIndicator(),
              ),
            ),
            error: (e, st) => Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Text('Error: $e'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterPill(
    String label,
    String count,
    Color bgColor,
    Color textColor,
    ThemeData theme, {
    bool isSelected = false,
    Color? dotColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
        border: isSelected
            ? null
            : Border.all(
                color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
              ),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 1),
                ),
              ]
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (dotColor != null) ...[
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: dotColor,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 6),
          ],
          Text(
            label,
            style: theme.textTheme.labelMedium?.copyWith(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          const SizedBox(width: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: isSelected
                  ? theme.colorScheme.onInverseSurface.withValues(alpha: 0.2)
                  : theme.colorScheme.surfaceContainerHigh.withValues(
                      alpha: 0.5,
                    ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              count,
              style: theme.textTheme.labelSmall?.copyWith(
                color: isSelected
                    ? theme.colorScheme.onInverseSurface
                    : theme.colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVisitorCard(
    String name,
    String initials,
    Color avatarCol,
    String id,
    String reason,
    bool isInside,
    String timeText,
    ColorScheme colorScheme,
    ThemeData theme,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.3),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: avatarCol.withValues(alpha: 0.15),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Center(
              child: Text(
                initials,
                style: theme.textTheme.titleSmall?.copyWith(
                  color: avatarCol,
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
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: theme.textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.primaryContainer.withValues(
                          alpha: 0.3,
                        ),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: colorScheme.primaryContainer.withValues(
                            alpha: 0.5,
                          ),
                        ),
                      ),
                      child: Text(
                        id,
                        style: theme.textTheme.labelSmall?.copyWith(
                          fontSize: 10,
                          color: colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  reason,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontSize: 12,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    if (isInside)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 6,
                              height: 6,
                              decoration: const BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Inside',
                              style: theme.textTheme.labelSmall?.copyWith(
                                fontSize: 11,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                    else
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
                          'Checked Out',
                          style: theme.textTheme.labelSmall?.copyWith(
                            fontSize: 11,
                            color: colorScheme.onSurfaceVariant,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    const SizedBox(width: 8),
                    Text(
                      timeText,
                      style: theme.textTheme.labelSmall?.copyWith(
                        fontSize: 11,
                        color: colorScheme.onSurfaceVariant.withValues(
                          alpha: 0.8,
                        ),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          if (isInside)
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                foregroundColor: colorScheme.onPrimary,
                elevation: 2,
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 0,
                ),
                minimumSize: const Size(0, 36),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                shadowColor: colorScheme.primary.withValues(alpha: 0.3),
              ),
              child: const Text(
                'Check Out',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            )
          else
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: colorScheme.onSurfaceVariant,
                side: BorderSide(
                  color: colorScheme.outlineVariant.withValues(alpha: 0.8),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 0,
                ),
                minimumSize: const Size(0, 36),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: colorScheme.surfaceContainerLowest,
              ),
              child: const Text(
                'View Pass',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
    );
  }
}
