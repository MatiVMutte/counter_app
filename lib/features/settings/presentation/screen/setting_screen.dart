import 'package:flutter/material.dart';
import 'package:flutter_clean_app/config/theme/provider/light_dark_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class SettingsScreen extends StatelessWidget {
  static String name = '/settings';
  
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {

    return Scaffold(


      appBar: AppBar(
        title: const Text('Settings'),
      ),


      body: ListView(
        children: [
          SelectThemeMode(),
          
        ],
      )


    );
  }
}

class SelectThemeMode extends ConsumerWidget {
  const SelectThemeMode({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(lightDarkProvider).value!;

    return ListTile(
      title: const Text('Tema'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8), 
          SegmentedButton(
            style: SegmentedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            segments: [
              ButtonSegment(
                value: ThemeMode.light,
                label: const Text('Light'),
                icon: const Icon(Icons.light_mode),
              ),
              ButtonSegment(
                value: ThemeMode.system,
                label: const Text('System'),
                icon: const Icon(Icons.system_security_update_good),
              ),
              ButtonSegment(
                value: ThemeMode.dark,
                label: const Text('Dark'),
                icon: const Icon(Icons.dark_mode),
              ),
            ],
            selected: {selected},
            onSelectionChanged: (themes) {
              ref.read(lightDarkProvider.notifier).setTheme(themes.first);
            },
          ),
        ],
      ),
    );
  }
}