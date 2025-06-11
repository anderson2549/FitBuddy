import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// A message with a single parameter
  ///
  /// In en, this message translates to:
  /// **'Hello {userName} you age {age}!'**
  String hello(String userName, int age);

  /// No description provided for @menu_buttons_title.
  ///
  /// In en, this message translates to:
  /// **'Buttons'**
  String get menu_buttons_title;

  /// No description provided for @menu_buttons_title_example.
  ///
  /// In en, this message translates to:
  /// **'Buttons'**
  String get menu_buttons_title_example;

  /// No description provided for @menu_buttons_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Various buttons in Flutter'**
  String get menu_buttons_subtitle;

  /// No description provided for @menu_cards_title.
  ///
  /// In en, this message translates to:
  /// **'Cards'**
  String get menu_cards_title;

  /// No description provided for @menu_cards_subtitle.
  ///
  /// In en, this message translates to:
  /// **'A styled container'**
  String get menu_cards_subtitle;

  /// No description provided for @menu_progress_title.
  ///
  /// In en, this message translates to:
  /// **'Progress indicators'**
  String get menu_progress_title;

  /// No description provided for @menu_progress_subtitle.
  ///
  /// In en, this message translates to:
  /// **'A styled container'**
  String get menu_progress_subtitle;

  /// No description provided for @menu_snackbars_title.
  ///
  /// In en, this message translates to:
  /// **'Snackbars and dialogs'**
  String get menu_snackbars_title;

  /// No description provided for @menu_snackbars_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Snackbars'**
  String get menu_snackbars_subtitle;

  /// No description provided for @menu_animations_title.
  ///
  /// In en, this message translates to:
  /// **'Animations'**
  String get menu_animations_title;

  /// No description provided for @menu_animations_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Animation'**
  String get menu_animations_subtitle;

  /// No description provided for @menu_uicontrols_title.
  ///
  /// In en, this message translates to:
  /// **'UI controls'**
  String get menu_uicontrols_title;

  /// No description provided for @menu_uicontrols_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Controls'**
  String get menu_uicontrols_subtitle;

  /// No description provided for @menu_tutorial_title.
  ///
  /// In en, this message translates to:
  /// **'Tutorial'**
  String get menu_tutorial_title;

  /// No description provided for @menu_tutorial_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Small tutorial'**
  String get menu_tutorial_subtitle;

  /// No description provided for @menu_scroll_title.
  ///
  /// In en, this message translates to:
  /// **'Infinite Scroll'**
  String get menu_scroll_title;

  /// No description provided for @menu_scroll_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Infinite Scroll'**
  String get menu_scroll_subtitle;

  /// No description provided for @menu_controltheme_title.
  ///
  /// In en, this message translates to:
  /// **'Control theme'**
  String get menu_controltheme_title;

  /// No description provided for @menu_controltheme_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Control theme'**
  String get menu_controltheme_subtitle;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
