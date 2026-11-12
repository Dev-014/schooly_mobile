import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'data/academic_providers.dart';
import 'data/academic_repository.dart';

class AdminAssignClassTeacherScreen extends ConsumerStatefulWidget {
  const AdminAssignClassTeacherScreen({super.key});

  @override
  ConsumerState<AdminAssignClassTeacherScreen> createState() =>
      _AdminAssignClassTeacherScreenState();
}

class _AdminAssignClassTeacherScreenState
    extends ConsumerState<AdminAssignClassTeacherScreen> {
  int? _selectedClassId;
  int? _selectedSectionId;
  int? _selectedStaffId;
  int? _selectedAcademicYearId;

  Future<void> _assignTeacher() async {
    if (_selectedClassId == null ||
        _selectedSectionId == null ||
        _selectedStaffId == null ||
        _selectedAcademicYearId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please select all required fields (Class, Section, Teacher, Academic Year)',
          ),
        ),
      );
      return;
    }

    try {
      final repo = ref.read(academicRepositoryProvider);

      // Need to find names for the payload as required by the backend
      final classes = ref.read(classesProvider).value ?? [];
      final sections = ref.read(sectionsProvider).value ?? [];
      final staffList = ref.read(staffProvider).value ?? [];
      final years = ref.read(academicYearsProvider).value ?? [];

      final classObj = classes.firstWhere(
        (c) => c['id'] == _selectedClassId,
        orElse: () => {},
      );
      final sectionObj = sections.firstWhere(
        (s) => s['id'] == _selectedSectionId,
        orElse: () => {},
      );
      final staffObj = staffList.firstWhere(
        (s) => s['id'] == _selectedStaffId,
        orElse: () => {},
      );
      final yearObj = years.firstWhere(
        (y) => y['id'] == _selectedAcademicYearId,
        orElse: () => {},
      );

      await repo.assignClassTeacher({
        'classId': _selectedClassId,
        'className': classObj['name'],
        'sectionId': _selectedSectionId,
        'sectionName': sectionObj['name'],
        'staffId': _selectedStaffId,
        'staffName':
            '${staffObj['firstName'] ?? ''} ${staffObj['lastName'] ?? ''}'
                .trim(),
        'academicYearId': _selectedAcademicYearId,
        'sessionName': yearObj['name'] ?? yearObj['displayName'],
        'status': 'ACTIVE',
      });

      setState(() {
        _selectedClassId = null;
        _selectedSectionId = null;
        _selectedStaffId = null;
      });

      ref.invalidate(classTeacherAssignmentsProvider);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Teacher assigned successfully!')),
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

  Future<void> _updateStatus(int id, String status) async {
    try {
      final repo = ref.read(academicRepositoryProvider);
      await repo.updateAssignmentStatus(id, status);
      ref.invalidate(classTeacherAssignmentsProvider);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Status updated to $status')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final classesAsync = ref.watch(classesProvider);
    final sectionsAsync = ref.watch(sectionsProvider);
    final staffAsync = ref.watch(staffProvider);
    final yearsAsync = ref.watch(academicYearsProvider);
    final assignmentsAsync = ref.watch(classTeacherAssignmentsProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sub-Header
          Row(
            children: [
              Icon(Icons.menu_book, size: 16, color: colorScheme.primary),
              const SizedBox(width: 6),
              Text(
                'ACADEMICS • Teacher Assignments',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Assign Class Teacher',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  'Active',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSecondaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Assign primary teachers to classes and sections for the academic year.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),

          const SizedBox(height: 24),

          // Quick Assignment Form
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
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: colorScheme.primaryFixed,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.person_add,
                            color: colorScheme.primary,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Assign Class Teacher',
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.onSurface,
                              ),
                            ),
                            Text(
                              'Link faculty to division roster',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Select Academic Year
                RichText(
                  text: TextSpan(
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      const TextSpan(text: 'Academic Year '),
                      TextSpan(
                        text: '*',
                        style: TextStyle(color: colorScheme.error),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                yearsAsync.when(
                  data: (years) => Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<int>(
                        isExpanded: true,
                        value: _selectedAcademicYearId,
                        hint: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: Text(
                            'Select Year',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: colorScheme.outline,
                            ),
                          ),
                        ),
                        items: years
                            .map(
                              (y) => DropdownMenuItem<int>(
                                value: y['id'] as int,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                  ),
                                  child: Text(
                                    y['displayName'] ?? y['name'] ?? '',
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (v) =>
                            setState(() => _selectedAcademicYearId = v),
                        icon: Padding(
                          padding: const EdgeInsets.only(right: 14),
                          child: Icon(
                            Icons.arrow_drop_down,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ),
                  ),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (e, st) => Text('Error: $e'),
                ),

                const SizedBox(height: 16),

                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: theme.textTheme.labelMedium?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                const TextSpan(text: 'Select Class '),
                                TextSpan(
                                  text: '*',
                                  style: TextStyle(color: colorScheme.error),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 6),
                          classesAsync.when(
                            data: (classes) => Container(
                              height: 48,
                              decoration: BoxDecoration(
                                color: colorScheme.surfaceContainerLow,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<int>(
                                  isExpanded: true,
                                  value: _selectedClassId,
                                  hint: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 14,
                                    ),
                                    child: Text(
                                      'Select Class',
                                      style: theme.textTheme.bodyMedium
                                          ?.copyWith(
                                            color: colorScheme.outline,
                                          ),
                                    ),
                                  ),
                                  items: classes
                                      .map(
                                        (c) => DropdownMenuItem<int>(
                                          value: c['id'] as int,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 14,
                                            ),
                                            child: Text(
                                              c['name'] ?? '',
                                              style: theme.textTheme.bodyMedium,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (v) => setState(() {
                                    _selectedClassId = v;
                                    _selectedSectionId =
                                        null; // reset section when class changes
                                  }),
                                  icon: Padding(
                                    padding: const EdgeInsets.only(right: 14),
                                    child: Icon(
                                      Icons.arrow_drop_down,
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            loading: () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            error: (e, st) => Text('Error: $e'),
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
                                color: colorScheme.onSurfaceVariant,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                const TextSpan(text: 'Select Section '),
                                TextSpan(
                                  text: '*',
                                  style: TextStyle(color: colorScheme.error),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 6),
                          sectionsAsync.when(
                            data: (sections) {
                              final availableSections = _selectedClassId == null
                                  ? <Map<String, dynamic>>[]
                                  : sections
                                        .where(
                                          (s) =>
                                              s['classId'] == _selectedClassId,
                                        )
                                        .toList();

                              return Container(
                                height: 48,
                                decoration: BoxDecoration(
                                  color: colorScheme.surfaceContainerLow,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<int>(
                                    isExpanded: true,
                                    value: _selectedSectionId,
                                    hint: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 14,
                                      ),
                                      child: Text(
                                        'Section',
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                              color: colorScheme.outline,
                                            ),
                                      ),
                                    ),
                                    items: availableSections
                                        .map(
                                          (s) => DropdownMenuItem<int>(
                                            value: s['id'] as int,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 14,
                                                  ),
                                              child: Text(
                                                s['name'] ?? '',
                                                style:
                                                    theme.textTheme.bodyMedium,
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (v) =>
                                        setState(() => _selectedSectionId = v),
                                    icon: Padding(
                                      padding: const EdgeInsets.only(right: 14),
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        color: colorScheme.onSurfaceVariant,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            loading: () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            error: (e, st) => Text('Error: $e'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          const TextSpan(text: 'Assign Class Teacher '),
                          TextSpan(
                            text: '*',
                            style: TextStyle(color: colorScheme.error),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Primary Lead',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                staffAsync.when(
                  data: (staffList) => Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 12),
                        Icon(Icons.badge, color: colorScheme.primary, size: 20),
                        Expanded(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<int>(
                              isExpanded: true,
                              value: _selectedStaffId,
                              hint: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                child: Text(
                                  'Select Teacher',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: colorScheme.outline,
                                  ),
                                ),
                              ),
                              items: staffList
                                  .map(
                                    (s) => DropdownMenuItem<int>(
                                      value: s['id'] as int,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                        ),
                                        child: Text(
                                          '${s['firstName'] ?? ''} ${s['lastName'] ?? ''}'
                                              .trim(),
                                          style: theme.textTheme.bodyMedium,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (v) =>
                                  setState(() => _selectedStaffId = v),
                              icon: Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: Icon(
                                  Icons.expand_more,
                                  color: colorScheme.onSurfaceVariant,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (e, st) => Text('Error: $e'),
                ),

                const SizedBox(height: 24),

                ElevatedButton.icon(
                  onPressed: _assignTeacher,
                  icon: const Icon(Icons.assignment_turned_in, size: 20),
                  label: const Text('Save & Assign Teacher'),
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

          // Assigned Teachers Directory Header
          assignmentsAsync.maybeWhen(
            data: (assignments) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Assigned Class Teachers',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.primaryFixed,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '${assignments.length} Mapped',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            orElse: () => Text(
              'Assigned Class Teachers',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Directory Rows
          assignmentsAsync.when(
            data: (assignments) {
              if (assignments.isEmpty) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('No assignments found.'),
                  ),
                );
              }
              return Column(
                children: assignments.map((item) {
                  final clsStr =
                      '${item['className'] ?? ''} - ${item['sectionName'] ?? ''}'
                          .trim();
                  final isActive = item['status'] == 'ACTIVE';

                  return _buildRosterRow(
                    item['id'] as int,
                    clsStr,
                    item['staffName'] ?? 'Unknown Staff',
                    item['sessionName'] ?? '',
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
        ],
      ),
    );
  }

  Widget _buildRosterRow(
    int id,
    String cls,
    String primary,
    String session,
    bool isActive,
    ColorScheme colorScheme,
    ThemeData theme,
  ) {
    final classBg = isActive
        ? colorScheme.primaryFixed
        : colorScheme.surfaceContainer;
    final classColor = isActive
        ? colorScheme.primary
        : colorScheme.onSurfaceVariant;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: classBg,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    cls,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: classColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          primary,
                          style: theme.textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '•',
                        style: TextStyle(
                          color: colorScheme.outline,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Flexible(
                        child: Text(
                          session,
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () =>
                    _updateStatus(id, isActive ? 'INACTIVE' : 'ACTIVE'),
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isActive ? Icons.toggle_on : Icons.toggle_off,
                    size: 18,
                    color: isActive ? colorScheme.primary : colorScheme.outline,
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
