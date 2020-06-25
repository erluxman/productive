import 'package:flutter/material.dart';
import 'package:productive/features/home/widgets/home_screen.dart';
import 'package:productive/features/splash/splash_screen.dart';
import 'package:productive/utils/design/colors.dart';

void main() => runApp(const ProductiveApp());

class ProductiveApp extends StatelessWidget {
  const ProductiveApp({Key key, this.testChild}) : super(key: key);
  final Widget testChild;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'Product Sans', primarySwatch: whiteMaterialColor),
      debugShowCheckedModeBanner: false,
      home: testChild ?? const SplashScreen(),
    );
  }
}
