import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:productive/common/resources/r.dart';
import 'package:productive/features/home/widgets/animated_circle_progress.dart';
import 'package:productive/features/home/widgets/home_app_bar.dart';
import 'package:productive/features/home/widgets/home_body.dart';
import 'package:productive/features/home/widgets/home_bottom_nav_bar.dart';
import 'package:productive/features/home/widgets/home_fab.dart';

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

  group("Test Animated Nav Bar", () {
    setUpAll(() {
      R.buildMode.isTesting = true;
    });

    tearDownAll(() {
      R.buildMode.isTesting = false;
    });

    testWidgets("gestures are working", (WidgetTester tester) async {
      // ignore: prefer_const_constructors
      await tester.pumpWidget(BottomNav().insideMaterialApp);
      expect(find.byType(GestureDetector), findsNWidgets(2));

      await tester.press(find.byKey(const Key("first_icon")));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key("first_icon")));
      await tester.pumpAndSettle();
      await tester.longPress(find.byKey(const Key("first_icon")));
      await tester.pumpAndSettle();
      await tester.longPress(find.byKey(const Key("second_icon")));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key("second_icon")));
      await tester.pumpAndSettle();
    });
  });

  group("Test home Appbar", () {
    testWidgets("HomeAppbar contains DisplayPic Widget",
        (WidgetTester tester) async {
      // ignore: prefer_const_constructors
      await tester.pumpWidget(AppbarContent().asScaffold);
      expect(find.byType(DisplayPic), findsOneWidget);

      // ignore: prefer_const_constructors
      await tester.pumpWidget(DisplayPic().asScaffold);
      expect(find.byType(ClipRRect), findsOneWidget);
      expect(find.byType(CachedNetworkImage), findsOneWidget);
    });
  });

  group("Test Home Body", () {
    testWidgets("Home Body contains App Name", (WidgetTester tester) async {
      // ignore: prefer_const_constructors
      await tester.pumpWidget(HomeBody().asScaffold);
      expect(find.text(R.string.appName), findsOneWidget);
    });
  });

  group("Test Home Fab", () {
    testWidgets("Home Body contains App Name", (WidgetTester tester) async {
      // ignore: prefer_const_constructors
      await tester.pumpWidget(Fab().insideMaterialApp);
      await tester.press(find.byKey(const Key("home_fab")));
      await tester.pumpAndSettle();
    });
  });
}
