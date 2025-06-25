import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitbuddy/providers/progress_provider.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const red = Color(0xFFD32F2F);

    // 1️⃣ Mapeo de objetivos → lista de ejercicios asociados
    const objectiveMap = {
      'Perder peso': ['Calentamiento', 'Trotar'],
      'Ganar masa muscular': [
        'Abdomen - cintura',
        'Pierna - Pantorrilla - Glúteo',
        'Pecho',
        'Bíceps - Antebrazo',
        'Tríceps',
        'Espalda - Lumbar',
        'Hombro - Trapecio',
      ],
      'Mejorar condición física': [
        'Calentamiento',
        'Trotar',
        'Abdomen - cintura',
        'Pierna - Pantorrilla - Glúteo',
      ],
    };

    // 2️⃣ Obtengo todos los ejercicios hechos hoy
    final data = ref.watch(progressProvider);
    final todayKey = DateTime.now().toIso8601String().substring(0, 10);
    final todaysExercises = data[todayKey]?.exercises ?? [];

    // 3️⃣ Calculo porcentajes por objetivo
    final Map<String, double> objPercents = {};
    for (var entry in objectiveMap.entries) {
      final totalItems = entry.value.length;
      final done = todaysExercises.where((e) => entry.value.contains(e)).length;
      objPercents[entry.key] = (done / totalItems).clamp(0.0, 1.0);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Objetivos Fitness'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Objetivos:',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),

              // — Gráfico circular global (opcional) —
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 180,
                      height: 180,
                      child: CircularProgressIndicator(
                        value: 1,
                        strokeWidth: 12,
                        color: Colors.grey[300],
                      ),
                    ),
                    SizedBox(
                      width: 180,
                      height: 180,
                      child: CircularProgressIndicator(
                        // promedio de los 3 objetivos
                        value: objPercents.values.fold(0.0, (a, b) => a + b) /
                            objPercents.length,
                        strokeWidth: 12,
                        color: red,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Avance total',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${((objPercents.values.fold(0.0, (a, b) => a + b) / objPercents.length) * 100).round()}%',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // — Lista de cada objetivo con su porcentaje individual —
              ...objectiveMap.keys.map((label) {
                final pct = objPercents[label] ?? 0.0;
                final pctText = '${(pct * 100).round()}%';
                return Column(
                  children: [
                    _buildObjectiveRow(label, pctText, red),
                    const Divider(),
                  ],
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildObjectiveRow(String label, String pct, Color dotColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: dotColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Text(
            pct,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: dotColor,
            ),
          ),
        ],
      ),
    );
  }
}
