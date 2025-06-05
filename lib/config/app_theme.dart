import 'package:flutter/material.dart';
const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.pink,
  Colors.purple,
  Colors.redAccent,
  Colors.redAccent,
  Colors.orange,
  Colors.lightGreenAccent,
];

// Paleta personalizada roja
const _redPrimary = Color(0xFFD32F2F);
const _redOnPrimary = Colors.white;
const _redSecondary = Color(0xFFB71C1C);
const _redOnSecondary = Colors.white;
const _redBackground = Color(0xFFFDECEA);
const _redOnBackground = Color(0xFF2D2D2D);

final redColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: _redPrimary,
  onPrimary: _redOnPrimary,
  secondary: _redSecondary,
  onSecondary: _redOnSecondary,
  error: Colors.red,
  onError: Colors.white,
  background: _redBackground,
  onBackground: _redOnBackground,
  surface: Colors.white,
  onSurface: Colors.black,
);

class AppTheme {
  final int selectColor;
  final bool useRedScheme;

  AppTheme({this.selectColor = 0, this.useRedScheme = false})
    : assert(selectColor >= 0, 'Select color must be greater then 0'),
      assert(selectColor < colorList.length, 'Select color must be less or equals than ${colorList.length}');

  ThemeData getTheme() => useRedScheme
      ? ThemeData(
          useMaterial3: true,
          colorScheme: redColorScheme,
          appBarTheme: const AppBarTheme(
            centerTitle: false,
          ),
        )
      : ThemeData(
          useMaterial3: true,
          colorSchemeSeed: colorList[selectColor],
          appBarTheme: const AppBarTheme(
            centerTitle: false,
          ),
        );
}