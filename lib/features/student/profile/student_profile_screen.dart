import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';

class StudentProfileScreen extends StatelessWidget {
  const StudentProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: colorScheme.surface.withValues(alpha: 0.9),
        elevation: 0,
        scrolledUnderElevation: 1,
        leading: IconButton(
          icon: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainer,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 20,
              color: colorScheme.onSurface,
            ),
          ),
          onPressed: () => context.pop(),
        ),
        title: Column(
          children: [
            Text(
              'Student Profile',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Academic Year 2026–27',
              style: theme.textTheme.labelSmall?.copyWith(
                color: colorScheme.outline,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainer,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.settings, size: 20, color: colorScheme.primary),
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // AI Assistant Query Capsule Pill
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: AppColors.primaryFixed,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.smart_toy,
                      color: colorScheme.primary,
                      size: 16,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Ask UON to generate Student ID Card or Certificate',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: colorScheme.primary.withValues(alpha: 0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.auto_awesome,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Student Hero Identity Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Avatar
                  Stack(
                    children: [
                      Container(
                        width: 96,
                        height: 96,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              colorScheme.primary,
                              colorScheme.primaryContainer,
                              colorScheme.secondaryContainer,
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: colorScheme.primary.withValues(
                                alpha: 0.18,
                              ),
                              blurRadius: 16,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://i.pravatar.cc/150?img=11',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 4,
                        right: 10,
                        child: Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: colorScheme.secondary,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.surfaceContainerLowest,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 4,
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: colorScheme.primary,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: colorScheme.primary.withValues(
                                  alpha: 0.35,
                                ),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.photo_camera,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Aarav Sharma',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Status & Class Badges
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceContainerHigh,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Roll ID - 21',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                          color: colorScheme.outlineVariant,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryFixed,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Class 10-A',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: colorScheme.onPrimaryContainer,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                          color: colorScheme.outlineVariant,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.secondaryContainer,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                color: colorScheme.secondary,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Active',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: colorScheme.onSecondaryContainer,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      children: [
                        const TextSpan(text: 'Adm No: '),
                        TextSpan(
                          text: 'SCH-2024-884',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        const TextSpan(text: ' • Delhi Public High School'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Digital Student ID Action Button
                  GestureDetector(
                    onTap: () =>
                        _showPersonalDrawer(context, theme, colorScheme),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerLow,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: colorScheme.outlineVariant.withValues(
                            alpha: 0.3,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.verified,
                                color: colorScheme.secondary,
                                size: 20,
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Digital Student ID Verified',
                                    style: theme.textTheme.labelMedium
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Tap to inspect digital card',
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      fontSize: 11,
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'View ID Pass',
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Icon(
                                Icons.arrow_forward,
                                color: colorScheme.primary,
                                size: 16,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Profile Categories Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'PROFILE CATEGORIES',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                Text(
                  '7 Sections',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // List Cards Container
            _buildProfileCategory(
              context,
              'Personal Information',
              'Full Name, DOB, Gender, Blood Group (O+), ID',
              Icons.person,
              AppColors.primaryFixed,
              colorScheme.primary,
              theme,
              colorScheme,
              onTap: () => _showPersonalDrawer(context, theme, colorScheme),
            ),
            _buildProfileCategory(
              context,
              'Academic Details',
              'Session 2026–27, Class 10-A, House Falcon, CBSE',
              Icons.school,
              colorScheme.surfaceContainerHigh,
              colorScheme.primary,
              theme,
              colorScheme,
            ),
            _buildProfileCategory(
              context,
              'Parent & Guardian',
              'Rajesh Sharma (Father), Sunita Sharma (Mother)',
              Icons.family_restroom,
              colorScheme.secondaryContainer.withValues(alpha: 0.5),
              colorScheme.secondary,
              theme,
              colorScheme,
            ),
            _buildProfileCategory(
              context,
              'Address Details',
              'B-402, Green Park Avenue, New Delhi, PIN 110016',
              Icons.location_on,
              AppColors.tertiaryFixed,
              colorScheme.tertiary,
              theme,
              colorScheme,
            ),
            _buildProfileCategory(
              context,
              'Contact Information',
              'student.aarav@schooly.edu • +91 98765 43210',
              Icons.contact_phone,
              colorScheme.surfaceContainer,
              colorScheme.primary,
              theme,
              colorScheme,
            ),
            _buildProfileCategory(
              context,
              'School & Campus Info',
              'Delhi Public High School, Main Campus, Branch #04',
              Icons.apartment,
              colorScheme.surfaceContainer,
              colorScheme.onSurfaceVariant,
              theme,
              colorScheme,
            ),
            _buildProfileCategory(
              context,
              'Account & Security',
              'Password, 2FA, Login Devices & Privacy',
              Icons.verified_user,
              AppColors.primaryFixed,
              colorScheme.primary,
              theme,
              colorScheme,
              isProtected: true,
            ),

            const SizedBox(height: 24),

            // Account & Security Section
            Text(
              'ACCOUNT & SECURITY',
              style: theme.textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 8),

            Container(
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: colorScheme.surfaceContainerLow),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildSecurityItem(
                    'Change Password',
                    Icons.key,
                    theme,
                    colorScheme,
                  ),
                  Divider(
                    height: 1,
                    color: colorScheme.surfaceContainerLow,
                    indent: 16,
                    endIndent: 16,
                  ),
                  _buildSecurityItem(
                    'Notification Preferences',
                    Icons.notifications_active,
                    theme,
                    colorScheme,
                    trailing: _buildBadge(
                      'Enabled',
                      AppColors.secondaryFixed,
                      colorScheme.onSecondaryContainer,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: colorScheme.surfaceContainerLow,
                    indent: 16,
                    endIndent: 16,
                  ),
                  _buildSecurityItem(
                    'Login Devices & Security',
                    Icons.shield,
                    theme,
                    colorScheme,
                    subtitle: '1 Active Device • Android',
                    trailing: Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: colorScheme.secondary,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 4),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Log Out Soft Red Danger Button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.errorContainer,
                foregroundColor: colorScheme.onErrorContainer,
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 1,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.logout, size: 20),
                  const SizedBox(width: 8),
                  const Text(
                    'Log Out Account',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCategory(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Color iconBg,
    Color iconColor,
    ThemeData theme,
    ColorScheme colorScheme, {
    bool isProtected = false,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(16),
          border: isProtected
              ? Border.all(
                  color: colorScheme.outlineVariant.withValues(alpha: 0.3),
                )
              : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 16,
              offset: const Offset(0, 4),
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
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: iconBg,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(icon, color: iconColor, size: 22),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              title,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (isProtected) ...[
                              const SizedBox(width: 8),
                              _buildBadge(
                                'Protected',
                                colorScheme.secondaryContainer,
                                colorScheme.onSecondaryContainer,
                              ),
                            ],
                          ],
                        ),
                        Text(
                          subtitle,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
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
            Icon(Icons.chevron_right, color: colorScheme.outline, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSecurityItem(
    String title,
    IconData icon,
    ThemeData theme,
    ColorScheme colorScheme, {
    String? subtitle,
    Widget? trailing,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: colorScheme.onSurfaceVariant,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              if (trailing != null) trailing,
              Icon(Icons.chevron_right, color: colorScheme.outline, size: 18),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(String text, Color bg, Color fg) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 10, color: fg, fontWeight: FontWeight.bold),
      ),
    );
  }

  void _showPersonalDrawer(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLowest,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 48,
                height: 6,
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.primaryFixed,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Icon(
                          Icons.person,
                          color: colorScheme.primary,
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Personal Information',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Verified Student Master Record',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainer,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.close,
                        size: 18,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    onPressed: () => context.pop(),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Icon(Icons.lock, color: colorScheme.primary, size: 18),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'View Only — Official registrar records can only be updated by the School Administrative Office.',
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 2.2,
                children: [
                  _buildDetailItem(
                    'Full Legal Name',
                    'Aarav Sharma',
                    theme,
                    colorScheme,
                  ),
                  _buildDetailItem(
                    'Date of Birth',
                    '14 Aug 2010',
                    theme,
                    colorScheme,
                  ),
                  _buildDetailItem('Gender', 'Male', theme, colorScheme),
                  _buildDetailItem(
                    'Blood Group',
                    'O Positive',
                    theme,
                    colorScheme,
                    suffix: _buildBadge(
                      'O+',
                      AppColors.tertiaryFixed,
                      colorScheme.onTertiaryContainer,
                    ),
                  ),
                  _buildDetailItem(
                    'Admission No',
                    'SCH-2024-884',
                    theme,
                    colorScheme,
                  ),
                  _buildDetailItem(
                    'System Student ID',
                    'STU-99214',
                    theme,
                    colorScheme,
                    valueColor: colorScheme.primary,
                  ),
                  _buildDetailItem(
                    'Class Roll No',
                    '21 (Section A)',
                    theme,
                    colorScheme,
                  ),
                  _buildDetailItem(
                    'National Identity',
                    'XXXX-XXXX-4912',
                    theme,
                    colorScheme,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => context.pop(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorScheme.primary,
                        foregroundColor: colorScheme.onPrimary,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        elevation: 2,
                      ),
                      child: const Text(
                        'Done Viewing',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainer,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.contact_support,
                        color: colorScheme.primary,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDetailItem(
    String title,
    String value,
    ThemeData theme,
    ColorScheme colorScheme, {
    Color? valueColor,
    Widget? suffix,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: theme.textTheme.labelSmall?.copyWith(
              fontSize: 10,
              color: colorScheme.onSurfaceVariant,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 2),
          Row(
            children: [
              Text(
                value,
                style: theme.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: valueColor ?? colorScheme.onSurface,
                ),
              ),
              if (suffix != null) const SizedBox(width: 6),
              if (suffix != null) suffix,
            ],
          ),
        ],
      ),
    );
  }
}
