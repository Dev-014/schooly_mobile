import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../data/models/parent_models.dart';
import '../providers/parent_providers.dart';
import '../more/child_switcher_sheet.dart';

class ParentCalendarScreen extends ConsumerStatefulWidget {
  const ParentCalendarScreen({super.key});

  @override
  ConsumerState<ParentCalendarScreen> createState() => _ParentCalendarScreenState();
}

class _ParentCalendarScreenState extends ConsumerState<ParentCalendarScreen> {
  late DateTime _currentMonth;
  int? _selectedDay;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _currentMonth = DateTime(now.year, now.month, 1);
    _selectedDay = now.day;
  }

  void _changeMonth(int delta) {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + delta, 1);
      _selectedDay = null;
    });
  }

  String _formatMonthYear(DateTime date) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return '${months[date.month - 1]} ${date.year}';
  }

  DateTime? _parseEventDate(String dateStr) {
    // Attempt standard ISO or DD-MM-YYYY
    final iso = DateTime.tryParse(dateStr);
    if (iso != null) return iso;

    final parts = dateStr.split('-');
    if (parts.length == 3) {
      final d = int.tryParse(parts[0]);
      final m = int.tryParse(parts[1]);
      final y = int.tryParse(parts[2]);
      if (d != null && m != null && y != null) {
        return DateTime(y, m, d);
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final activeChild = ref.watch(selectedChildProvider);
    final childrenAsync = ref.watch(parentChildrenProvider);
    final eventsAsync = ref.watch(schoolEventsProvider(activeChild?.schoolId));

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        scrolledUnderElevation: 1,
        title: Text(
          'School Events & Calendar',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Child context header
            childrenAsync.maybeWhen(
              data: (children) {
                if (children.isEmpty) return const SizedBox.shrink();
                final effectiveChild = activeChild ?? children.first;
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: colorScheme.outlineVariant.withValues(alpha: 0.3)),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: colorScheme.primaryContainer,
                        child: Text(
                          effectiveChild.initials,
                          style: TextStyle(
                            color: colorScheme.onPrimaryContainer,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Viewing for: ${effectiveChild.name} (${effectiveChild.className})',
                          style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                      if (children.length > 1)
                        TextButton(
                          onPressed: () async {
                            final selected = await showChildSwitcherSheet(
                              context,
                              children: children,
                              selectedChild: effectiveChild,
                            );
                            if (selected != null) {
                              ref.read(selectedChildProvider.notifier).selectChild(selected);
                            }
                          },
                          child: const Text('Switch'),
                        ),
                    ],
                  ),
                );
              },
              orElse: () => const SizedBox.shrink(),
            ),

            // 2. Calendar Header (Month Switcher)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.chevron_left),
                        onPressed: () => _changeMonth(-1),
                      ),
                      Text(
                        _formatMonthYear(_currentMonth),
                        style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: const Icon(Icons.chevron_right),
                        onPressed: () => _changeMonth(1),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Weekday headers
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                        .map(
                          (d) => SizedBox(
                            width: 36,
                            child: Text(
                              d,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 12),

                  // Calendar Grid
                  eventsAsync.when(
                    loading: () => const Center(
                      child: Padding(
                        padding: EdgeInsets.all(24.0),
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    error: (err, _) => Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Failed to load events: $err',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.error),
                      ),
                    ),
                    data: (events) {
                      // Map day of current month to events
                      final dayEvents = <int, List<ParentCmsEvent>>{};
                      for (final ev in events) {
                        final parsed = _parseEventDate(ev.startDate);
                        if (parsed != null &&
                            parsed.year == _currentMonth.year &&
                            parsed.month == _currentMonth.month) {
                          dayEvents.putIfAbsent(parsed.day, () => []).add(ev);
                        }
                      }

                      final firstWeekday = DateTime(_currentMonth.year, _currentMonth.month, 1).weekday;
                      final daysInMonth = DateTime(_currentMonth.year, _currentMonth.month + 1, 0).day;
                      final cells = <Widget>[];

                      for (int i = 1; i < firstWeekday; i++) {
                        cells.add(const SizedBox());
                      }

                      final now = DateTime.now();
                      final isCurrentMonth = now.year == _currentMonth.year && now.month == _currentMonth.month;

                      for (int day = 1; day <= daysInMonth; day++) {
                        final hasEvents = dayEvents.containsKey(day);
                        final isSelected = _selectedDay == day;
                        final isToday = isCurrentMonth && now.day == day;

                        cells.add(
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedDay = (_selectedDay == day) ? null : day;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? colorScheme.primary
                                    : (isToday ? colorScheme.primaryContainer.withValues(alpha: 0.4) : Colors.transparent),
                                borderRadius: BorderRadius.circular(10),
                                border: isToday && !isSelected
                                    ? Border.all(color: colorScheme.primary, width: 1.5)
                                    : null,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '$day',
                                    style: theme.textTheme.labelMedium?.copyWith(
                                      fontWeight: (isSelected || isToday) ? FontWeight.bold : FontWeight.normal,
                                      color: isSelected
                                          ? colorScheme.onPrimary
                                          : colorScheme.onSurface,
                                    ),
                                  ),
                                  if (hasEvents) ...[
                                    const SizedBox(height: 2),
                                    Container(
                                      width: 5,
                                      height: 5,
                                      decoration: BoxDecoration(
                                        color: isSelected ? colorScheme.onPrimary : colorScheme.primary,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ),
                        );
                      }

                      return GridView.count(
                        crossAxisCount: 7,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        childAspectRatio: 1.0,
                        mainAxisSpacing: 6,
                        crossAxisSpacing: 6,
                        children: cells,
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 3. Events List Section
            eventsAsync.when(
              loading: () => const SizedBox.shrink(),
              error: (err, _) => Center(
                child: FilledButton.tonal(
                  onPressed: () => ref.invalidate(schoolEventsProvider(activeChild?.schoolId)),
                  child: const Text('Retry Loading Events'),
                ),
              ),
              data: (events) {
                // Filter events based on month and optional selected day
                final matchingEvents = events.where((ev) {
                  final parsed = _parseEventDate(ev.startDate);
                  if (parsed == null) return false;
                  if (parsed.year != _currentMonth.year || parsed.month != _currentMonth.month) return false;
                  if (_selectedDay != null && parsed.day != _selectedDay) return false;
                  return true;
                }).toList();

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _selectedDay != null
                              ? 'Events for $_selectedDay ${_formatMonthYear(_currentMonth)}'
                              : 'All Events in ${_formatMonthYear(_currentMonth)}',
                          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        if (_selectedDay != null)
                          TextButton(
                            onPressed: () => setState(() => _selectedDay = null),
                            child: const Text('Show All'),
                          ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    if (matchingEvents.isEmpty)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceContainerLowest,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.event_available, size: 40, color: colorScheme.outlineVariant),
                            const SizedBox(height: 8),
                            Text(
                              'No Events Scheduled',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      )
                    else
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: matchingEvents.length,
                        separatorBuilder: (_, _) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final ev = matchingEvents[index];
                          return Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColors.surfaceContainerLowest,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.04),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                              border: Border.all(
                                color: colorScheme.outlineVariant.withValues(alpha: 0.2),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: colorScheme.primaryContainer,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text(
                                        ev.startDate,
                                        style: theme.textTheme.labelSmall?.copyWith(
                                          color: colorScheme.onPrimaryContainer,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    if (ev.venue.isNotEmpty) ...[
                                      const Spacer(),
                                      Row(
                                        children: [
                                          Icon(Icons.location_on_outlined, size: 14, color: colorScheme.onSurfaceVariant),
                                          const SizedBox(width: 4),
                                          Text(
                                            ev.venue,
                                            style: theme.textTheme.bodySmall?.copyWith(
                                              color: colorScheme.onSurfaceVariant,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  ev.title,
                                  style: theme.textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                if (ev.description != null && ev.description!.isNotEmpty) ...[
                                  const SizedBox(height: 6),
                                  Text(
                                    ev.description!,
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          );
                        },
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
