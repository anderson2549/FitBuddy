import 'package:fitbuddy/l10n/app_localizations.localizations_access.g.dart';
import 'package:flutter/material.dart';

class TextTranslation extends StatelessWidget {
  final String data;
  final List<dynamic>? positionalArgs;
  final Key? key;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  const TextTranslation(
    this.data, {
    this.positionalArgs,
    this.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    final textLang = TextLang(context);
    String translatedText =
        (textLang.getByKey(data) ??
            textLang.getByKeyWithArgs(data, positionalArgs: positionalArgs)) ??
        data;

    return Text(
      translatedText,
      key: key,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
