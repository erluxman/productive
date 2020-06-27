import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:productive/main.dart';

void main() {
  group("Basic App Setup test", () {
    testWidgets('App Follows MaterialTheme', (WidgetTester tester) async {
      await tester.pumpWidget(ProductiveApp(
        testChild: Container(),
      ));
      expect(find.byType(MaterialApp), findsOneWidget);
    });
  });
}
