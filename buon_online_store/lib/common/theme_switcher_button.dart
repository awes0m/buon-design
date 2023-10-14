import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme/theme_provider.dart';

class ThemeSwitchButton extends StatelessWidget {
  const ThemeSwitchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final ThemeMode theme = ref.watch(themeModeProvider);
        return IconButton(
            onPressed: () {
              ref.read(themeModeProvider.notifier).state =
                  theme == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
            },
            icon: Icon(
                theme == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode));
      },
    );
  }
}
