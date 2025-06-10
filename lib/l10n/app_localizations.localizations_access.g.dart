// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// LocalizationAccessGenerator
// **************************************************************************

import 'package:flutter/widgets.dart';
import 'package:fitbuddy/l10n/app_localizations.dart';

class TextLang {
  final BuildContext _buildContext;

  TextLang(BuildContext this._buildContext);

  /// Obtiene una traducción por clave. Si la clave corresponde a un método con parámetros,
  /// usa [getByKeyWithArgs].
  String? getByKey(String key) {
    switch (key) {
      case 'localeName':
        return AppLocalizations.of(_buildContext)!.localeName;
      case 'menu_buttons_title':
        return AppLocalizations.of(_buildContext)!.menu_buttons_title;
      case 'menu_buttons_title_example':
        return AppLocalizations.of(_buildContext)!.menu_buttons_title_example;
      case 'menu_buttons_subtitle':
        return AppLocalizations.of(_buildContext)!.menu_buttons_subtitle;
      case 'menu_cards_title':
        return AppLocalizations.of(_buildContext)!.menu_cards_title;
      case 'menu_cards_subtitle':
        return AppLocalizations.of(_buildContext)!.menu_cards_subtitle;
      case 'menu_progress_title':
        return AppLocalizations.of(_buildContext)!.menu_progress_title;
      case 'menu_progress_subtitle':
        return AppLocalizations.of(_buildContext)!.menu_progress_subtitle;
      case 'menu_snackbars_title':
        return AppLocalizations.of(_buildContext)!.menu_snackbars_title;
      case 'menu_snackbars_subtitle':
        return AppLocalizations.of(_buildContext)!.menu_snackbars_subtitle;
      case 'menu_animations_title':
        return AppLocalizations.of(_buildContext)!.menu_animations_title;
      case 'menu_animations_subtitle':
        return AppLocalizations.of(_buildContext)!.menu_animations_subtitle;
      case 'menu_uicontrols_title':
        return AppLocalizations.of(_buildContext)!.menu_uicontrols_title;
      case 'menu_uicontrols_subtitle':
        return AppLocalizations.of(_buildContext)!.menu_uicontrols_subtitle;
      case 'menu_tutorial_title':
        return AppLocalizations.of(_buildContext)!.menu_tutorial_title;
      case 'menu_tutorial_subtitle':
        return AppLocalizations.of(_buildContext)!.menu_tutorial_subtitle;
      case 'menu_scroll_title':
        return AppLocalizations.of(_buildContext)!.menu_scroll_title;
      case 'menu_scroll_subtitle':
        return AppLocalizations.of(_buildContext)!.menu_scroll_subtitle;
      case 'menu_controltheme_title':
        return AppLocalizations.of(_buildContext)!.menu_controltheme_title;
      case 'menu_controltheme_subtitle':
        return AppLocalizations.of(_buildContext)!.menu_controltheme_subtitle;
      default:
        return null;
    }
  }

  /// Obtiene una traducción por clave y argumentos.
  ///
  /// Este método permite acceder dinámicamente a cualquier método de localización
  /// que acepte parámetros posicionales y/o nombrados.
  ///
  /// - [key]: nombre del método de localización (por ejemplo, 'hello').
  /// - [positionalArgs]: lista de argumentos posicionales en el orden esperado por el método.
  /// - [namedArgs]: mapa de argumentos nombrados donde la clave es el nombre del parámetro.
  ///
  /// Ejemplo de uso:
  /// ```dart
  /// TextLang(context).getByKeyWithArgs('hello', positionalArgs: ['Juan'])
  /// ```
  /// Para métodos con parámetros nombrados:
  /// ```dart
  /// TextLang(context).getByKeyWithArgs('greet', namedArgs: {'userName': 'Juan'})
  /// ```
  ///
  /// Si la clave no corresponde a ningún método, retorna null.
  String? getByKeyWithArgs(
    String key, {
    List<dynamic>? positionalArgs,
    Map<String, dynamic>? namedArgs,
  }) {
    switch (key) {
      case 'hello':
        return AppLocalizations.of(
          _buildContext,
        )!.hello(positionalArgs?[0], positionalArgs?[1]);
      default:
        return null;
    }
  }
}
