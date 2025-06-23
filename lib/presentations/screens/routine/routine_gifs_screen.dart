import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RoutineGifsScreen extends StatefulWidget {
  final String routineName;
  final String routineKey;
  
  static const name = 'routine_gifs_screen';

  const RoutineGifsScreen({
    super.key,
    required this.routineName,
    required this.routineKey,
  });

  @override
  State<RoutineGifsScreen> createState() => _RoutineGifsScreenState();
}

class _RoutineGifsScreenState extends State<RoutineGifsScreen> {
  List<String> gifPaths = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadGifs();
  }

  void _loadGifs() {
    final folderMapping = {
      'routine_warmup': 'calentamiento',
      'routine_hip': 'cadera',
      'routine_abs_waist': 'abdomen_cintura',
      'routine_legs_glutes': 'piernas_gluteos',
      'routine_chest': 'pecho',
      'routine_biceps_forearms': 'biceps_antebrazos',
      'routine_triceps': 'triceps',
      'routine_back_lumbar': 'espalda_lumbar',
      'routine_shoulders_traps': 'hombros_trapecios',
    };

    final folderName = folderMapping[widget.routineKey] ?? 'default';
    
    final gif1Path = 'assets/gifs/$folderName/ejercicio1.gif';
    final gif2Path = 'assets/gifs/$folderName/ejercicio2.gif';

    setState(() {
      gifPaths = [gif1Path, gif2Path];
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    const red = Color(0xFFD32F2F);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: red,
        foregroundColor: Colors.white,
        title: Text(_getDisplayName(widget.routineName)),
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
                      _getDisplayName(widget.routineName),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: red,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Ejercicios demostrativos',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              Expanded(
                child: isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: red,
                        ),
                      )
                    : Column(
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(bottom: 16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(12),
                                      ),
                                      child: Image.asset(
                                        gifPaths[0],
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) {
                                          debugPrint('Error loading GIF 1: $error');
                                          return _buildPlaceholder('GIF 1', red);
                                        },
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    child: const Text(
                                      'Ejercicio 1',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Expanded(
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(12),
                                      ),
                                      child: Image.asset(
                                        gifPaths[1],
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) {
                                          debugPrint('Error loading GIF 2: $error');
                                          return _buildPlaceholder('GIF 2', red);
                                        },
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    child: const Text(
                                      'Ejercicio 2',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholder(String title, Color color) {
    return Container(
      color: Colors.grey[200],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.fitness_center,
              size: 64,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            Text(
              '$title no encontrado',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Ruta: ${gifPaths.isNotEmpty ? gifPaths[0] : "N/A"}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 10,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Verifica que el archivo existe en assets/gifs/',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getDisplayName(String routineKey) {
    final displayNames = {
      'routine_warmup': 'Calentamiento',
      'routine_hip': 'Cadera',
      'routine_abs_waist': 'Abdomen - Cintura',
      'routine_legs_glutes': 'Piernas - Glúteos',
      'routine_chest': 'Pecho',
      'routine_biceps_forearms': 'Bíceps - Antebrazos',
      'routine_triceps': 'Tríceps',
      'routine_back_lumbar': 'Espalda - Lumbar',
      'routine_shoulders_traps': 'Hombros - Trapecios',
    };
    
    return displayNames[routineKey] ?? routineKey;
  }
} 