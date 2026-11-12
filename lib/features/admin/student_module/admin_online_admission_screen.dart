import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../auth/providers/auth_provider.dart';

import 'providers/admin_online_admission_provider.dart';

class AdminOnlineAdmissionScreen extends ConsumerStatefulWidget {
  const AdminOnlineAdmissionScreen({super.key});

  @override
  ConsumerState<AdminOnlineAdmissionScreen> createState() =>
      _AdminOnlineAdmissionScreenState();
}

class _AdminOnlineAdmissionScreenState
    extends ConsumerState<AdminOnlineAdmissionScreen> {
  String get _schoolId =>
      ref.read(authProvider)?.schoolId?.toString() ?? '1000';
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final admissionsAsync = ref.watch(
      onlineAdmissionControllerProvider(_schoolId),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // KPI Status Overview Cards
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: _buildKpiCard(
                  '28',
                  'New Inflow',
                  Icons.how_to_reg,
                  '+12 Today',
                  colorScheme.primary,
                  colorScheme,
                  theme,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildKpiCard(
                  '14',
                  'Under Review',
                  Icons.pending_actions,
                  'Priority',
                  colorScheme.tertiary,
                  colorScheme,
                  theme,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildKpiCard(
                  '45',
                  'Approved',
                  Icons.check_circle,
                  '84% Rate',
                  colorScheme.secondary,
                  colorScheme,
                  theme,
                ),
              ),
            ],
          ),
        ),

        // Search & Filter
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: TextField(
                    onChanged: (v) {
                      setState(() {
                        _searchQuery = v;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Search name, app no...',
                      icon: Icon(
                        Icons.search,
                        color: colorScheme.outline,
                        size: 20,
                      ),
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: colorScheme.outline),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    Text(
                      'All Classes',
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.expand_more,
                      size: 18,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // List
        Expanded(
          child: admissionsAsync.when(
            data: (admissions) {
              final filtered = admissions.where((a) {
                final query = _searchQuery.toLowerCase();
                final name = '${a['firstName']} ${a['lastName']}'.toLowerCase();
                final appNo = (a['applicationNo']?.toString() ?? '')
                    .toLowerCase();
                return name.contains(query) || appNo.contains(query);
              }).toList();

              if (filtered.isEmpty) {
                return const Center(child: Text('No online admissions found.'));
              }

              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: filtered.length,
                itemBuilder: (context, index) {
                  final a = filtered[index];
                  final id = a['id'].toString();
                  final name = '${a['firstName']} ${a['lastName']}';
                  final appNo = a['applicationNo']?.toString() ?? 'N/A';
                  final className = a['classId']?.toString() ?? 'Unknown Class';
                  final status = (a['status']?.toString() ?? 'PENDING')
                      .toUpperCase();

                  Color statusColor = colorScheme.tertiary;
                  if (status == 'APPROVED' || status == 'ADMITTED')
                    statusColor = colorScheme.secondary;
                  if (status == 'REJECTED') statusColor = colorScheme.error;

                  return _buildApplicationCard(
                    id,
                    name,
                    appNo,
                    className,
                    status,
                    statusColor,
                    colorScheme,
                    theme,
                  );
                },
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) =>
                Center(child: Text('Error loading admissions: $err')),
          ),
        ),
      ],
    );
  }

  Widget _buildKpiCard(
    String val,
    String label,
    IconData icon,
    String badge,
    Color color,
    ColorScheme colorScheme,
    ThemeData theme,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 14, color: color),
              ),
              Text(
                badge,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            val,
            style: theme.textTheme.headlineMedium?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildApplicationCard(
    String id,
    String name,
    String applicationNo,
    String grade,
    String status,
    Color statusColor,
    ColorScheme colorScheme,
    ThemeData theme,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                applicationNo,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  status,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainer,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.person, color: colorScheme.onSurfaceVariant),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.class_,
                          size: 14,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          grade,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Icon(
                          Icons.calendar_today,
                          size: 14,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Today',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              PopupMenuButton<String>(
                onSelected: (newStatus) {
                  ref
                      .read(
                        onlineAdmissionControllerProvider(_schoolId).notifier,
                      )
                      .updateStatus(id, newStatus);
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'APPROVED',
                    child: Text('Approve'),
                  ),
                  const PopupMenuItem(value: 'REJECTED', child: Text('Reject')),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.description,
                    size: 16,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  label: Text(
                    'View Documents',
                    style: TextStyle(color: colorScheme.onSurfaceVariant),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: colorScheme.surfaceContainerLow,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.visibility,
                    size: 16,
                    color: colorScheme.primary,
                  ),
                  label: Text(
                    'Review App',
                    style: TextStyle(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: colorScheme.primaryContainer.withValues(
                      alpha: 0.3,
                    ),
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
