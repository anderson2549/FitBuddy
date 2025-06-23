import 'package:fitbuddy/core/widgets/molecules/modals/change_lang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitbuddy/config/provider/locale_provider.dart';
import 'package:fitbuddy/presentations/screens/main/views/perfil_view.dart';
import 'package:fitbuddy/presentations/screens/main/views/rutina_view.dart';
import 'package:fitbuddy/presentations/screens/main/views/home_view.dart';
import 'package:fitbuddy/presentations/screens/main/views/progreso_view.dart';
import 'package:fitbuddy/presentations/screens/main/views/notificaciones_view.dart';

class MainScreen extends ConsumerStatefulWidget {
  static const name = 'main_screen';

  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  int _currentIndex = 2; // Default to "Home"

  final List<Widget> _screens = const [
    PerfilView(),
    RoutinesView(),
    HomeView(),
    ProgressView(),
    NotificationsView(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = ref.watch(localeProvider);

    return Scaffold(
      appBar: AppBar(
        //title: Text('', style: TextStyle(color: theme.colorScheme.onPrimary)),
        backgroundColor: theme.colorScheme.primary,
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            color: theme.colorScheme.onPrimary,
            tooltip: 'Cambiar idioma',
            iconSize: 30,
            onPressed: () {
              showLanguageSelector(
                context,
                currentLocale: locale,
                onSelected: (newLocale) {
                  ref.read(localeProvider.notifier).state = newLocale;
                },
              );
            },
          ),
        ],
      ),
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: theme.colorScheme.primary,
        unselectedItemColor: theme.colorScheme.onSurfaceVariant,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Rutina',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Progreso',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notificaciones',
          ),
        ],
      ),
    );
  }
}
