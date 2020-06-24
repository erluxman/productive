import 'package:flutter/material.dart';
import 'package:productive/features/home/home_screen.dart';
import 'package:productive/utils/design/colors.dart';

void main() {
  runApp(ProductiveApp());
}

class ProductiveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'Product Sans', primarySwatch: whiteMaterialColor),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
