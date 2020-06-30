import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:productive/common/resources/r.dart';
import 'package:productive/features/home/widgets/home_app_bar.dart';
import 'package:productive/features/home/widgets/home_bottom_nav_bar.dart';
import 'package:productive/features/home/widgets/home_fab.dart';
import 'package:productive/features/home/widgets/home_screen.dart';

import '../../utils/widget/test_utils.dart';

void main() {
  group("All required widgets are on the Home screen", () {
    testWidgets(
      "Fab,BottomNav and AppbarContent exist",
      (WidgetTester tester) async {
        await tester.pumpWidget(const HomeScreen().asScaffold);
        expect(find.byType(Fab), findsOneWidget);
        expect(find.byType(RaisedButton), findsOneWidget);
        expect(find.byType(BottomNav), findsOneWidget);
        expect(find.byType(AppbarContent), findsOneWidget);
        expect(find.byType(CachedNetworkImage), findsOneWidget);

        await tester.pumpWidget(const Fab().testWidget);
        expect(find.text(R.string.addTodo), findsOneWidget);
      },
    );
  });
}

