import 'package:flutter/material.dart';

void showLanguageSelector(
  BuildContext context, {
  Locale? currentLocale,
  required void Function(Locale) onSelected,
}) {
  showModalBottomSheet(
    context: context,
    builder: (ctx) {
      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Español'),
              selected: currentLocale?.languageCode == 'es',
              onTap: () {
                Navigator.of(ctx).pop();
                onSelected(const Locale('es'));
              },
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('English'),
              selected: currentLocale?.languageCode == 'en',
              onTap: () {
                Navigator.of(ctx).pop();
                onSelected(const Locale('en'));
              },
            ),
          ],
        ),
      );
    },
  );
}
