import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../auth/providers/auth_provider.dart';

import 'providers/admin_student_directory_provider.dart';

class AdminStudentInformationScreen extends ConsumerStatefulWidget {
  const AdminStudentInformationScreen({super.key});

  @override
  ConsumerState<AdminStudentInformationScreen> createState() =>
      _AdminStudentInformationScreenState();
}

class _AdminStudentInformationScreenState
    extends ConsumerState<AdminStudentInformationScreen> {
  String get _schoolId =>
      ref.read(authProvider)?.schoolId?.toString() ?? '1000';
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final studentsAsync = ref.watch(studentDirectoryProvider(_schoolId));

    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Overview Section
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: colorScheme.primary,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Academic Year 2026–27',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: colorScheme.onPrimaryContainer,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainer,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.download_for_offline,
                        size: 18,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  'Student Information',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Manage enrollments, directories, houses, and admission workflows.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),

                const SizedBox(height: 16),

                // Quick KPI Stats Bar
                Row(
                  children: [
                    Expanded(
                      child: _buildKpiCard(
                        'Total Students',
                        '...',
                        '+4.2% YoY',
                        Icons.groups,
                        colorScheme.primary,
                        colorScheme.primary,
                        colorScheme,
                        theme,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildKpiCard(
                        'Boys',
                        '...',
                        '53.5% ratio',
                        Icons.male,
                        colorScheme.primary,
                        colorScheme.onSurfaceVariant,
                        colorScheme,
                        theme,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildKpiCard(
                        'Girls',
                        '...',
                        '46.5% ratio',
                        Icons.female,
                        colorScheme.tertiary,
                        colorScheme.tertiary,
                        colorScheme,
                        theme,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // Quick Search & Filter Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (v) => setState(() => _searchQuery = v),
                        decoration: InputDecoration(
                          hintText: 'Search student by name, reg...',
                          prefixIcon: Icon(
                            Icons.search,
                            color: colorScheme.outline,
                          ),
                          filled: true,
                          fillColor: colorScheme.surfaceContainerLowest,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: colorScheme.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.search, color: colorScheme.onPrimary),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Student Directory List
                studentsAsync.when(
                  data: (students) {
                    final filtered = students.where((s) {
                      final q = _searchQuery.toLowerCase();
                      final n = "${s['firstName']} ${s['lastName']}"
                          .toLowerCase();
                      final r =
                          s['admissionNumber']?.toString().toLowerCase() ?? '';
                      return n.contains(q) || r.contains(q);
                    }).toList();

                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Showing ${filtered.length} Students',
                              style: theme.textTheme.labelMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        if (filtered.isEmpty)
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.all(32),
                              child: Text('No students found'),
                            ),
                          )
                        else
                          ...filtered.map((s) {
                            return _buildStudentCard(s, colorScheme, theme);
                          }),
                      ],
                    );
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (e, st) => Center(child: Text('Error: $e')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKpiCard(
    String label,
    String val,
    String badge,
    IconData icon,
    Color iconColor,
    Color badgeColor,
    ColorScheme colorScheme,
    ThemeData theme,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 4),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, size: 16, color: iconColor),
              Text(
                badge,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: badgeColor,
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            val,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              height: 1,
            ),
          ),
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStudentCard(
    Map<String, dynamic> s,
    ColorScheme colorScheme,
    ThemeData theme,
  ) {
    final firstName = s['firstName'] ?? '';
    final lastName = s['lastName'] ?? '';
    final name = "$firstName $lastName".trim();
    final initials =
        "${firstName.isNotEmpty ? firstName[0] : ''}${lastName.isNotEmpty ? lastName[0] : ''}"
            .toUpperCase();
    final regNo = s['admissionNumber'] ?? s['admissionNo'] ?? 'N/A';
    final grade =
        s['className'] ??
        s['classGroupName'] ??
        s['classId']?.toString() ??
        'N/A';
    final status = s['status'] ?? 'ACTIVE';
    final guardianName = s['guardianName'] ?? s['fatherName'] ?? 'N/A';
    final guardianPhone =
        s['guardianPhone'] ?? s['fatherPhone'] ?? s['phone'] ?? 'N/A';

    // Ensure grade doesn't just say a number, prefix with Grade if it's just a number
    final displayGrade = (int.tryParse(grade) != null) ? 'Grade $grade' : grade;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: colorScheme.primary.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          initials,
                          style: theme.textTheme.headlineMedium?.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    if (status == 'ACTIVE')
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: const BoxDecoration(
                              color: Color(0xFF69F0AE),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.check,
                              color: Color(0xFF1B5E20),
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Row(
                  children: [
                    Icon(
                      Icons.vpn_key_outlined,
                      color: colorScheme.onSurfaceVariant,
                      size: 24,
                    ),
                    const SizedBox(width: 12),
                    Icon(
                      Icons.more_vert,
                      color: colorScheme.onSurfaceVariant,
                      size: 24,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            name,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            regNo,
            style: theme.textTheme.titleMedium?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest.withValues(
                    alpha: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  displayGrade,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF69F0AE),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  status.toUpperCase(),
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: const Color(0xFF1B5E20),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Divider(color: colorScheme.outlineVariant.withValues(alpha: 0.3)),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'GUARDIAN',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    guardianName,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.phone_outlined,
                        size: 16,
                        color: colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        guardianPhone,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF69F0AE),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'ACTIVE',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: const Color(0xFF1B5E20),
                    fontWeight: FontWeight.bold,
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
