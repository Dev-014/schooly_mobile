import re
import os

def process_screen(filepath, provider_name, build_func_name, item_map_func):
    with open(filepath, 'r') as f:
        content = f.read()

    # Add ConsumerWidget
    content = content.replace('class ' + os.path.basename(filepath).split('.')[0].replace('_', ' ').title().replace(' ', '') + ' extends StatelessWidget', 
                              'class ' + os.path.basename(filepath).split('.')[0].replace('_', ' ').title().replace(' ', '') + ' extends ConsumerWidget')
    content = content.replace('Widget build(BuildContext context) {', 'Widget build(BuildContext context, WidgetRef ref) {')
    
    if "flutter_riverpod" not in content:
        content = "import 'package:flutter_riverpod/flutter_riverpod.dart';\nimport 'providers/front_office_providers.dart';\n" + content
    else:
        content = content.replace("import 'package:flutter_riverpod/flutter_riverpod.dart';", "import 'package:flutter_riverpod/flutter_riverpod.dart';\nimport 'providers/front_office_providers.dart';")

    # Insert provider watch
    content = content.replace('final colorScheme = theme.colorScheme;', f'final colorScheme = theme.colorScheme;\n    final asyncData = ref.watch({provider_name});')

    # Remove hardcoded cards
    pattern = r"(\s*//[^\n]*\n)?(\s*" + build_func_name + r"\([\s\S]*?\),)+"
    
    replacement = f"""
          asyncData.when(
            data: (items) {{
              if (items.isEmpty) return const Center(child: Padding(padding: EdgeInsets.all(32), child: Text('No items found')));
              return Column(
                children: items.map((item) {{
{item_map_func}
                }}).toList(),
              );
            }},
            loading: () => const Center(child: Padding(padding: EdgeInsets.all(32), child: CircularProgressIndicator())),
            error: (e, st) => Center(child: Padding(padding: const EdgeInsets.all(32), child: Text('Error: $e'))),
          ),
"""
    
    # We will just replace the first instance of a clump of build_func_name
    content = re.sub(pattern, replacement, content, count=1)
    
    with open(filepath, 'w') as f:
        f.write(content)

