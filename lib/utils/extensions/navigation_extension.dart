import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  Future<void> navigateTo(Widget destination,
      {Duration delay = const Duration(), bool replace = false}) async {
    await delay.delay;
    final route = MaterialPageRoute(builder: (context) => destination);
    if (replace) {
      Navigator.of(this).pushReplacement(route);
    } else {
      Navigator.of(this).push(route);
    }
  }
}
