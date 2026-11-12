import re

filepath = 'lib/features/admin/finance_module/admin_due_fee_reminders_screen.dart'
with open(filepath, 'r') as f:
    content = f.read()

# We want to replace the `Widget build(BuildContext context, WidgetRef ref) {` body
# to fetch data first, then return the Stack.

build_pattern = r"Widget build\(BuildContext context, WidgetRef ref\) \{\s*final theme = Theme\.of\(context\);\s*final colorScheme = theme\.colorScheme;\s*return Stack\("

new_build_start = """Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ref.watch(feeRecordsProvider).when(
      data: (records) {
        final dueRecords = records.where((r) => r['status'] == 'PENDING').toList();
        final defaulterCount = dueRecords.length;
        final totalOverdue = dueRecords.fold<double>(0.0, (sum, r) => sum + ((r['totalAmount'] as num?)?.toDouble() ?? 0.0));

        return Stack("""

content = content.replace("Widget build(BuildContext context, WidgetRef ref) {\n    final theme = Theme.of(context);\n    final colorScheme = theme.colorScheme;\n\n    return Stack(", new_build_start)

# Replace '48 Defaulters'
content = content.replace("'48 Defaulters'", "'$defaulterCount Defaulters'")
content = content.replace("Text('48 ')", "Text('$defaulterCount ')")
content = content.replace("'All Classes (48 Defaulters)'", "'All Classes ($defaulterCount Defaulters)'")
content = content.replace("'Select All (48 Students)'", "'Select All ($defaulterCount Students)'")
content = content.replace("'Broadcast SMS & WhatsApp to all 48 defaulters'", "'Broadcast SMS & WhatsApp to all $defaulterCount defaulters'")
content = content.replace("'₹3,84,000'", "'₹$totalOverdue'")

# Now fix the old `ref.watch(feeRecordsProvider).when(...)` list logic inside the Column
old_list_pattern = r"ref\.watch\(feeRecordsProvider\)\.when\([\s\S]*?error: \(e, st\) => Center\(child: Text\('Error: \$e'\)\),\s*\),"
new_list = """Builder(
                  builder: (context) {
                    if (dueRecords.isEmpty) return const Center(child: Padding(padding: EdgeInsets.all(16), child: Text('No pending reminders.')));
                    return Column(
                      children: dueRecords.map((r) {
                        final name = r['studentName'] ?? 'Unknown';
                        final initials = name.isNotEmpty ? name.split(' ').map((e) => e.isNotEmpty ? e[0] : '').take(2).join('') : '';
                        final amount = '₹${r['totalAmount'] ?? 0}';
                        return _buildStudentRow(name, 'Class ${r['classId'] ?? '-'}', initials, amount, r['dueDate'] ?? '', colorScheme.secondaryFixed, colorScheme.secondary, colorScheme, theme);
                      }).toList(),
                    );
                  }
                ),"""

content = re.sub(old_list_pattern, new_list, content)

# Close the new `.when(` block at the end
end_pattern = r"      \],\n    \);\n  \}"
new_end = """      ],
    );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: Text('Error: $e')),
    );
  }"""

content = content.replace("      ],\n    );\n  }", new_end)

with open(filepath, 'w') as f:
    f.write(content)
