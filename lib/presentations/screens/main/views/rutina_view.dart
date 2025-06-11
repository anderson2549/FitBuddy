import 'package:flutter/material.dart';

class RoutinesView extends StatelessWidget {
  const RoutinesView({super.key});

  @override
  Widget build(BuildContext context) {
    const red = Color(0xFFD32F2F);

    // Tus datos de rutinas
    final routines = <Map<String, dynamic>>[
      {'name': 'Calentamiento', 'color': red},
      {'name': 'Cadera', 'color': red.withOpacity(0.7)},
      {'name': 'Abdomen - cintura', 'color': red},
      {'name': 'Pierna - Pantorrilla - Glúteo', 'color': red.withOpacity(0.7)},
      {'name': 'Pecho', 'color': red},
      {'name': 'Bíceps - Antebrazo', 'color': red.withOpacity(0.7)},
      {'name': 'Tríceps', 'color': red},
      {'name': 'Espalda - Lumbar', 'color': red.withOpacity(0.7)},
      {'name': 'Hombro - Trapecio', 'color': red},
    ];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // "Atrás" vuelve al HomeView
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed('/home');
                  },
                  child: const Text(
                    'Atrás',
                    style: TextStyle(
                      color: red,
                      fontSize: 16,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Título
                const Text(
                  'Rutinas',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 16),

                // Lista de rutinas
                Expanded(
                  child: ListView.separated(
                    itemCount: routines.length,
                    separatorBuilder: (_, __) => const Divider(color: Colors.grey),
                    itemBuilder: (context, index) {
                      final item = routines[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          children: [
                            // Punto de color
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: item['color'] as Color,
                                shape: BoxShape.circle,
                              ),
                            ),

                            const SizedBox(width: 12),

                            // Nombre de la rutina
                            Expanded(
                              child: Text(
                                item['name'] as String,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),

                            // Texto "INICIO"
                            const Text(
                              'INICIO',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

            // FloatingActionButton en la esquina inferior derecha
            Positioned(
              bottom: 24,
              right: 24,
              child: FloatingActionButton(
                onPressed: () {
                  // Acción al pulsar +
                },
                backgroundColor: red,
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

