import 'package:flutter/material.dart';

class ProgressView extends StatelessWidget {
  const ProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    const red = Color(0xFFD32F2F);
    // Datos de ejemplo para la gráfica
    final values = <double>[0.7, 0.5, 0.9, 0.8, 0.6, 0.7, 0.5];

    Widget _buildBar(double fraction) {
      const barHeight = 120.0;
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // Barra de fondo
              Container(
                height: barHeight,
                width: 16,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              // Fracción coloreada
              Container(
                height: barHeight * fraction,
                width: 16,
                decoration: BoxDecoration(
                  color: red,
                  borderRadius: BorderRadius.vertical(
                    bottom: const Radius.circular(8),
                    top: Radius.circular(fraction == 1.0 ? 8 : 0),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Item',
            style: TextStyle(fontSize: 12),
          ),
        ],
      );
    }

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título
            const Center(
              child: Text(
                'Progreso Fit',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 24),

            // Gráfica de barras horizontal
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: values
                      .map((v) => Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: _buildBar(v),
                          ))
                      .toList(),
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Tarjeta con lista de ejercicios
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  // Encabezado
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Heading',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Heading',
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 1, color: Colors.grey),

                  // Lista de ítems
                  ...List.generate(4, (i) {
                    return ListTile(
                      leading: const Icon(Icons.star_border),
                      title: const Text('Exercise Top'),
                      subtitle: const Text('Menu description.'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.arrow_upward, size: 16),
                          SizedBox(width: 4),
                          Text('A'),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
