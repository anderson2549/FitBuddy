import 'package:fitbuddy/presentations/screens/testing_screen/infinite_scroll/infinite_scroll_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('InfiniteScrollScreen Widget Tests', () {
    setUpAll(() async {
      // Precargar los assets para los tests
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    testWidgets(
      'InfiniteScrollScreen navigates back when FloatingActionButton is pressed',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Navigator(
              onGenerateRoute:
                  (_) => MaterialPageRoute(
                    builder:
                        (_) => InfiniteScrollScreen(
                          imageProviderBuilder:
                              (_) =>
                                  const AssetImage('assets/images/image.png'),
                        ),
                  ),
            ),
          ),
        );
        expect(find.byType(InfiniteScrollScreen), findsOneWidget);
        await tester.tap(find.byType(FloatingActionButton));
        await tester.pumpAndSettle();
        expect(find.byType(InfiniteScrollScreen), findsNothing);
      },
    );
  });
}
