import 'package:flutter/material.dart';
import 'package:productive/features/splash/spalash_screen.dart';
void main() {
  runApp(ProductiveApp());
}

class ProductiveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Product Sans',
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
