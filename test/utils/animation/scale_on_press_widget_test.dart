import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:productive/utils/animation/scale_on_press_widget.dart';

import '../../test_utils/test_utils.dart';

void main() {
  group("Gradient Extensions Test", () {
    testWidgets("Gradient on Foreground Test", (WidgetTester tester) async {
      final Widget scaledIcon =
          ScaleOnPressWidget(child: Icon(Icons.ac_unit)).testWidget;
      await tester.pumpWidget(scaledIcon);
      expect(find.byType(GestureDetector), findsOneWidget);
      await tester.press(find.byType(GestureDetector));
      await tester.longPress(find.byType(GestureDetector));
    });
  });
}
