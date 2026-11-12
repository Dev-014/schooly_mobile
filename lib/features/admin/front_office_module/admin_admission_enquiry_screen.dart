import 'forms/add_enquiry_form.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/front_office_providers.dart';
import 'package:flutter/material.dart';

class AdminAdmissionEnquiryScreen extends ConsumerWidget {
  const AdminAdmissionEnquiryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final asyncData = ref.watch(enquiriesProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Daily Pulse Greeting & Metric Card
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromRGBO(0, 97, 148, 0.06),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                  spreadRadius: -4,
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  right: -24,
                  bottom: -24,
                  child: Container(
                    width: 112,
                    height: 112,
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer.withValues(
                        alpha: 0.1,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      color: colorScheme.surfaceContainerLow.withValues(
                        alpha: 0.4,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: colorScheme.primaryContainer,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.desk,
                                  color: colorScheme.onPrimaryContainer,
                                  size: 18,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Today's Front Desk",
                                    style: theme.textTheme.titleMedium
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Live operations • Oct 24, 2024",
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
                                  "Open",
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
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: colorScheme.surfaceContainerLow,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'TOTAL ENQUIRIES',
                                        style: theme.textTheme.labelSmall
                                            ?.copyWith(
                                              color:
                                                  colorScheme.onSurfaceVariant,
                                              fontSize: 10,
                                              letterSpacing: 1.2,
                                            ),
                                      ),
                                      Icon(
                                        Icons.contact_support,
                                        color: colorScheme.primary,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '42',
                                    style: theme.textTheme.headlineMedium
                                        ?.copyWith(
                                          color: colorScheme.primary,
                                          fontWeight: FontWeight.bold,
                                          height: 1.0,
                                        ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Active this term',
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: colorScheme.surfaceContainerLow,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'DUE FOLLOW-UPS',
                                        style: theme.textTheme.labelSmall
                                            ?.copyWith(
                                              color:
                                                  colorScheme.onSurfaceVariant,
                                              fontSize: 10,
                                              letterSpacing: 1.2,
                                            ),
                                      ),
                                      Icon(
                                        Icons.schedule,
                                        color: colorScheme.tertiary,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '18',
                                        style: theme.textTheme.headlineMedium
                                            ?.copyWith(
                                              color: colorScheme.tertiary,
                                              fontWeight: FontWeight.bold,
                                              height: 1.0,
                                            ),
                                      ),
                                      const SizedBox(width: 6),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 6,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: colorScheme.tertiaryContainer
                                              .withValues(alpha: 0.3),
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Text(
                                          '4 Today',
                                          style: theme.textTheme.labelSmall
                                              ?.copyWith(
                                                color: colorScheme.tertiary,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Requires call action',
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Primary Action Button
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => const AddEnquiryForm(),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
              minimumSize: const Size.fromHeight(52),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(26),
              ),
              elevation: 4,
              shadowColor: colorScheme.primary.withValues(alpha: 0.4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.person_add, size: 20),
                const SizedBox(width: 8),
                const Text(
                  '+ New Admission Enquiry',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Search Input
          Container(
            height: 48,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search parent name, student, phone...',
                hintStyle: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  size: 20,
                  color: colorScheme.onSurfaceVariant,
                ),
                suffixIcon: Icon(
                  Icons.mic,
                  size: 18,
                  color: colorScheme.onSurfaceVariant,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Quick Filter Pills
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildFilterPill(
                  'All Enquiries',
                  '42',
                  colorScheme.primary,
                  colorScheme.onPrimary,
                  colorScheme.onPrimary.withValues(alpha: 0.2),
                  colorScheme.onPrimary,
                  theme,
                ),
                _buildFilterPill(
                  'New / Open',
                  '14',
                  colorScheme.surfaceContainerLowest,
                  colorScheme.onSurfaceVariant,
                  colorScheme.surfaceContainerHigh,
                  colorScheme.onSurface,
                  theme,
                ),
                _buildFilterPill(
                  'Follow-up',
                  '18',
                  colorScheme.surfaceContainerLowest,
                  colorScheme.onSurfaceVariant,
                  colorScheme.tertiaryContainer.withValues(alpha: 0.3),
                  colorScheme.tertiary,
                  theme,
                ),
                _buildFilterPill(
                  'Converted',
                  '10',
                  colorScheme.surfaceContainerLowest,
                  colorScheme.onSurfaceVariant,
                  colorScheme.secondaryContainer.withValues(alpha: 0.3),
                  colorScheme.onSecondaryContainer,
                  theme,
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Admission Enquiry Roster List
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Enquiries',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Sort by: Urgency',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          asyncData.when(
            data: (items) {
              if (items.isEmpty)
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(32),
                    child: Text('No enquiries found'),
                  ),
                );
              return Column(
                children: items.map((item) {
                  final name = item['studentName'] ?? 'Unknown';
                  final initials = name.isNotEmpty
                      ? name[0].toUpperCase()
                      : '?';
                  final parentName = item['parentName'] ?? 'Unknown';
                  final phone = item['phone'] ?? '';
                  final subtitle = '$parentName • $phone';
                  final status = item['status'] ?? 'PENDING';
                  final date = item['enquiryDate'] ?? '';
                  final grade = item['className'] ?? 'N/A';
                  return _buildEnquiryCard(
                    name,
                    'Class $grade',
                    subtitle,
                    initials,
                    colorScheme.tertiaryContainer.withValues(alpha: 0.4),
                    colorScheme.tertiary,
                    status,
                    colorScheme.tertiaryContainer.withValues(alpha: 0.4),
                    colorScheme.tertiary,
                    Icons.schedule,
                    date,
                    colorScheme.tertiary,
                    Icons.chevron_right,
                    'View',
                    colorScheme.surfaceContainerHighest,
                    colorScheme.onSurface,
                    colorScheme,
                    theme,
                  );
                }).toList(),
              );
            },
            loading: () => const Center(
              child: Padding(
                padding: EdgeInsets.all(32),
                child: CircularProgressIndicator(),
              ),
            ),
            error: (e, st) => Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Text('Error: $e'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterPill(
    String label,
    String count,
    Color bgColor,
    Color textColor,
    Color badgeBgColor,
    Color badgeTextColor,
    ThemeData theme,
  ) {
    return Container(
      margin: const EdgeInsets.only(right: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: theme.textTheme.labelMedium?.copyWith(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: badgeBgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              count,
              style: theme.textTheme.labelSmall?.copyWith(
                color: badgeTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEnquiryCard(
    String name,
    String badgeText,
    String subtitle,
    String avatarInitials,
    Color avatarBg,
    Color avatarText,
    String statusText,
    Color statusBg,
    Color statusTextCol,
    IconData footerIcon,
    String footerText,
    Color footerIconCol,
    IconData btnIcon,
    String btnText,
    Color btnBg,
    Color btnTextCol,
    ColorScheme colorScheme,
    ThemeData theme, {
    bool isGhostButton = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(0, 97, 148, 0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: avatarBg,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      avatarInitials,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: avatarText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              name,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
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
                              badgeText,
                              style: theme.textTheme.labelSmall?.copyWith(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
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
          Padding(
            padding: const EdgeInsets.only(left: 68, right: 16, bottom: 12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: statusBg,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                statusText,
                style: theme.textTheme.labelSmall?.copyWith(
                  fontSize: 11,
                  color: statusTextCol,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLow.withValues(alpha: 0.5),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(footerIcon, size: 16, color: footerIconCol),
                    const SizedBox(width: 6),
                    Text(
                      footerText,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                if (isGhostButton)
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Text(
                          btnText,
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: btnTextCol,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 2),
                        Icon(btnIcon, size: 16, color: btnTextCol),
                      ],
                    ),
                  )
                else
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: btnBg,
                      foregroundColor: btnTextCol,
                      elevation: 1,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 0,
                      ),
                      minimumSize: const Size(0, 32),
                    ),
                    icon: Icon(btnIcon, size: 14),
                    label: Text(
                      btnText,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
