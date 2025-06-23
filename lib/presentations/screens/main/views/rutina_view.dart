import 'package:flutter/material.dart';
import 'package:fitbuddy/core/widgets/atoms/text_translation.dart';
import 'package:go_router/go_router.dart';

class RoutinesView extends StatelessWidget {
  const RoutinesView({super.key});

  @override
  Widget build(BuildContext context) {
    const red = Color(0xFFD32F2F);

    // Tus datos de rutinas
    final routines = <Map<String, dynamic>>[
      {'name': 'routine_warmup', 'color': red, 'key': 'routine_warmup'},
      {'name': 'routine_hip', 'color': red.withOpacity(0.7), 'key': 'routine_hip'},
      {'name': 'routine_abs_waist', 'color': red, 'key': 'routine_abs_waist'},
      {'name': 'routine_legs_glutes', 'color': red.withOpacity(0.7), 'key': 'routine_legs_glutes'},
      {'name': 'routine_chest', 'color': red, 'key': 'routine_chest'},
      {'name': 'routine_biceps_forearms', 'color': red.withOpacity(0.7), 'key': 'routine_biceps_forearms'},
      {'name': 'routine_triceps', 'color': red, 'key': 'routine_triceps'},
      {'name': 'routine_back_lumbar', 'color': red.withOpacity(0.7), 'key': 'routine_back_lumbar'},
      {'name': 'routine_shoulders_traps', 'color': red, 'key': 'routine_shoulders_traps'},
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
                  child: const TextTranslation('back_button'),
                ),

                const SizedBox(height: 16),

                // Título
                const TextTranslation(
                  'routines_title',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 16),

                // Lista de rutinas
                Expanded(
                  child: ListView.separated(
                    itemCount: routines.length,
                    separatorBuilder:
                        (_, __) => const Divider(color: Colors.grey),
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
                              child: TextTranslation(
                                item['name'] as String,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),

                            // Botón "INICIO" - Ahora es interactivo
                            GestureDetector(
                              onTap: () {
                                // Navegar a la pantalla de detalle de rutina
                                context.push(
                                  '/routine-detail?name=${item['name']}&key=${item['key']}',
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: red,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const TextTranslation(
                                  'routine_start',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
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
