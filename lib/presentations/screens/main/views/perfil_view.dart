import 'package:fitbuddy/core/widgets/atoms/text_translation.dart';
import 'package:flutter/material.dart';

class PerfilView extends StatefulWidget {
  const PerfilView({super.key});
  @override
  State<PerfilView> createState() => _PerfilViewState();
}

class _PerfilViewState extends State<PerfilView> {
  final Color _red = const Color(0xFFD32F2F);

  Widget _buildMenuItem(String title) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(color: _red, shape: BoxShape.circle),
            ),
            const SizedBox(width: 12),
            TextTranslation(title, style: const TextStyle(fontSize: 16)),
          ],
        ),
        const SizedBox(height: 12),
        const Divider(height: 1, color: Colors.grey),
        const SizedBox(height: 12),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 16),
              // Foto de perfil
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1599566150163-29194dcaad36',
                ),
              ),
              const SizedBox(height: 16),
              // Nombre
              const TextTranslation(
                'Victo Robertson',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              // Opciones
              _buildMenuItem('Ajustes'),
              _buildMenuItem('Seguimiento'),
              _buildMenuItem('Objetivos'),
            ],
          ),
        ),
      ),
    );
  }
}
