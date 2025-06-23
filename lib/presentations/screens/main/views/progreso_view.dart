import 'package:fitbuddy/core/widgets/atoms/text_translation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitbuddy/providers/progress_provider.dart';

class ProgressView extends ConsumerWidget {
  const ProgressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const red = Color(0xFFD32F2F);

    // 1️⃣ Obtengo el mapa de progreso (fecha → ProgressData)
    final data = ref.watch(progressProvider);

    // Si no hay datos, muestro un placeholder
    if (data.isEmpty) {
      return Center(
        child: Text(
          'Aún no has completado ningún ejercicio.',
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
      );
    }

    // 2️⃣ Convierto a lista y ordeno por fecha
    final entries = data.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));

    // 3️⃣ Preparo lista de ejercicios de hoy y conteos
    final todayKey = DateTime.now().toIso8601String().substring(0, 10);
    final todaysList = data[todayKey]?.exercises ?? [];
    final repCounts = <String, int>{};
    for (var name in todaysList) {
      repCounts[name] = (repCounts[name] ?? 0) + 1;
    }
    final uniqueNames = repCounts.keys.toList();

    Widget buildBar(double fraction) {
      final pct = (fraction * 100).round();
      const height = 120.0;
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('$pct%', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: height,
                width: 16,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Container(
                height: height * fraction,
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
        ],
      );
    }

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text('Progreso Fit', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),

            ),
            const SizedBox(height: 24),

            // — Gráfica de barras sólo con fechas que tienen datos —
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: entries.map((entry) {
                    final date = entry.key;            // "YYYY-MM-DD"
                    final label = date.substring(5);    // "MM-DD"
                    final pct = entry.value.percent;
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          buildBar(pct),
                          const SizedBox(height: 8),
                          Text(label, style: const TextStyle(fontSize: 12)),
                        ],
                      ),
                    );
                  }).toList(),

                ),
              ),
            ),

            const SizedBox(height: 32),

            // — Lista de ejercicios de HOY con repeticiones —
            if (uniqueNames.isNotEmpty) ...[
              const Text('Ejercicios de hoy', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: uniqueNames.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (_, i) {
                  final name = uniqueNames[i];
                  final reps = repCounts[name]!;
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.check_circle_outline, color: Colors.green),
                    title: Text(name),
                    trailing: Text('x$reps', style: const TextStyle(fontWeight: FontWeight.bold)),
                  );
                },

              ),
            ],
          ],
        ),
      ),
    );
  }
}
