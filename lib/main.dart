import 'package:flutter/material.dart';
import 'package:fitbuddy/config/app_theme.dart';
import 'package:fitbuddy/config/router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Flutter widgets",
      debugShowCheckedModeBanner: false,
      theme: AppTheme(useRedScheme: true).getTheme(),
      routerConfig: appRouter,
    );
  }
}
