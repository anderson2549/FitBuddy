import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    const red = Color(0xFFD32F2F);

    Widget _buildObjectiveItem(String text, Color dotColor) {
      return Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 10,
                height: 10,
                margin: const EdgeInsets.only(top: 4),
                decoration: BoxDecoration(
                  color: dotColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(text, style: const TextStyle(fontSize: 16)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(color: Colors.grey),
          const SizedBox(height: 12),
        ],
      );
    }

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo + título centrados
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.image, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'FitBody',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Título con sombra
            const Text(
              'Objetivos:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(offset: Offset(0, 1), blurRadius: 2, color: Colors.black26),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Indicador circular animado
            Center(
              child: CircularPercentIndicator(
                radius: 160,
                lineWidth: 8,
                percent: 0.7,
                animation: true,
                animationDuration: 1200,
                startAngle: 270,
                circularStrokeCap: CircularStrokeCap.round,
                backgroundColor: Colors.grey[300]!,
                progressColor: red,
                center: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Avances',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: red),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '70%',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Lista de objetivos
            _buildObjectiveItem('Perder peso', red),
            _buildObjectiveItem('Ganar masa muscular', red.withOpacity(0.7)),
            _buildObjectiveItem(
              'Mejorar la condición física y calidad de vida',
              red,
            ),
          ],
        ),
      ),
    );
  }
}
