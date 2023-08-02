import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:jmo/presentation/main/main_screen.dart';
import 'package:jmo/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group(
    'Login test',
    () {
      testWidgets('Verify login screen', (widgetTester) async {
        app.main();
        await widgetTester.pumpAndSettle();
        await Future.delayed(const Duration(seconds: 2));
        await widgetTester.enterText(
            find.byKey(Key("email controller")), "farhan@gmail.com");
        // await Future.delayed(const Duration(seconds: 2));
        // await widgetTester.enterText(
        //     find.byKey(Key("password controller")), "123");
        // await Future.delayed(const Duration(seconds: 2));
        // await widgetTester.tap(find.byKey(Key("login button")));
        // await Future.delayed(const Duration(seconds: 2));
        // await widgetTester.tap(find.byKey(Key("login button")));
        // await widgetTester.pumpAndSettle();
        // expect(find.byType(MainScreen), findsOneWidget);
      });
    },
  );
}
