import 'package:fitbuddy/config/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeChanger extends ConsumerWidget {
  const ThemeChanger({super.key});
  static final name = 'theme_changer';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme = ref.watch(themeNotifierProvider).isDartMode;
    final useSchema = ref.watch(themeNotifierProvider).useRedScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(themeNotifierProvider.notifier).toggleDartMode();
            },
            icon: Icon(
              isDarkTheme
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined,
            ),
          ),
          IconButton(
            onPressed: () {
              ref.read(themeNotifierProvider.notifier).toggleDartScheme();
            },
            icon: Icon(
              useSchema ? Icons.power_outlined : Icons.power_off_outlined,
            ),
          ),
        ],
      ),
      body: _ThemeChanger(),
    );
  }
}

class _ThemeChanger extends ConsumerWidget {
  const _ThemeChanger({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    final int select = ref.watch(themeNotifierProvider).selectColor;

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, ind) {
        final color = colors[ind];
        return RadioListTile(
          title: Text('Este color', style: TextStyle(color: color)),
          subtitle: Text('${color.value}'),
          activeColor: color,
          value: ind,
          groupValue: select,
          onChanged: (val) {
            ref.watch(themeNotifierProvider.notifier).selectedColor(ind);
          },
        );
      },
    );
  }
}
