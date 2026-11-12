import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/auth/permissions.dart';
import '../../../core/auth/user_permissions.dart';
import '../../auth/providers/auth_provider.dart';

class ParentFeesScreen extends ConsumerWidget {
  const ParentFeesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final user = ref.watch(authProvider);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface.withValues(alpha: 0.85),
        elevation: 0,
        scrolledUnderElevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.school,
                color: colorScheme.onPrimaryContainer,
                size: 22,
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PARENT PORTAL',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    fontSize: 9,
                  ),
                ),
                Text(
                  'Fees & Payments',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Stack(
              children: [
                const Icon(Icons.notifications_outlined),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color(0xFFA33900),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {},
          ),
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHigh,
              shape: BoxShape.circle,
            ),
            child: const CircleAvatar(
              radius: 14,
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Child context pill
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 4,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 18,
                      backgroundColor: Color(0xFFCCE5FF),
                      child: Text(
                        'AP',
                        style: TextStyle(
                          color: Color(0xFF006194),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            'Arun Patel',
                            style: theme.textTheme.labelLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '•',
                            style: TextStyle(color: colorScheme.outline),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Class 7-A',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainer,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.swap_horiz,
                            size: 14,
                            color: colorScheme.primary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Switch',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 2. Outstanding Total Hero Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [colorScheme.primary, colorScheme.primaryContainer],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.primary.withValues(alpha: 0.22),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    // Decorative circle
                    Positioned(
                      right: -32,
                      top: -32,
                      child: Container(
                        width: 176,
                        height: 176,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.10),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Outstanding Total',
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: Colors.white.withValues(alpha: 0.8),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '₹15,000',
                                  style: theme.textTheme.displaySmall?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: -0.5,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.20),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 6,
                                    height: 6,
                                    decoration: const BoxDecoration(
                                      color: Color(
                                        0xFFFFB599,
                                      ), // tertiary-fixed
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    'Due by 15 Sep 2026',
                                    style: theme.textTheme.labelSmall?.copyWith(
                                      color: colorScheme.onPrimary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Pay Total button
                        if (user?.hasPermission(
                              Permissions.fees.feeInvoice.edit,
                            ) ??
                            false) ...[
                          ElevatedButton.icon(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: colorScheme.primary,
                              minimumSize: const Size(double.infinity, 48),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              elevation: 2,
                            ),
                            icon: const Icon(Icons.lock, size: 20),
                            label: const Text(
                              'Pay Total ₹15,000',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),
                        ],

                        // Progress
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Fee Progress',
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: Colors.white.withValues(alpha: 0.9),
                                  ),
                                ),
                                Text(
                                  '₹45,000 of ₹60,000 paid (75%)',
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: const Color(
                                      0xFF7FFC97,
                                    ), // secondary-fixed
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: LinearProgressIndicator(
                                value: 0.75,
                                minHeight: 6,
                                backgroundColor: Colors.white.withValues(
                                  alpha: 0.20,
                                ),
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  Color(0xFF7FFC97),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // 3. Pending Invoices
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pending Invoices',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '2 invoices pending',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: const Color(0xFFA33900),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _InvoiceCard(
                    icon: Icons.school,
                    title: 'Tuition Fee (Q2)',
                    subtitle: 'Jul – Sep 2026',
                    amount: '₹12,000',
                    canPay:
                        user?.hasPermission(Permissions.fees.feeInvoice.edit) ??
                        false,
                    onPay: () {},
                  ),
                  const SizedBox(height: 10),
                  _InvoiceCard(
                    icon: Icons.directions_bus,
                    title: 'Transport Fee',
                    subtitle: 'Sep 2026 • Route 14',
                    amount: '₹3,000',
                    canPay:
                        user?.hasPermission(Permissions.fees.feeInvoice.edit) ??
                        false,
                    onPay: () {},
                  ),
                ],
              ),
            ),

            // 4. Payment History
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Payment History',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Text(
                          'View All',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: colorScheme.primary,
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          size: 16,
                          color: colorScheme.primary,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _PaymentHistoryItem(
                    title: 'Tuition Fee (Q1)',
                    subtitle: 'Apr – Jun 2026',
                    amount: '₹12,000',
                    date: '02 Apr 2026',
                    isSuccess: true,
                  ),
                  const SizedBox(height: 10),
                  _PaymentHistoryItem(
                    title: 'Annual Fee',
                    subtitle: 'Academic Year 2026–27',
                    amount: '₹21,000',
                    date: '15 Mar 2026',
                    isSuccess: true,
                  ),
                  const SizedBox(height: 10),
                  _PaymentHistoryItem(
                    title: 'Tuition Fee (Q4)',
                    subtitle: 'Jan – Mar 2026',
                    amount: '₹12,000',
                    date: '03 Jan 2026',
                    isSuccess: true,
                  ),
                ],
              ),
            ),

            // 5. Quick Actions
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Text(
                'Quick Actions',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  if (user?.hasPermission(
                        Permissions.income.transaction.view,
                      ) ??
                      false) ...[
                    Expanded(
                      child: _QuickActionButton(
                        icon: Icons.receipt_long,
                        label: 'Download\nReceipt',
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                  if (user?.hasPermission(Permissions.fees.feeInvoice.edit) ??
                      false) ...[
                    Expanded(
                      child: _QuickActionButton(
                        icon: Icons.account_balance,
                        label: 'Bank\nTransfer',
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                  if (user?.hasPermission(Permissions.support.ticket.edit) ??
                      false) ...[
                    Expanded(
                      child: _QuickActionButton(
                        icon: Icons.support_agent,
                        label: 'Contact\nAccounts',
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                  if (user?.hasPermission(Permissions.fees.feeInvoice.view) ??
                      false) ...[
                    Expanded(
                      child: _QuickActionButton(
                        icon: Icons.calculate,
                        label: 'Fee\nBreakup',
                        onTap: () {},
                      ),
                    ),
                  ],
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 6. Fee Breakup Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: colorScheme.surfaceContainer),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.02),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.pie_chart_outline,
                          size: 18,
                          color: colorScheme.primary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Annual Fee Breakup',
                          style: theme.textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _BreakupRow(
                      label: 'Tuition Fee (Annual)',
                      amount: '₹48,000',
                      colorScheme: colorScheme,
                    ),
                    _BreakupRow(
                      label: 'Transport Fee',
                      amount: '₹8,400',
                      colorScheme: colorScheme,
                    ),
                    _BreakupRow(
                      label: 'Activity / Sports Fee',
                      amount: '₹2,400',
                      colorScheme: colorScheme,
                    ),
                    _BreakupRow(
                      label: 'Annual Day & Events',
                      amount: '₹1,200',
                      colorScheme: colorScheme,
                    ),
                    const Divider(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Annual Fee',
                          style: theme.textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '₹60,000',
                          style: theme.textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.primary,
                          ),
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
    );
  }
}

// ─── Invoice Card ────────────────────────────────────────────────────────────

class _InvoiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String amount;
  final bool canPay;
  final VoidCallback onPay;

  const _InvoiceCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.canPay,
    required this.onPay,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.primaryFixed,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: colorScheme.primary, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subtitle,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: theme.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          if (canPay) ...[
            const SizedBox(width: 12),
            ElevatedButton(
              onPressed: onPay,
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                foregroundColor: colorScheme.onPrimary,
                minimumSize: const Size(0, 36),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 1,
              ),
              child: const Text(
                'Pay',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ─── Payment History Item ─────────────────────────────────────────────────────

class _PaymentHistoryItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount;
  final String date;
  final bool isSuccess;

  const _PaymentHistoryItem({
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.date,
    this.isSuccess = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isSuccess
                  ? colorScheme.secondaryContainer.withValues(alpha: 0.5)
                  : colorScheme.errorContainer,
              shape: BoxShape.circle,
            ),
            child: Icon(
              isSuccess ? Icons.check_circle_outline : Icons.error_outline,
              color: isSuccess ? colorScheme.secondary : colorScheme.error,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subtitle,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: theme.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.secondary,
                ),
              ),
              Text(
                date,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Quick Action Button ──────────────────────────────────────────────────────

class _QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: colorScheme.surfaceContainer.withValues(alpha: 0.5),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.02),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.primaryFixed.withValues(alpha: 0.6),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: colorScheme.primary, size: 20),
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: theme.textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w600,
                height: 1.3,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Fee Breakup Row ──────────────────────────────────────────────────────────

class _BreakupRow extends StatelessWidget {
  final String label;
  final String amount;
  final ColorScheme colorScheme;

  const _BreakupRow({
    required this.label,
    required this.amount,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: colorScheme.primary.withValues(alpha: 0.5),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  color: colorScheme.onSurfaceVariant,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          Text(
            amount,
            style: TextStyle(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
