import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../auth/providers/auth_provider.dart';

import 'providers/student_admission_provider.dart';

class AdminStudentAdmissionScreen extends ConsumerStatefulWidget {
  const AdminStudentAdmissionScreen({super.key});

  @override
  ConsumerState<AdminStudentAdmissionScreen> createState() =>
      _AdminStudentAdmissionScreenState();
}

class _AdminStudentAdmissionScreenState
    extends ConsumerState<AdminStudentAdmissionScreen> {
  String get _schoolId =>
      ref.read(authProvider)?.schoolId?.toString() ?? '1000';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final formState = ref.watch(studentAdmissionFormControllerProvider);
    final formNotifier = ref.read(
      studentAdmissionFormControllerProvider.notifier,
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeaderBanner(theme, colorScheme),
          const SizedBox(height: 16),

          // Section 1: Student Info
          _buildFormSection(
            '1',
            'Student Info',
            colorScheme,
            theme,
            children: [
              _buildTextField(
                'First Name *',
                'e.g. Alexander',
                theme,
                formState.firstName,
                (v) =>
                    formNotifier.updateField((s) => s.copyWith(firstName: v)),
              ),
              const SizedBox(height: 12),
              _buildTextField(
                'Last Name *',
                'e.g. Hamilton',
                theme,
                formState.lastName,
                (v) => formNotifier.updateField((s) => s.copyWith(lastName: v)),
              ),
              const SizedBox(height: 12),
              _buildTextField(
                'Date of Birth *',
                'YYYY-MM-DD',
                theme,
                formState.dob,
                (v) => formNotifier.updateField((s) => s.copyWith(dob: v)),
                icon: Icons.calendar_month,
              ),
              const SizedBox(height: 12),
              _buildTextField(
                'Aadhaar Number',
                '12-digit Aadhaar',
                theme,
                formState.aadhaar,
                (v) => formNotifier.updateField((s) => s.copyWith(aadhaar: v)),
              ),
              const SizedBox(height: 12),
              _buildDropdown(
                'Gender *',
                theme,
                ['Male', 'Female', 'Other'],
                formState.gender,
                (v) => formNotifier.updateField(
                  (s) => s.copyWith(gender: v ?? ''),
                ),
              ),
              const SizedBox(height: 12),
              _buildAsyncDropdown(
                'Category',
                theme,
                ref.watch(categoriesProvider(_schoolId)),
                formState.categoryId,
                (v) => formNotifier.updateField(
                  (s) => s.copyWith(categoryId: v ?? ''),
                ),
              ),
              const SizedBox(height: 12),
              _buildAsyncDropdown(
                'Academic Year',
                theme,
                ref.watch(academicYearsProvider(_schoolId)),
                formState.academicYearId,
                (v) => formNotifier.updateField(
                  (s) => s.copyWith(academicYearId: v ?? ''),
                ),
              ),
              const SizedBox(height: 12),
              _buildAsyncDropdown(
                'Class',
                theme,
                ref.watch(classesProvider(_schoolId)),
                formState.classId,
                (v) {
                  formNotifier.updateField(
                    (s) => s.copyWith(classId: v ?? '', sectionId: ''),
                  );
                },
              ),
              const SizedBox(height: 12),
              _buildAsyncDropdown(
                'Section',
                theme,
                ref.watch(sectionsProvider(_schoolId, formState.classId)),
                formState.sectionId,
                (v) => formNotifier.updateField(
                  (s) => s.copyWith(sectionId: v ?? ''),
                ),
              ),
              const SizedBox(height: 12),
              _buildAsyncDropdown(
                'Student House',
                theme,
                ref.watch(housesProvider(_schoolId)),
                formState.houseId,
                (v) => formNotifier.updateField(
                  (s) => s.copyWith(houseId: v ?? ''),
                ),
              ),
              const SizedBox(height: 12),
              _buildDropdown(
                'Blood Group',
                theme,
                ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'],
                formState.bloodGroup,
                (v) => formNotifier.updateField(
                  (s) => s.copyWith(bloodGroup: v ?? ''),
                ),
              ),
              const SizedBox(height: 12),
              _buildTextField(
                'Religion',
                'e.g. Hinduism',
                theme,
                formState.religion,
                (v) => formNotifier.updateField((s) => s.copyWith(religion: v)),
              ),
              const SizedBox(height: 12),
              _buildTextField(
                'Nationality',
                'e.g. Indian',
                theme,
                formState.nationality,
                (v) =>
                    formNotifier.updateField((s) => s.copyWith(nationality: v)),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Section 2: Family Info
          _buildFormSection(
            '2',
            'Family Information',
            colorScheme,
            theme,
            children: [
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: Text(
                        'New Family',
                        style: theme.textTheme.bodySmall,
                      ),
                      value: 'new',
                      groupValue: formState.familyType,
                      onChanged: (v) => formNotifier.updateField(
                        (s) => s.copyWith(familyType: v ?? 'new'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: Text(
                        'Existing Family',
                        style: theme.textTheme.bodySmall,
                      ),
                      value: 'existing',
                      groupValue: formState.familyType,
                      onChanged: (v) => formNotifier.updateField(
                        (s) => s.copyWith(familyType: v ?? 'existing'),
                      ),
                    ),
                  ),
                ],
              ),
              if (formState.familyType == 'existing') ...[
                const SizedBox(height: 12),
                _buildTextField(
                  'Search Family (Code)',
                  'Search...',
                  theme,
                  formState.familySearchQuery,
                  (v) => formNotifier.updateField(
                    (s) => s.copyWith(familySearchQuery: v),
                  ),
                ),
                const SizedBox(height: 12),
                _buildTextField(
                  'Selected Family ID',
                  'Family ID',
                  theme,
                  formState.familyId,
                  (v) =>
                      formNotifier.updateField((s) => s.copyWith(familyId: v)),
                ),
              ] else ...[
                const SizedBox(height: 12),
                Text(
                  'A new family will be created and this student will be linked to it automatically.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ],
          ),

          const SizedBox(height: 16),

          // Section 3: Parent/Guardian
          _buildFormSection(
            '3',
            'Parent/Guardian',
            colorScheme,
            theme,
            children: [
              _buildTextField(
                'Guardian Name *',
                'Full Name',
                theme,
                formState.parentName,
                (v) =>
                    formNotifier.updateField((s) => s.copyWith(parentName: v)),
              ),
              const SizedBox(height: 12),
              _buildTextField(
                'Phone Number *',
                '10-digit mobile',
                theme,
                formState.parentPhone,
                (v) =>
                    formNotifier.updateField((s) => s.copyWith(parentPhone: v)),
                icon: Icons.phone,
              ),
              const SizedBox(height: 12),
              _buildTextField(
                'Email Address',
                'guardian@example.com',
                theme,
                formState.parentEmail,
                (v) =>
                    formNotifier.updateField((s) => s.copyWith(parentEmail: v)),
                icon: Icons.email,
              ),
              const SizedBox(height: 12),
              _buildTextField(
                'Relation',
                'e.g. Father',
                theme,
                formState.relation,
                (v) => formNotifier.updateField((s) => s.copyWith(relation: v)),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Checkbox(
                    value: formState.sameAsFather,
                    onChanged: (v) => formNotifier.setSameAsFather(v ?? false),
                  ),
                  Text(
                    'Same as Guardian (for mother details)',
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _buildTextField(
                'Mother Name',
                'Full Name',
                theme,
                formState.motherName,
                (v) =>
                    formNotifier.updateField((s) => s.copyWith(motherName: v)),
                enabled: !formState.sameAsFather,
              ),
              const SizedBox(height: 12),
              _buildTextField(
                'Mother Phone',
                '10-digit mobile',
                theme,
                formState.motherPhone,
                (v) =>
                    formNotifier.updateField((s) => s.copyWith(motherPhone: v)),
                enabled: !formState.sameAsFather,
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Section 4: Previous School
          _buildFormSection(
            '4',
            'Previous School',
            colorScheme,
            theme,
            children: [
              _buildTextField(
                'Previous School Name',
                'Enter school name',
                theme,
                formState.previousSchool,
                (v) => formNotifier.updateField(
                  (s) => s.copyWith(previousSchool: v),
                ),
              ),
              const SizedBox(height: 12),
              _buildTextField(
                'Last Grade Attended',
                'e.g. Grade 7',
                theme,
                formState.lastGradeAttended,
                (v) => formNotifier.updateField(
                  (s) => s.copyWith(lastGradeAttended: v),
                ),
              ),
              const SizedBox(height: 12),
              _buildTextField(
                'Transfer Certificate No.',
                'TC-XXXXX',
                theme,
                formState.transferCertificateNo,
                (v) => formNotifier.updateField(
                  (s) => s.copyWith(transferCertificateNo: v),
                ),
              ),
              const SizedBox(height: 12),
              _buildTextField(
                'Pincode',
                '6-digit pincode',
                theme,
                formState.pincode,
                (v) => formNotifier.updateField((s) => s.copyWith(pincode: v)),
              ),
              const SizedBox(height: 12),
              _buildTextField(
                'City',
                'City',
                theme,
                formState.city,
                (v) => formNotifier.updateField((s) => s.copyWith(city: v)),
              ),
              const SizedBox(height: 12),
              _buildTextField(
                'State',
                'State',
                theme,
                formState.state,
                (v) => formNotifier.updateField((s) => s.copyWith(state: v)),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Section 5: Documents
          _buildFormSection(
            '5',
            'Documents',
            colorScheme,
            theme,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer.withValues(alpha: 0.3),
                  border: Border.all(
                    color: colorScheme.primary.withValues(alpha: 0.4),
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerLowest,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.cloud_upload,
                        color: colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Tap to upload student documents',
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Supports PDF, JPG, PNG up to 5MB',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add_circle, size: 16),
                      label: const Text('Browse Files'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorScheme.primary,
                        foregroundColor: colorScheme.onPrimary,
                        elevation: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Action Buttons
          Row(
            children: [
              Expanded(
                flex: 1,
                child: TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Draft Saved')),
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: colorScheme.surfaceContainerHigh,
                    foregroundColor: colorScheme.onSurface,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Save Draft',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: ElevatedButton.icon(
                  onPressed: () async {
                    try {
                      await formNotifier.submit(_schoolId);
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Student Admission Created'),
                          ),
                        );
                      }
                    } catch (e) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Error: $e'),
                            backgroundColor: theme.colorScheme.error,
                          ),
                        );
                      }
                    }
                  },
                  icon: const Icon(Icons.how_to_reg, size: 20),
                  label: const Text('Complete Enrollment'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    elevation: 4,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderBanner(ThemeData theme, ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'New Student Admission',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Complete student profile and enrollment data',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFormSection(
    String step,
    String title,
    ColorScheme colorScheme,
    ThemeData theme, {
    required List<Widget> children,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    step,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }

  Widget _buildTextField(
    String label,
    String hint,
    ThemeData theme,
    String value,
    Function(String) onChanged, {
    IconData? icon,
    bool enabled = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          initialValue: value,
          onChanged: onChanged,
          enabled: enabled,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: theme.colorScheme.outline),
            prefixIcon: icon != null
                ? Icon(icon, size: 18, color: theme.colorScheme.outline)
                : null,
            filled: true,
            fillColor: theme.colorScheme.surfaceContainerLow,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown(
    String label,
    ThemeData theme,
    List<String> items,
    String value,
    Function(String?) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        DropdownButtonFormField<String>(
          value: value.isEmpty ? null : value,
          items: items
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            filled: true,
            fillColor: theme.colorScheme.surfaceContainerLow,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAsyncDropdown(
    String label,
    ThemeData theme,
    AsyncValue<List<dynamic>> asyncItems,
    String value,
    Function(String?) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        asyncItems.when(
          data: (items) {
            return DropdownButtonFormField<String>(
              value: value.isEmpty ? null : value,
              items: items.map((e) {
                final id = e['id'].toString();
                final name =
                    e['name']?.toString() ?? e['displayName']?.toString() ?? id;
                return DropdownMenuItem(value: id, child: Text(name));
              }).toList(),
              onChanged: onChanged,
              decoration: InputDecoration(
                filled: true,
                fillColor: theme.colorScheme.surfaceContainerLow,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            );
          },
          loading: () => const CircularProgressIndicator(),
          error: (err, stack) => Text('Error loading options: $err'),
        ),
      ],
    );
  }
}
