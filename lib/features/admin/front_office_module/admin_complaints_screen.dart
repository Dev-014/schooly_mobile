import 'forms/add_complaint_form.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/front_office_providers.dart';
import 'package:flutter/material.dart';

class AdminComplaintsScreen extends ConsumerWidget {
  const AdminComplaintsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final asyncData = ref.watch(complaintsProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title & Active Badge Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Complaints',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.errorContainer,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      '8 Pending',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorScheme.onErrorContainer,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.assignment, size: 18, color: colorScheme.primary),
                  const SizedBox(width: 4),
                  Text(
                    'Front Office',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16),

          // 3-Metric Compact Stats Strip
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  'Total',
                  '24',
                  'logged',
                  colorScheme.outline,
                  colorScheme.onSurface,
                  theme,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildStatCard(
                  'Pending',
                  '8',
                  'cases',
                  colorScheme.tertiary,
                  colorScheme.tertiary,
                  theme,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildStatCard(
                  'Resolved',
                  '16',
                  'done',
                  colorScheme.secondary,
                  colorScheme.secondary,
                  theme,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Action & Search Bar
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      color: colorScheme.outlineVariant.withValues(alpha: 0.5),
                    ),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search complainant, #CMP, topic...',
                      hintStyle: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        size: 18,
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
                    builder: (context) => const AddComplaintForm(),
                  );
                },
                icon: const Icon(Icons.add, size: 18),
                label: const Text('Log'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                  elevation: 2,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Filter Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildFilterChip('All', true, theme),
                _buildFilterChip('Parent', false, theme),
                _buildFilterChip('Student', false, theme),
                _buildFilterChip('Staff', false, theme),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Complaints List
          asyncData.when(
            data: (items) {
              if (items.isEmpty)
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(32),
                    child: Text('No complaints found'),
                  ),
                );
              return Column(
                children: items.map((item) {
                  final name = item['complainantName'] ?? 'Unknown';
                  final role = item['complainantRole'] ?? 'Student';
                  final idStr = '#CMP-${item['id'] ?? ''}';
                  final topic = item['title'] ?? 'Complaint';
                  final desc = item['description'] ?? '';
                  final isPending = item['status'] != 'RESOLVED';
                  return _buildComplaintCard(
                    name,
                    role,
                    idStr,
                    topic,
                    desc,
                    Icons.report_problem,
                    isPending,
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

  Widget _buildStatCard(
    String title,
    String count,
    String subtitle,
    Color color,
    Color countColor,
    ThemeData theme,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              const SizedBox(width: 6),
              Text(
                title,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                count,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: countColor,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                subtitle,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: color.withValues(alpha: 0.7),
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected, ThemeData theme) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected
            ? theme.colorScheme.primary
            : theme.colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(20),
        border: isSelected
            ? null
            : Border.all(
                color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
              ),
      ),
      child: Text(
        label,
        style: theme.textTheme.labelMedium?.copyWith(
          color: isSelected
              ? theme.colorScheme.onPrimary
              : theme.colorScheme.onSurfaceVariant,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildComplaintCard(
    String name,
    String role,
    String id,
    String topic,
    String desc,
    IconData icon,
    bool isPending,
    ThemeData theme,
  ) {
    final colorScheme = theme.colorScheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: colorScheme.primaryContainer.withValues(
                          alpha: 0.3,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(icon, color: colorScheme.primary, size: 20),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            topic,
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              Text(
                                name,
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                  fontSize: 11,
                                ),
                              ),
                              Text(
                                ' • $role',
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant
                                      .withValues(alpha: 0.7),
                                  fontSize: 10,
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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  id,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            desc,
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: isPending
                      ? colorScheme.tertiaryContainer.withValues(alpha: 0.3)
                      : colorScheme.secondaryContainer.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: isPending
                            ? colorScheme.tertiary
                            : colorScheme.secondary,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      isPending ? 'Pending Assignment' : 'Resolved',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: isPending
                            ? colorScheme.tertiary
                            : colorScheme.secondary,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              if (isPending)
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 0,
                    ),
                    minimumSize: const Size(0, 32),
                    elevation: 1,
                  ),
                  child: const Text(
                    'Resolve',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                )
              else
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: colorScheme.onSurfaceVariant,
                    side: BorderSide(
                      color: colorScheme.outlineVariant.withValues(alpha: 0.5),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 0,
                    ),
                    minimumSize: const Size(0, 32),
                  ),
                  child: const Text(
                    'View Logs',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
