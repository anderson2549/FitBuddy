import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fitbuddy/core/widgets/atoms/text_translation.dart';
import 'package:fitbuddy/l10n/app_localizations.dart';

void main() {
  testWidgets('TextTranslation displays translated text', (
    WidgetTester tester,
  ) async {
    // Arrange
    const testKey = Key('test_translation_1');
    const testTextKey = 'hello';
    const testUserName = 'John';
    const testAge = 30;

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('en'),
        home: Scaffold(
          body: TextTranslation(
            testTextKey,
            positionalArgs: [testUserName, testAge],
            key: testKey,
          ),
        ),
      ),
    );

    // Act
    final textFinder = find.byKey(testKey);

    // Assert
    expect(textFinder, findsOneWidget);
    expect(find.text('Hello John you age 30!'), findsOneWidget);
  });

  testWidgets('TextTranslation falls back to key if translation is missing', (
    WidgetTester tester,
  ) async {
    // Arrange
    const testKey = Key('test_fallback');
    const missingTextKey = 'missing_key';

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('en'),
        home: Scaffold(body: TextTranslation(missingTextKey, key: testKey)),
      ),
    );

    // Act
    final textFinder = find.byKey(testKey);

    // Assert
    expect(textFinder, findsOneWidget);
    expect(find.text(missingTextKey), findsOneWidget);
  });
}
