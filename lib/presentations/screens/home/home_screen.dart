import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fitbuddy/core/widgets/molecules/forms/submit_section.dart';
/*
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  static const String name = 'init';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);

    return Scaffold(
      appBar: AppBar(
        title: TextTranslation('hello', positionalArgs: ['Anderson', 12]),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            tooltip: 'Cambiar idioma',
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
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final item = appMenuItems[index];
        return _CustomListTile(item: item);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({required this.item});

  final MenuItems item;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return ListTile(
      leading: Icon(item.icon, color: color.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded),
      title: TextTranslation(item.titleKey),
      subtitle: TextTranslation(item.subTitleKey),
      onTap: () {
        context.push(item.link);
      },
    );
  }
}

void showLanguageSelector(
  BuildContext context, {
  Locale? currentLocale,
  required void Function(Locale) onSelected,
}) {
  showModalBottomSheet(
    context: context,
    builder: (ctx) {
      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Español'),
              selected: currentLocale?.languageCode == 'es',
              onTap: () {
                Navigator.of(ctx).pop();
                onSelected(const Locale('es'));
              },
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('English'),
              selected: currentLocale?.languageCode == 'en',
              onTap: () {
                Navigator.of(ctx).pop();
                onSelected(const Locale('en'));
              },
            ),
          ],
        ),
      );
    },
  );
}*/

class HomeScreen extends StatelessWidget {
  static const name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Bienvenido a FitBuddy',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            SubmitSection(
              text: 'Registrar',
              onPressed: () {
                context.go('/register');
              },
            ),
            const SizedBox(height: 16),
            SubmitSection(
              text: 'Login',
              onPressed: () {
                context.go('/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
