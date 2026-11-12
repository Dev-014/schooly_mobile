import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  bool isStudentLogin = false;
  final phoneController = TextEditingController(text: '0000000000');
  final admissionController = TextEditingController(text: 'STU12345');
  final passwordController = TextEditingController(text: 'password');
  bool isLoading = false;

  Future<void> _handleStaffLogin() async {
    if (phoneController.text.isEmpty) return;
    setState(() => isLoading = true);
    try {
      await ref.read(authProvider.notifier).sendOtp(phoneController.text);
      if (mounted) {
        context.push('/otp', extra: phoneController.text);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  Future<void> _handleStudentLogin() async {
    if (admissionController.text.isEmpty || passwordController.text.isEmpty)
      return;
    setState(() => isLoading = true);
    try {
      await ref
          .read(authProvider.notifier)
          .loginStudent(admissionController.text, passwordController.text);
      if (mounted) {
        context.go('/student/dashboard');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top Banner
            Container(
              height: 240,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              padding: const EdgeInsets.all(24),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Schooly ERP',
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'A unified platform designed for modern educational management and academic excellence.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Login Form Container
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ENTERPRISE PORTAL',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: AppColors.outline,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('Welcome!', style: theme.textTheme.headlineLarge),
                  const SizedBox(height: 8),
                  Text(
                    "When you sign in, our multi-tenant engine checks your active role memberships across all onboarded institutions.",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: AppColors.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Helper Card
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceVariant.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.outlineVariant.withOpacity(0.5),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.verified_user_outlined,
                              size: 16,
                              color: AppColors.primary,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Multi-Tenant Test Profiles (OTP: 1111):',
                              style: theme.textTheme.labelMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        _buildTestProfileRow(
                          '0000000000',
                          'Global Super Admin',
                          theme,
                        ),
                        _buildTestProfileRow(
                          '9999999999',
                          'Single-School Admin',
                          theme,
                        ),
                        _buildTestProfileRow(
                          '8888888888',
                          'Teacher/Staff',
                          theme,
                        ),
                        _buildTestProfileRow(
                          '7777777777',
                          'Parent Profile',
                          theme,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Toggle
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.surfaceVariant.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => isStudentLogin = false),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: !isStudentLogin
                                    ? Colors.white
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(26),
                                boxShadow: !isStudentLogin
                                    ? [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.05),
                                          blurRadius: 8,
                                        ),
                                      ]
                                    : null,
                              ),
                              child: Center(
                                child: Text(
                                  'Staff & Parents',
                                  style: theme.textTheme.labelLarge?.copyWith(
                                    color: !isStudentLogin
                                        ? AppColors.primary
                                        : AppColors.onSurfaceVariant,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => isStudentLogin = true),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: isStudentLogin
                                    ? Colors.white
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(26),
                                boxShadow: isStudentLogin
                                    ? [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.05),
                                          blurRadius: 8,
                                        ),
                                      ]
                                    : null,
                              ),
                              child: Center(
                                child: Text(
                                  'Student Login',
                                  style: theme.textTheme.labelLarge?.copyWith(
                                    color: isStudentLogin
                                        ? AppColors.primary
                                        : AppColors.onSurfaceVariant,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Forms
                  if (!isStudentLogin) ...[
                    Text('Phone Number', style: theme.textTheme.labelMedium),
                    const SizedBox(height: 8),
                    TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: 'Enter 10 digit number',
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: isLoading ? null : _handleStaffLogin,
                        child: isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Text('Send OTP →'),
                      ),
                    ),
                  ] else ...[
                    Text(
                      'Admission Number',
                      style: theme.textTheme.labelMedium,
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: admissionController,
                      decoration: const InputDecoration(
                        hintText: 'e.g. STU12345',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text('Password', style: theme.textTheme.labelMedium),
                    const SizedBox(height: 8),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(hintText: '********'),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: isLoading ? null : _handleStudentLogin,
                        child: isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Text('Login →'),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTestProfileRow(String number, String label, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              number,
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
