import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lottie/lottie.dart';
import 'package:productive/common/resources/strings.dart';
import 'package:productive/features/splash/splash_screen.dart';
import 'package:productive/main.dart';
import 'package:productive/utils/animation/animated_scale.dart';

import 'test_utils.dart';

void main() {
  group("Basic App Setup test", () {
    testWidgets('App Follows MaterialTheme', (WidgetTester tester) async {
      await tester.pumpWidget(ProductiveApp(
        testChild: Container(),
      ));
      expect(find.byType(MaterialApp), findsOneWidget);
    });
  });

  group("Splash Screen Tests", () {
    testWidgets("There is Lottie Widget", (WidgetTester tester) async {
      await tester.pumpWidget(const SplashScreenBody().testWidget);
      expect(find.byType(LottieBuilder), findsOneWidget);
    });

    testWidgets("There is a Productive Text Logo", (WidgetTester tester) async {
      await tester.pumpWidget(const SplashScreenBody().testWidget);
      expect(find.byType(ShaderMask), findsOneWidget);
      expect(find.text(R.strings.appName), findsOneWidget);
    });

    testWidgets("There is a Google Sign in Button",
        (WidgetTester tester) async {
      await tester.pumpWidget(const SplashScreenBody().testWidget);
      expect(find.byType(AnimatedScale), findsOneWidget);
      expect(find.text("Continue with google"), findsOneWidget);
    });
  });
}
