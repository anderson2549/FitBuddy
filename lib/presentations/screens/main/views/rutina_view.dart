
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitbuddy/providers/progress_provider.dart';
import 'package:fitbuddy/core/widgets/atoms/text_translation.dart';


class RoutinesView extends ConsumerStatefulWidget {
  const RoutinesView({Key? key}) : super(key: key);

  @override
  ConsumerState<RoutinesView> createState() => _RoutinesViewState();
}

class _RoutinesViewState extends ConsumerState<RoutinesView> {
  static const Color red = Color(0xFFD32F2F);
  final int totalExercises = 9;

  final List<Map<String, String>> routines = [
    {'name': 'Calentamiento',          'gif': 'assets/images/gift/Calentamiento.gif'},
    {'name': 'Trotar',                 'gif': 'assets/images/gift/Correr.gif'},
    {'name': 'Abdomen - cintura',      'gif': 'assets/images/gift/Abdomen.gif'},
    {'name': 'Pierna - Pantorrilla - Glúteo', 'gif': 'assets/images/gift/Correr.gif'},
    {'name': 'Pecho',                  'gif': 'assets/images/gift/Pecho.gif'},
    {'name': 'Bíceps - Antebrazo',     'gif': 'assets/images/gift/biceps.gif'},
    {'name': 'Tríceps',                'gif': 'assets/images/gift/Triceps.gif'},
    {'name': 'Espalda - Lumbar',       'gif': 'assets/images/gift/Espalda.gif'},
    {'name': 'Hombro - Trapecio',      'gif': 'assets/images/gift/Hombro.gif'},
  ];


  void _showExerciseDialog(BuildContext context, String name, String gifPath) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        int seconds = 0;
        bool isRunning = false;
        bool isResting = false;
        bool active = true;
        Timer? timer;

        // Calculamos cuántas veces ya hicimos esta rutina hoy:
        final today = DateTime.now().toIso8601String().substring(0, 10);
        final prevList = ref.read(progressProvider)[today]?.exercises.where((e) => e == name).toList() ?? [];
        int series = prevList.length + 1; // próxima serie

        void startTimer(StateSetter setModalState) {
          isRunning = true;
          isResting = false;
          timer = Timer.periodic(const Duration(seconds: 1), (t) {
            if (!active) { t.cancel(); return; }
            setModalState(() => seconds++);
          });
        }

        void stopTimer(StateSetter setModalState) {
          timer?.cancel();
          isRunning = false;
          isResting = true;
          seconds = 60;


          // Añade esta serie al provider
          ref.read(progressProvider.notifier).addExercise(today, name, totalExercises);

          // Preparamos la próxima serie
          series++;
          timer = Timer.periodic(const Duration(seconds: 1), (t) {
            if (!active) { t.cancel(); return; }
            setModalState(() {
              seconds--;
              if (seconds <= 0) { t.cancel(); isResting = false; }
            });
          });
        }

        void closeModal() {
          active = false;
          timer?.cancel();
          Navigator.of(context).pop();
        }

        return StatefulBuilder(
          builder: (ctx, setModalState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              content: SizedBox(
                width: 320,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Text(name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text('Serie $series', style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
                  const SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(gifPath, height: 120, width: 200, fit: BoxFit.cover),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    color: isResting ? Colors.green[50] : Colors.blue[50],
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(children: [
                        Text(
                          isResting ? 'Descanso' : 'Ejercicio',
                          style: TextStyle(
                            fontSize: 16,
                            color: isResting ? Colors.green : Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text('$seconds s', style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                      ]),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    ElevatedButton(
                      onPressed: closeModal,
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                      child: const Text('Cerrar'),
                    ),
                    if (!isRunning && !isResting)
                      ElevatedButton(
                        onPressed: () => startTimer(setModalState),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                        child: const Text('Iniciar'),
                      ),
                    if (isRunning && !isResting)
                      ElevatedButton(
                        onPressed: () => stopTimer(setModalState),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                        child: const Text('Detener'),
                      ),
                  ]),
                  if (isResting)
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        '¡Descansa 1 minuto antes de la siguiente serie!',
                        style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                    ),
                ]),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Rutinas', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              itemCount: routines.length,
              separatorBuilder: (_, __) => const Divider(color: Colors.grey),
              itemBuilder: (ctx, i) {
                final item = routines[i];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(children: [
                    Container(width: 10, height: 10, decoration: BoxDecoration(color: red, shape: BoxShape.circle)),
                    const SizedBox(width: 12),
                    Expanded(child: Text(item['name']!, style: const TextStyle(fontSize: 16))),
                    ElevatedButton(
                      onPressed: () => _showExerciseDialog(ctx, item['name']!, item['gif']!),
                      style: ElevatedButton.styleFrom(backgroundColor: red, padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
                      child: const Text('INICIAR', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ]),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
