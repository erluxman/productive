import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:productive/common/resources/r.dart';
import 'package:productive/features/home/widgets/animated_circle_progress.dart';
import 'package:productive/features/home/widgets/animated_nav_button.dart';

import '../../test_utils/test_utils.dart';

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

  group("Test Animated Nav Button", () {
    setUpAll(() {
      R.buildMode.isTesting = true;
    });

    tearDownAll(() {
      R.buildMode.isTesting = false;
    });

    testWidgets("gestures are working", (WidgetTester tester) async {
      // ignore: prefer_const_constructors
      NavButtonsState state = NavButtonsState();
      void select(int index) {
        state = state.copyWith(selectedIndex: 1);
      }

      void touch(int index) {
        state = state.copyWith(pressedIndex: 1);
      }

      void unTouch() {
        state = state.copyWith(pressedIndex: -1);
      }

      final navBar = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          AnimatedNavIcon(
            key: const Key("first_icon"),
            navState: state,
            select: () => select(0),
            unTouch: () => unTouch,
            touch: () => touch(0),
            child: NavIcon(
              position: 0,
              svgPath: R.svg.homeIcon,
              navState: state,
            ),
          ),
          AnimatedNavIcon(
            key: const Key("second_icon"),
            navState: state,
            select: () => select(1),
            unTouch: () => unTouch,
            touch: () => touch(1),
            child: NavIcon(
              position: 1,
              svgPath: R.svg.statsIcon,
              navState: state,
            ),
          ),
        ],
      );
      await tester.pumpWidget(navBar.asScaffold);
      expect(find.byType(GestureDetector), findsNWidgets(2));

      await tester.press(find.byKey(const Key("first_icon")));
      await tester.pumpAndSettle();
      await tester.longPress(find.byKey(const Key("second_icon")));
      await tester.pumpAndSettle();
    });
  });
}
