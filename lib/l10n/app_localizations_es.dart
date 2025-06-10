// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String hello(String userName) {
    return 'Hello $userName';
  }

  @override
  String get menu_buttons_title => 'Botones';

  @override
  String get menu_buttons_title_example => 'Botones';

  @override
  String get menu_buttons_subtitle => 'Varios botones en flutter';

  @override
  String get menu_cards_title => 'Tarjetas';

  @override
  String get menu_cards_subtitle => 'Un contenedor estilizado';

  @override
  String get menu_progress_title => 'Indicadores de progreso';

  @override
  String get menu_progress_subtitle => 'Un contenedor estilizado';

  @override
  String get menu_snackbars_title => 'Snackbars y diálogos';

  @override
  String get menu_snackbars_subtitle => 'Snackbars';

  @override
  String get menu_animations_title => 'Animaciones';

  @override
  String get menu_animations_subtitle => 'Animación';

  @override
  String get menu_uicontrols_title => 'Controles UI';

  @override
  String get menu_uicontrols_subtitle => 'Controles';

  @override
  String get menu_tutorial_title => 'Tutorial';

  @override
  String get menu_tutorial_subtitle => 'Tutorial pequeño';

  @override
  String get menu_scroll_title => 'Scroll infinito';

  @override
  String get menu_scroll_subtitle => 'Scroll infinito';

  @override
  String get menu_controltheme_title => 'Control de tema';

  @override
  String get menu_controltheme_subtitle => 'Control de tema';
}
