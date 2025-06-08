import 'package:fitbuddy/config/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final colorListProvider = Provider((ref) => colorList);

final isDartProvider = StateProvider<bool>((ref) => false);
final selectedColorProvider = StateProvider<int>((ref) => 0);

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>((
  ref,
) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());

  toggleDartMode() {
    state = state.copyWith(isDartMode: !state.isDartMode);
  }

  toggleDartScheme() {
    state = state.copyWith(useRedScheme: !state.useRedScheme);
  }

  selectedColor(int colorIndex) {
    state = state.copyWith(selectColor: colorIndex);
  }
}
