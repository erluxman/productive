import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:productive/utils/extensions/gradient_extensions.dart';

import '../../test_utils/test_utils.dart';

void main() {
  group("Gradient Extensions Test", () {
    testWidgets(
      "Gradient on Foreground Test",
      (WidgetTester tester) async {
        final Widget blueFg = const Text("").withBlueGradientFg().testWidget;
        await tester.pumpWidget(blueFg);
        expect(find.byType(ShaderMask), findsOneWidget);
        final Widget greyFg = const Text("").withBlueGradientFg().testWidget;
        await tester.pumpWidget(greyFg);
        expect(find.byType(ShaderMask), findsOneWidget);
      },
    );

    testWidgets(
      "Gradient on Background Test",
      (WidgetTester tester) async {
        final Widget blueBg =
            const Text("").withBlueGradientBg().insideMaterialApp;
        await tester.pumpWidget(blueBg);
        expect(find.byType(Ink), findsOneWidget);
      },
    );
  });
}
