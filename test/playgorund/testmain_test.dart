import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:productive/common/resources/r.dart';
import 'package:productive/features/home/widgets/home_screen.dart';
import 'package:productive/playground/test_main.dart';

import '../utils/widget/test_utils.dart';

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

  group("dummy tests for reference doesn't mean anything at all", () {
    testWidgets(
      "When a button is long pressed, it has 80% size",
      (WidgetTester tester) async {
        await tester.pumpWidget(const HomeScreen().asScaffold);
        await tester.press(find.byWidgetPredicate((widget) =>
            (widget is SvgPicture) &&
            (widget.pictureProvider as ExactAssetPicture).assetName ==
                R.svg.homeIcon));
        await tester.pump();
        SvgPicture homeIcon = tester.firstWidget(find.byWidgetPredicate(
            (widget) =>
                (widget is SvgPicture) &&
                (widget.pictureProvider as ExactAssetPicture).assetName ==
                    R.svg.homeIcon));

        await tester.press(find.byWidgetPredicate((widget) =>
            (widget is SvgPicture) &&
            (widget.pictureProvider as ExactAssetPicture).assetName ==
                R.svg.statsIcon));
        await tester.pump();
        homeIcon = tester.firstWidget(find.byWidgetPredicate((widget) =>
            (widget is SvgPicture) &&
            (widget.pictureProvider as ExactAssetPicture).assetName ==
                R.svg.homeIcon));
        homeIcon.asScaffold;
      },
    );
  });
}
