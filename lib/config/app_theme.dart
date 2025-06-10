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
const _redPrimaryContainer = Color(
  0xFF8B0000,
); // Un tono más oscuro para el contenedor
const _redOnPrimaryContainer = Color(
  0xFFFFCDD2,
); // Un tono más claro para el texto en el contenedor
const _redSecondary = Color(0xFFB71C1C);
const _redOnSecondary = Colors.white;
const _redSecondaryContainer = Color(
  0xFF7F0000,
); // Un tono más oscuro para el contenedor secundario
const _redOnSecondaryContainer = Color(
  0xFFFFEBEE,
); // Un tono más claro para el texto en el contenedor secundario
const _redTertiary = Color(
  0xFF880E4F,
); // Un tono púrpura/rojo para el terciario
const _redOnTertiary = Colors.white;
const _redTertiaryContainer = Color(
  0xFF560029,
); // Un tono más oscuro para el contenedor terciario
const _redOnTertiaryContainer = Color(
  0xFFF3E5F5,
); // Un tono más claro para el texto en el contenedor terciario
const _redError = Colors.red;
const _redOnError = Colors.white;
const _redErrorContainer = Color(
  0xFFC62828,
); // Un tono más oscuro para el contenedor de error
const _redOnErrorContainer = Color(
  0xFFFFCDD2,
); // Un tono más claro para el texto en el contenedor de error
const _redSurface = Colors.white;
const _redOnSurface = Colors.black;
// Un tono grisáceo para la variante de superficie
const _redOnSurfaceVariant = Color(
  0xFF757575,
); // Un tono más oscuro para el texto en la variante de superficie
const _redOutline = Color(0xFFBDBDBD); // Un tono grisáceo para el borde

final redColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: _redPrimary,
  onPrimary: _redOnPrimary,
  primaryContainer: _redPrimaryContainer,
  onPrimaryContainer: _redOnPrimaryContainer,
  secondary: _redSecondary,
  onSecondary: _redOnSecondary,
  secondaryContainer: _redSecondaryContainer,
  onSecondaryContainer: _redOnSecondaryContainer,
  tertiary: _redTertiary,
  onTertiary: _redOnTertiary,
  tertiaryContainer: _redTertiaryContainer,
  onTertiaryContainer: _redOnTertiaryContainer,
  error: _redError,
  onError: _redOnError,
  errorContainer: _redErrorContainer,
  onErrorContainer: _redOnErrorContainer,
  surface: _redSurface,
  onSurface: _redOnSurface,
  onSurfaceVariant: _redOnSurfaceVariant,
  outline: _redOutline,
  shadow: Colors.black, // Color de la sombra
  inverseSurface: Color(0xFF424242), // Color de la superficie inversa
  onInverseSurface: Color(
    0xFFFAFAFA,
  ), // Color del texto en la superficie inversa
  inversePrimary: Color(0xFFE57373), // Color primario inverso
  surfaceTint: _redPrimary, // Tinte de la superficie
);

final redColorSchemeDark = ColorScheme(
  brightness: Brightness.dark,
  primary: _redPrimary,
  onPrimary: _redOnPrimary,
  primaryContainer: Color(0xFF4A0000),
  onPrimaryContainer: _redOnPrimaryContainer,
  secondary: _redSecondary,
  onSecondary: _redOnSecondary,
  secondaryContainer: Color(0xFF330000),
  onSecondaryContainer: _redOnSecondaryContainer,
  tertiary: _redTertiary,
  onTertiary: _redOnTertiary,
  tertiaryContainer: Color(0xFF2D0016),
  onTertiaryContainer: _redOnTertiaryContainer,
  error: _redError,
  onError: _redOnError,
  errorContainer: Color(0xFF93000A),
  onErrorContainer: _redOnErrorContainer,
  surface: Color(0xFF121212),
  onSurface: Colors.white,
  onSurfaceVariant: Color(0xFFBDBDBD),
  outline: Color(0xFF757575),
  shadow: Colors.black,
  inverseSurface: Color(0xFFE0E0E0),
  onInverseSurface: Color(0xFF212121),
  inversePrimary: Color(0xFFFF8A80),
  surfaceTint: _redPrimary,
);

class AppTheme {
  final int selectColor;
  final bool useRedScheme;
  final bool isDartMode;

  AppTheme({
    this.selectColor = 0,
    this.useRedScheme = true,
    this.isDartMode = false,
  }) : assert(selectColor >= 0, 'Select color must be greater then 0'),
       assert(
         selectColor < colorList.length,
         'Select color must be less or equals than ${colorList.length}',
       );

  ThemeData getTheme() =>
      useRedScheme
          ? ThemeData(
            useMaterial3: true,
            brightness: isDartMode ? Brightness.dark : Brightness.light,
            colorScheme: isDartMode ? redColorSchemeDark : redColorScheme,
            appBarTheme: const AppBarTheme(centerTitle: false),
          )
          : ThemeData(
            useMaterial3: true,
            brightness: isDartMode ? Brightness.dark : Brightness.light,
            colorSchemeSeed: colorList[selectColor],
            appBarTheme: const AppBarTheme(centerTitle: false),
          );

  AppTheme copyWith({int? selectColor, bool? useRedScheme, bool? isDartMode}) {
    return AppTheme(
      selectColor: selectColor ?? this.selectColor,
      useRedScheme: useRedScheme ?? this.useRedScheme,
      isDartMode: isDartMode ?? this.isDartMode,
    );
  }
}
