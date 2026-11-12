import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../student_module/data/student_repository.dart';
import 'data/academic_providers.dart';
import 'data/academic_repository.dart';

class AdminPromoteStudentsScreen extends ConsumerStatefulWidget {
  const AdminPromoteStudentsScreen({super.key});

  @override
  ConsumerState<AdminPromoteStudentsScreen> createState() =>
      _AdminPromoteStudentsScreenState();
}

class _AdminPromoteStudentsScreenState
    extends ConsumerState<AdminPromoteStudentsScreen> {
  int? _sourceClassId;
  int? _sourceSectionId;
  int? _targetClassId;
  int? _targetSectionId;
  int? _targetAcademicYearId;

  List<dynamic> _students = [];
  Set<String> _selectedStudentIds = {};
  bool _isLoadingStudents = false;
  bool _isPromoting = false;

  Future<void> _fetchStudents() async {
    if (_sourceClassId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a source class')),
      );
      return;
    }

    setState(() {
      _isLoadingStudents = true;
    });
    try {
      // Assuming getStudents method exists and supports filtering by classId, but we might need to filter locally
      final repo = ref.read(studentRepositoryProvider);
      final allStudents = await repo.getStudents(
        '',
      ); // Pass schoolId if available

      setState(() {
        _students = allStudents
            .where(
              (s) =>
                  s['classId'] == _sourceClassId &&
                  (_sourceSectionId == null ||
                      s['sectionId'] == _sourceSectionId),
            )
            .toList();
        _selectedStudentIds = _students.map((s) => s['id'].toString()).toSet();
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    } finally {
      setState(() {
        _isLoadingStudents = false;
      });
    }
  }

  Future<void> _promoteStudents() async {
    if (_selectedStudentIds.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select students to promote')),
      );
      return;
    }
    if (_targetClassId == null || _targetAcademicYearId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select target class and academic year'),
        ),
      );
      return;
    }

    setState(() {
      _isPromoting = true;
    });
    try {
      final repo = ref.read(studentRepositoryProvider);

      await repo.promoteStudents({
        'studentIds': _selectedStudentIds.toList(),
        'targetClassId': _targetClassId.toString(),
        if (_targetSectionId != null)
          'targetSectionId': _targetSectionId.toString(),
        'targetAcademicYearId': _targetAcademicYearId.toString(),
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Students promoted successfully!')),
        );
        // clear list
        setState(() {
          _students = [];
          _selectedStudentIds.clear();
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    } finally {
      setState(() {
        _isPromoting = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final classesAsync = ref.watch(classesProvider);
    final sectionsAsync = ref.watch(sectionsProvider);
    final yearsAsync = ref.watch(academicYearsProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title & Context Area
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: colorScheme.primaryFixed,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            'ANNUAL ROLLOVER',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: colorScheme.onPrimaryFixed,
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Promote Students',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Migrate academic records, roll-over cohorts, and assign target classes for the upcoming term.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Step 1: Mapping Configuration
          Container(
            padding: const EdgeInsets.all(16),
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
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: colorScheme.primaryFixed,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '1',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Rollover Matrix Configuration',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Target Academic Year
                RichText(
                  text: TextSpan(
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      const TextSpan(text: 'Target Academic Year '),
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
                        value: _targetAcademicYearId,
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
                            setState(() => _targetAcademicYearId = v),
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

                // Source Class and Section
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
                                const TextSpan(text: 'Source Class '),
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
                                  value: _sourceClassId,
                                  hint: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 14,
                                    ),
                                    child: Text(
                                      'Class',
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
                                    _sourceClassId = v;
                                    _sourceSectionId = null;
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
                          Text(
                            'Source Section',
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          sectionsAsync.when(
                            data: (sections) {
                              final available = _sourceClassId == null
                                  ? <Map<String, dynamic>>[]
                                  : sections
                                        .where(
                                          (s) => s['classId'] == _sourceClassId,
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
                                    value: _sourceSectionId,
                                    hint: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 14,
                                      ),
                                      child: Text(
                                        'All',
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                              color: colorScheme.outline,
                                            ),
                                      ),
                                    ),
                                    items: available
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
                                        setState(() => _sourceSectionId = v),
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

                // Target Class and Section
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
                                const TextSpan(text: 'Target Class '),
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
                                  value: _targetClassId,
                                  hint: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 14,
                                    ),
                                    child: Text(
                                      'Class',
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
                                    _targetClassId = v;
                                    _targetSectionId = null;
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
                          Text(
                            'Target Section',
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          sectionsAsync.when(
                            data: (sections) {
                              final available = _targetClassId == null
                                  ? <Map<String, dynamic>>[]
                                  : sections
                                        .where(
                                          (s) => s['classId'] == _targetClassId,
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
                                    value: _targetSectionId,
                                    hint: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 14,
                                      ),
                                      child: Text(
                                        'Auto Assign',
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                              color: colorScheme.outline,
                                            ),
                                      ),
                                    ),
                                    items: available
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
                                        setState(() => _targetSectionId = v),
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

                const SizedBox(height: 20),

                ElevatedButton.icon(
                  onPressed: _isLoadingStudents ? null : _fetchStudents,
                  icon: _isLoadingStudents
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(Icons.sync, size: 18),
                  label: const Text('Fetch & Review Students'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                    minimumSize: const Size(double.infinity, 44),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                  ),
                ),
              ],
            ),
          ),

          if (_students.isNotEmpty) ...[
            const SizedBox(height: 24),

            // Step 2: Candidate Verification
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: colorScheme.primaryFixed,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '2',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Candidate Verification',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
                Text(
                  '${_students.length} Students',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Quick Action Controls
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _selectedStudentIds.length == _students.length,
                        onChanged: (v) {
                          setState(() {
                            if (v == true) {
                              _selectedStudentIds = _students
                                  .map((s) => s['id'].toString())
                                  .toSet();
                            } else {
                              _selectedStudentIds.clear();
                            }
                          });
                        },
                        activeColor: colorScheme.primary,
                        visualDensity: VisualDensity.compact,
                      ),
                      Text(
                        'Select All',
                        style: theme.textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Student List
            ..._students.map((s) {
              final idStr = s['id'].toString();
              final isSelected = _selectedStudentIds.contains(idStr);
              return _buildStudentRow(
                idStr,
                '${s['firstName'] ?? ''} ${s['lastName'] ?? ''}'.trim(),
                s['admissionNumber'] ?? '-',
                'Select to Promote',
                Icons.arrow_right_alt,
                isSelected,
                (v) {
                  setState(() {
                    if (v == true) {
                      _selectedStudentIds.add(idStr);
                    } else {
                      _selectedStudentIds.remove(idStr);
                    }
                  });
                },
                colorScheme,
                theme,
              );
            }).toList(),

            const SizedBox(height: 16),

            // CTA Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.primary.withValues(alpha: 0.12),
                    blurRadius: 32,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: _isPromoting ? null : _promoteStudents,
                    icon: _isPromoting
                        ? const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Icon(Icons.rocket_launch, size: 22),
                    label: Text(
                      'Promote ${_selectedStudentIds.length} Selected Students',
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
                      minimumSize: const Size(double.infinity, 52),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26),
                      ),
                      textStyle: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      elevation: 4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStudentRow(
    String id,
    String name,
    String roll,
    String status,
    IconData statusIcon,
    bool isSelected,
    Function(bool?) onChanged,
    ColorScheme colorScheme,
    ThemeData theme,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Checkbox(
                  value: isSelected,
                  onChanged: onChanged,
                  activeColor: colorScheme.primary,
                  visualDensity: VisualDensity.compact,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: theme.textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            roll,
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '•',
                            style: TextStyle(
                              color: colorScheme.outline,
                              fontSize: 10,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            status,
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
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
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Icon(statusIcon, size: 14, color: colorScheme.onSurfaceVariant),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
