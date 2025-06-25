import 'dart:developer' as developer;

import 'package:fitbuddy/l10n/app_localizations.localizations_access.g.dart';
import 'package:flutter/material.dart';

class TextTranslation extends StatelessWidget {
  final String keyName;
  final List<dynamic>? positionalArgs;
  final Map<String, dynamic>? namedArgs;

  // Same parameters as Text
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;

  const TextTranslation(
    this.keyName, {
    super.key,
    this.positionalArgs,
    this.namedArgs,
    this.style,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
  });

  @override
  Widget build(BuildContext context) {
    final textLang = TextLang(context);

    final translatedText =
        (textLang.getByKey(keyName) ??
            textLang.getByKeyWithArgs(
              keyName,
              positionalArgs: positionalArgs,
            )) ??
        keyName; // Initialize translatedText locally in build

    developer.log(
      'TextTranslation: keyName: $keyName, translatedText: $translatedText',
      name: 'TextTranslation',
    );

    return Text(
      translatedText,
      //key: key,
      style: style,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
    );
  }

  static String getString(
    BuildContext context,
    String keyName, {
    List<dynamic>? positionalArgs = const [],
  }) {
    final textLang = TextLang(context);
    final translatedText =
        (textLang.getByKey(keyName) ??
            textLang.getByKeyWithArgs(
              keyName,
              positionalArgs: positionalArgs,
            )) ??
        keyName;
    return translatedText;
  }
}
