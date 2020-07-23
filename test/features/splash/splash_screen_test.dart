import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lottie/lottie.dart';
import 'package:productive/common/resources/r.dart';
import 'package:productive/features/home/widgets/home_body.dart';
import 'package:productive/features/home/widgets/home_fab.dart';
import 'package:productive/features/splash/splash_screen.dart';
import 'package:productive/utils/animation/animated_scale.dart';

import '../../test_utils/test_utils.dart';

void main() {
  group("All required widgets are on the Splash screen", () {
    setUpAll(() {
      R.buildMode.isTesting = true;
    });

    tearDownAll(() {
      R.buildMode.isTesting = false;
    });
    testWidgets(
      "There is Lottie Widget",
      (WidgetTester tester) async {
        // ignore: prefer_const_constructors
        await tester.pumpWidget(SplashScreen().asScaffold);
        expect(find.byType(LottieBuilder), findsOneWidget);
      },
    );

    testWidgets(
      "There is a Productive Text Logo",
      (WidgetTester tester) async {
        await tester.pumpWidget(const SplashScreen().asScaffold);
        expect(find.byType(ShaderMask), findsOneWidget);
        expect(find.text(R.string.appName), findsOneWidget);
      },
    );

    testWidgets(
      "There is a Google Sign in Button",
      (WidgetTester tester) async {
        await tester.pumpWidget(const SplashScreen().asScaffold);
        expect(find.byType(AnimatedScale), findsOneWidget);
        expect(find.text(R.string.loginWithGoogle), findsOneWidget);
      },
    );

    testWidgets("Can navigate to HomeScreen", (WidgetTester tester) async {
      await tester.pumpWidget(const SplashScreen().asScaffold);
      final loginButton = find.byKey(const Key("login"));
      expect(loginButton, findsOneWidget);
      await tester.tap(loginButton);
      await tester.pumpAndSettle();
      expect(loginButton, findsNothing);
      expect(find.byType(HomeBody), findsOneWidget);
      expect(find.byType(Fab), findsOneWidget);
    });
  });
}
