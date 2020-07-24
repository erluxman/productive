import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:productive/common/resources/r.dart';
import 'package:productive/features/home/widgets/animated_circle_progress.dart';

void main() {
  group("Test Animated Motivation Meter", () {
    setUpAll(() {
      R.buildMode.isTesting = true;
    });

    tearDownAll(() {
      R.buildMode.isTesting = false;
    });

    testWidgets("test animated progressbar", (WidgetTester tester) async {
      await tester.pumpWidget(
          // ignore: prefer_const_constructors
          AnimatedMotivationMeter(height: 200, width: 200, motivation: 0.5));
      expect(find.byType(CustomPaint), findsNWidgets(1));
    });
  });


}
