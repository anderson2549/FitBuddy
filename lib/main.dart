import 'package:fitbuddy/app_localizations.localizations_access.g.dart';
import 'package:fitbuddy/config/provider/theme_provider.dart';
import 'package:fitbuddy/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:fitbuddy/config/app_theme.dart';
import 'package:fitbuddy/config/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final AppTheme appTheme = ref.watch(themeNotifierProvider);
    return MaterialApp.router(
      title: GetTextInt(context).getByKey('app_title') ?? 'FitBuddy',
      locale: const Locale('es'),

      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('es'), // Spanish
      ],
      debugShowCheckedModeBanner: false,
      theme: appTheme.getTheme(),
      routerConfig: appRouter,
    );
  }
}
