import 'package:flutter/material.dart';
import 'package:fitbuddy/core/widgets/atoms/text_translation.dart';
import 'package:go_router/go_router.dart';

class RoutineDetailScreen extends StatelessWidget {
  final String routineName;
  final String routineKey;
  
  static const name = 'routine_detail_screen';

  const RoutineDetailScreen({
    super.key,
    required this.routineName,
    required this.routineKey,
  });

  @override
  Widget build(BuildContext context) {
    const red = Color(0xFFD32F2F);

    // Ejercicios de ejemplo para cada rutina
    final exercises = <Map<String, dynamic>>[
      {
        'name': 'Ejercicio 1',
        'sets': '3 series',
        'reps': '12 repeticiones',
        'duration': '45 segundos',
      },
      {
        'name': 'Ejercicio 2',
        'sets': '3 series',
        'reps': '15 repeticiones',
        'duration': '30 segundos',
      },
      {
        'name': 'Ejercicio 3',
        'sets': '4 series',
        'reps': '10 repeticiones',
        'duration': '60 segundos',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: red,
        foregroundColor: Colors.white,
        title: Text(routineName),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Información de la rutina
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: red.withOpacity(0.3)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      routineName,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: red,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Rutina de ejercicios personalizada',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Lista de ejercicios
              const Text(
                'Ejercicios:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              Expanded(
                child: ListView.separated(
                  itemCount: exercises.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final exercise = exercises[index];
                    return Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            exercise['name'] as String,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              _buildExerciseInfo(
                                Icons.repeat,
                                exercise['sets'] as String,
                              ),
                              const SizedBox(width: 16),
                              _buildExerciseInfo(
                                Icons.fitness_center,
                                exercise['reps'] as String,
                              ),
                              const SizedBox(width: 16),
                              _buildExerciseInfo(
                                Icons.timer,
                                exercise['duration'] as String,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // Botón para comenzar la rutina
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // Aquí puedes agregar la lógica para comenzar el entrenamiento
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('¡Comenzando entrenamiento!'),
                        backgroundColor: red,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: red,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'COMENZAR ENTRENAMIENTO',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExerciseInfo(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
} 