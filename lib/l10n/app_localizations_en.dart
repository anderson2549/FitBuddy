// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String hello(String userName) {
    return 'Hello $userName';
  }

  @override
  String get menu_buttons_title => 'Buttons';

  @override
  String get menu_buttons_title_example => 'Buttons';

  @override
  String get menu_buttons_subtitle => 'Various buttons in Flutter';

  @override
  String get menu_cards_title => 'Cards';

  @override
  String get menu_cards_subtitle => 'A styled container';

  @override
  String get menu_progress_title => 'Progress indicators';

  @override
  String get menu_progress_subtitle => 'A styled container';

  @override
  String get menu_snackbars_title => 'Snackbars and dialogs';

  @override
  String get menu_snackbars_subtitle => 'Snackbars';

  @override
  String get menu_animations_title => 'Animations';

  @override
  String get menu_animations_subtitle => 'Animation';

  @override
  String get menu_uicontrols_title => 'UI controls';

  @override
  String get menu_uicontrols_subtitle => 'Controls';

  @override
  String get menu_tutorial_title => 'Tutorial';

  @override
  String get menu_tutorial_subtitle => 'Small tutorial';

  @override
  String get menu_scroll_title => 'Infinite Scroll';

  @override
  String get menu_scroll_subtitle => 'Infinite Scroll';

  @override
  String get menu_controltheme_title => 'Control theme';

  @override
  String get menu_controltheme_subtitle => 'Control theme';
}
