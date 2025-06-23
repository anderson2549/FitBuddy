import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Modelo que guarda % y lista de ejercicios en un día.
class ProgressData {
  final double percent;
  final List<String> exercises;
  const ProgressData({ required this.percent, required this.exercises });
}

/// Provider: fecha (YYYY-MM-DD) → ProgressData
final progressProvider = StateNotifierProvider<ProgressNotifier, Map<String, ProgressData>>(
  (ref) => ProgressNotifier(),
);

class ProgressNotifier extends StateNotifier<Map<String, ProgressData>> {
  ProgressNotifier() : super({});

  /// Sólo recalcula % (mantiene la lista existente).
  void updateProgress(String date, int completed, int total) {
    final prev = state[date]?.exercises ?? [];
    final pct  = (completed / total).clamp(0.0, 1.0);
    state = {
      ...state,
      date: ProgressData(percent: pct, exercises: prev),
    };
  }

  /// Añade un ejercicio a la lista y recalcula %.
  void addExercise(String date, String name, int total) {
    final prevList = state[date]?.exercises ?? [];
    final newList  = [...prevList, name];
    final pct      = (newList.length / total).clamp(0.0, 1.0);
    state = {
      ...state,
      date: ProgressData(percent: pct, exercises: newList),
    };
  }
}
