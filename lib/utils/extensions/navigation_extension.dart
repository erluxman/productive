import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  Future<void> navigateTo(
    Widget destination, {
    Duration delay = const Duration(),
    bool replace = false,
  }) async {
    await delay.delay;
    final route = _createRoute(destination);

    if (replace) {
      Navigator.of(this).pushReplacement(route);
    } else {
      Navigator.of(this).push(route);
    }
  }

  PageRouteBuilder _createRoute(Widget destination) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => destination,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.decelerate;

        final tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }
}
