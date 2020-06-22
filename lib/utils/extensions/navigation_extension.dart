import 'package:flutter/material.dart';
import 'package:dartx/dartx.dart';

extension NavigationExtension on BuildContext {
  Future<void> navigateTo(
    Widget destination, {
    Duration delay = const Duration(),
  }) async {
    await delay.delay;
    Navigator.of(this)
        .push(MaterialPageRoute(builder: (context) => destination));
  }
}
