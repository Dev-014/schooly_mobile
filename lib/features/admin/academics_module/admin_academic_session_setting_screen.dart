import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'data/academic_providers.dart';
import 'data/academic_repository.dart';
import 'package:intl/intl.dart';

class AdminAcademicSessionSettingScreen extends ConsumerStatefulWidget {
  const AdminAcademicSessionSettingScreen({super.key});

  @override
  ConsumerState<AdminAcademicSessionSettingScreen> createState() =>
      _AdminAcademicSessionSettingScreenState();
}

class _AdminAcademicSessionSettingScreenState
    extends ConsumerState<AdminAcademicSessionSettingScreen> {
  final _nameController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  bool _isActive = true;

  @override
  void dispose() {
    _nameController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  Future<void> _createSession() async {
    final name = _nameController.text.trim();
    final start = _startDateController.text.trim();
    final end = _endDateController.text.trim();

    if (name.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Session Name is required')));
      return;
    }

    try {
      final repo = ref.read(academicRepositoryProvider);
      final data = {
        'name': name,
        'displayName': name,
        'status': _isActive ? 'ACTIVE' : 'INACTIVE',
      };
      if (start.isNotEmpty) data['startDate'] = start;
      if (end.isNotEmpty) data['endDate'] = end;

      await repo.createAcademicYear(data);

      _nameController.clear();
      _startDateController.clear();
      _endDateController.clear();
      setState(() {
        _isActive = true;
      });
      ref.invalidate(academicYearsProvider);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Session created successfully!')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    }
  }

  Future<void> _activateSession(int id) async {
    try {
      final repo = ref.read(academicRepositoryProvider);
      await repo.activateAcademicYear(id);
      ref.invalidate(academicYearsProvider);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Session activated!')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    }
  }

  Future<void> _deleteSession(int id) async {
    try {
      final repo = ref.read(academicRepositoryProvider);
      await repo.deleteAcademicYear(id);
      ref.invalidate(academicYearsProvider);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Session deleted')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    }
  }

  Future<void> _selectDate(
    BuildContext context,
    TextEditingController controller,
  ) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      controller.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final yearsAsync = ref.watch(academicYearsProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: colorScheme.primaryFixed,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Icon(
                  Icons.date_range,
                  color: colorScheme.onPrimaryFixed,
                  size: 20,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Academic Session Setting',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            'Create and configure institutional academic years, term schedules, and default rollups.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),

          const SizedBox(height: 24),

          // Create New Session Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primary.withValues(alpha: 0.08),
                  blurRadius: 24,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: colorScheme.primaryFixed,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.add_circle,
                            color: colorScheme.primary,
                            size: 18,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Create New Academic Session',
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.onSurface,
                              ),
                            ),
                            Text(
                              'Direct configuration without modal delay',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Mandatory',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Session Year Name
                RichText(
                  text: TextSpan(
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: colorScheme.onSurface,
                    ),
                    children: [
                      const TextSpan(text: 'Session Year Name '),
                      TextSpan(
                        text: '*',
                        style: TextStyle(color: colorScheme.error),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'e.g., 2027–2028',
                      prefixIcon: Icon(
                        Icons.badge,
                        color: colorScheme.outline,
                        size: 18,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Start / End Date
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: theme.textTheme.labelMedium?.copyWith(
                                color: colorScheme.onSurface,
                              ),
                              children: const [TextSpan(text: 'Start Date ')],
                            ),
                          ),
                          const SizedBox(height: 6),
                          GestureDetector(
                            onTap: () =>
                                _selectDate(context, _startDateController),
                            child: AbsorbPointer(
                              child: Container(
                                height: 48,
                                decoration: BoxDecoration(
                                  color: colorScheme.surfaceContainerLow,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: TextField(
                                  controller: _startDateController,
                                  decoration: InputDecoration(
                                    hintText: 'YYYY-MM-DD',
                                    prefixIcon: Icon(
                                      Icons.event,
                                      color: colorScheme.outline,
                                      size: 18,
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: theme.textTheme.labelMedium?.copyWith(
                                color: colorScheme.onSurface,
                              ),
                              children: const [TextSpan(text: 'End Date ')],
                            ),
                          ),
                          const SizedBox(height: 6),
                          GestureDetector(
                            onTap: () =>
                                _selectDate(context, _endDateController),
                            child: AbsorbPointer(
                              child: Container(
                                height: 48,
                                decoration: BoxDecoration(
                                  color: colorScheme.surfaceContainerLow,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: TextField(
                                  controller: _endDateController,
                                  decoration: InputDecoration(
                                    hintText: 'YYYY-MM-DD',
                                    prefixIcon: Icon(
                                      Icons.event_available,
                                      color: colorScheme.outline,
                                      size: 18,
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Active Toggle
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.toggle_on,
                        color: colorScheme.secondary,
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Set as Active Current Session',
                              style: theme.textTheme.labelMedium?.copyWith(
                                color: colorScheme.onSurface,
                              ),
                            ),
                            Text(
                              'Overrides existing default school term',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Switch(
                        value: _isActive,
                        onChanged: (v) => setState(() => _isActive = v),
                        activeColor: colorScheme.secondary,
                        activeTrackColor: colorScheme.secondary,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                ElevatedButton.icon(
                  onPressed: _createSession,
                  icon: const Icon(Icons.check_circle, size: 20),
                  label: const Text('Create Session'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    elevation: 2,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Configured Sessions Header
          yearsAsync.maybeWhen(
            data: (years) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Configured Academic Sessions',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
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
                        '${years.length}',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            orElse: () => Text(
              'Configured Academic Sessions',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Sessions List
          yearsAsync.when(
            data: (years) {
              if (years.isEmpty) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('No academic sessions found.'),
                  ),
                );
              }
              return Column(
                children: years.map((item) {
                  final isActive = item['status'] == 'ACTIVE';
                  final badgeText = isActive
                      ? 'Active'
                      : (item['status'] ?? 'Upcoming');
                  final dateRange =
                      '${item['startDate'] ?? 'N/A'} - ${item['endDate'] ?? 'N/A'}';

                  return _buildSessionRow(
                    item['id'] as int,
                    item['displayName'] ?? item['name'] ?? '',
                    badgeText,
                    dateRange,
                    isActive
                        ? colorScheme.secondaryContainer
                        : colorScheme.surfaceContainerHigh,
                    isActive
                        ? colorScheme.onSecondaryContainer
                        : colorScheme.onSurfaceVariant,
                    isActive ? colorScheme.secondary : null,
                    isActive,
                    colorScheme,
                    theme,
                  );
                }).toList(),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, st) => Text('Error: $e'),
          ),

          const SizedBox(height: 24),

          // Term Rollover Protocol Info Note
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.info, color: colorScheme.primary, size: 22),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Term Rollover Protocol',
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Setting a new active session preserves historical academic transcripts, fee registers, and grading structures without overwriting previous logs.',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSessionRow(
    int id,
    String title,
    String badge,
    String date,
    Color badgeBg,
    Color badgeColor,
    Color? dotColor,
    bool isActive,
    ColorScheme colorScheme,
    ThemeData theme,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withValues(alpha: 0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          if (isActive)
            Positioned(
              left: -16,
              top: -12,
              bottom: -12,
              child: Container(width: 6, color: colorScheme.secondary),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: badgeBg,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          if (dotColor != null) ...[
                            Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                color: dotColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 4),
                          ],
                          Text(
                            badge,
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: badgeColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        date,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  if (!isActive)
                    GestureDetector(
                      onTap: () => _activateSession(id),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.secondaryContainer,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_circle,
                              size: 16,
                              color: colorScheme.onSecondaryContainer,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Activate',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: colorScheme.onSecondaryContainer,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (!isActive) const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () => _deleteSession(id),
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainer,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.delete,
                        size: 18,
                        color: colorScheme.error,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
