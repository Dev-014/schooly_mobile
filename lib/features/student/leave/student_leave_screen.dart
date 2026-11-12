import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';

class StudentLeaveScreen extends StatefulWidget {
  const StudentLeaveScreen({super.key});

  @override
  State<StudentLeaveScreen> createState() => _StudentLeaveScreenState();
}

class _StudentLeaveScreenState extends State<StudentLeaveScreen> {
  String _selectedLeaveType = 'Medical / Sick';
  bool _isHalfDay = false;
  bool _isFileUploaded = false;

  void _submitForm() {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: colorScheme.onSurface.withValues(alpha: 0.4),
      builder: (context) => _buildSuccessModal(context),
    );
  }

  ColorScheme get colorScheme => Theme.of(context).colorScheme;
  ThemeData get theme => Theme.of(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface.withValues(alpha: 0.85),
        elevation: 0,
        scrolledUnderElevation: 1,
        title: Column(
          children: [
            Text(
              'Apply Leave',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Class 10-A',
              style: theme.textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        leading: IconButton(
          icon: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainer,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.arrow_back, size: 20, color: colorScheme.primary),
          ),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Leave Quota & User
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      children: [
                        const TextSpan(text: 'Available Quota: '),
                        TextSpan(
                          text: '3 Casual',
                          style: TextStyle(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(text: ', '),
                        TextSpan(
                          text: '2 Sick',
                          style: TextStyle(
                            color: colorScheme.secondary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryFixed,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.verified,
                        size: 14,
                        color: colorScheme.primary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Aarav S.',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Form container
            Form(
              child: Column(
                children: [
                  // Leave Type
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerLowest,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 4,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: theme.textTheme.labelMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onSurface,
                            ),
                            children: [
                              const TextSpan(text: 'Leave Type '),
                              TextSpan(
                                text: '*',
                                style: TextStyle(color: colorScheme.error),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              _buildLeaveTypePill('Medical / Sick'),
                              const SizedBox(width: 8),
                              _buildLeaveTypePill('Family'),
                              const SizedBox(width: 8),
                              _buildLeaveTypePill('Personal'),
                              const SizedBox(width: 8),
                              _buildLeaveTypePill('Other'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Dates
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerLowest,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 4,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: theme.textTheme.labelMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: colorScheme.onSurface,
                                ),
                                children: [
                                  const TextSpan(text: 'Dates '),
                                  TextSpan(
                                    text: '*',
                                    style: TextStyle(color: colorScheme.error),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: _isHalfDay
                                    ? AppColors.tertiaryFixed
                                    : colorScheme.surfaceContainer,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  if (_isHalfDay)
                                    Icon(
                                      Icons.timelapse,
                                      size: 14,
                                      color: colorScheme.onTertiaryContainer,
                                    ),
                                  if (_isHalfDay) const SizedBox(width: 4),
                                  Text(
                                    _isHalfDay
                                        ? 'Total: 0.5 Day (First Half)'
                                        : '2 Days',
                                    style: theme.textTheme.labelSmall?.copyWith(
                                      color: _isHalfDay
                                          ? colorScheme.onTertiaryContainer
                                          : colorScheme.secondary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'From',
                                    style: theme.textTheme.labelSmall?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: colorScheme.surfaceContainerLow,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '28 Sep 2026',
                                          style: theme.textTheme.labelMedium
                                              ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        Icon(
                                          Icons.calendar_today,
                                          size: 18,
                                          color: colorScheme.outline,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'To',
                                    style: theme.textTheme.labelSmall?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: colorScheme.surfaceContainerLow,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '29 Sep 2026',
                                          style: theme.textTheme.labelMedium
                                              ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        Icon(
                                          Icons.event_available,
                                          size: 18,
                                          color: colorScheme.outline,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Half day only',
                              style: theme.textTheme.bodyMedium,
                            ),
                            Switch(
                              value: _isHalfDay,
                              onChanged: (val) {
                                setState(() {
                                  _isHalfDay = val;
                                });
                              },
                              activeTrackColor: colorScheme.primaryContainer,
                              activeThumbColor: colorScheme.primary,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Reason
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerLowest,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 4,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: theme.textTheme.labelMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onSurface,
                            ),
                            children: [
                              const TextSpan(text: 'Reason '),
                              TextSpan(
                                text: '*',
                                style: TextStyle(color: colorScheme.error),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          maxLines: 2,
                          decoration: InputDecoration(
                            hintText:
                                'Reason for leave (e.g. viral fever, family event)...',
                            hintStyle: theme.textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onSurfaceVariant.withValues(
                                alpha: 0.6,
                              ),
                            ),
                            filled: true,
                            fillColor: colorScheme.surfaceContainerLow,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // File upload
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerLowest,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 4,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isFileUploaded = !_isFileUploaded;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: _isFileUploaded
                              ? AppColors.primaryFixed
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Icon(
                                    _isFileUploaded
                                        ? Icons.description
                                        : Icons.attach_file,
                                    color: _isFileUploaded
                                        ? colorScheme.onPrimaryContainer
                                        : colorScheme.primary,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _isFileUploaded
                                              ? 'dr_prescription_aarav.pdf'
                                              : 'Attach note or doctor slip',
                                          style: theme.textTheme.labelMedium
                                              ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: _isFileUploaded
                                                    ? colorScheme
                                                          .onPrimaryContainer
                                                    : colorScheme.onSurface,
                                              ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          _isFileUploaded
                                              ? '1.2 MB • Attached successfully (Tap to replace)'
                                              : 'PDF or JPG up to 5MB (Optional)',
                                          style: theme.textTheme.bodySmall
                                              ?.copyWith(
                                                fontSize: 11,
                                                color: _isFileUploaded
                                                    ? colorScheme
                                                          .onPrimaryContainer
                                                    : colorScheme
                                                          .onSurfaceVariant,
                                              ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              'Browse',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: _isFileUploaded
                                    ? colorScheme.onPrimaryContainer
                                    : colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Actions
                  ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      elevation: 2,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Submit Application',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.arrow_forward, size: 18),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () => context.pop(),
                    style: TextButton.styleFrom(
                      foregroundColor: colorScheme.onSurfaceVariant,
                      minimumSize: const Size(double.infinity, 40),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLeaveTypePill(String title) {
    final isSelected = _selectedLeaveType == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedLeaveType = title;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.primary
              : colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(20),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: colorScheme.primary.withValues(alpha: 0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Text(
          title,
          style: theme.textTheme.labelMedium?.copyWith(
            color: isSelected ? colorScheme.onPrimary : colorScheme.onSurface,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessModal(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: colorScheme.secondaryContainer,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check_circle,
                color: colorScheme.onSecondaryContainer,
                size: 40,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Leave Applied!',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
                children: [
                  const TextSpan(text: 'Your application for '),
                  TextSpan(
                    text: '28 - 29 Sep 2026',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const TextSpan(text: ' has been routed to Mrs. R. Gupta.'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerLow,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                        children: [
                          const TextSpan(
                            text: 'Class 10-A • Available Quota: ',
                          ),
                          TextSpan(
                            text: '3 Casual',
                            style: TextStyle(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(text: ', '),
                          TextSpan(
                            text: '2 Sick',
                            style: TextStyle(
                              color: colorScheme.secondary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    '#LV-2026-0924',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                context.pop(); // Go back from leave screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                foregroundColor: colorScheme.onPrimary,
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: const Text(
                'View Leave Status',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
