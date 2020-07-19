import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:productive/main.dart' as app;
import 'package:productive/main.dart';

void main() {
  group("Basic App Setup test", () {
    testWidgets('App is MaterialApp', (WidgetTester tester) async {
      await tester.pumpWidget(ProductiveApp(
        testChild: Container(),
      ));
      expect(find.byType(MaterialApp), findsOneWidget);
    });

    testWidgets("main method runs successfully", (WidgetTester tester) async {
      app.main();
    });
  });
}
