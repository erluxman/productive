import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:productive/playground/test_main.dart';

void main() {
  group("Dummy widget test", () {
    testWidgets(
      "Screen contains a button to go to page2",
      (WidgetTester tester) async {
        await tester.pumpWidget(DummyApp());
        final buttonFinder = find.byType(MaterialButton);
        expect(buttonFinder, findsOneWidget);
        expect(find.text("Go to screen2"), findsOneWidget);
        await tester.tap(buttonFinder);
        await tester.pumpAndSettle();
        expect(buttonFinder, findsOneWidget);
        expect(find.text("Go to screen1"), findsOneWidget);
        expect(find.text("Go to screen2"), findsNothing);
        await tester.tap(buttonFinder);
        await tester.pumpAndSettle();
        expect(find.text("Go to screen2"), findsOneWidget);
      },
    );

    testWidgets(
      "Gesture Detector also works like button",
      (WidgetTester tester) async {
        await tester.pumpWidget(DummyApp());
        expect(find.byKey(const Key("gd1")), findsOneWidget);
        expect(find.text("Jump to screen2"), findsOneWidget);
        await tester.tap(find.byKey(const Key("gd1")));
        await tester.pumpAndSettle();
        expect(find.byKey(const Key("gd2")), findsOneWidget);
        expect(find.text("Jump to screen1"), findsOneWidget);
        expect(find.text("Jump to screen2"), findsNothing);
        await tester.tap(find.byKey(const Key("gd2")));
        await tester.pumpAndSettle();
        expect(find.byKey(const Key("gd1")), findsOneWidget);
        expect(find.text("Jump to screen2"), findsOneWidget);
      },
    );
  });
}
