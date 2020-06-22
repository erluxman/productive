import 'package:flutter/material.dart';
import 'package:productive/features/splash/spalash_screen.dart';

void main() {
  runApp(ProductiveApp());
}

class ProductiveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(Name(abc: "Laxman").abc),
      ),
    );
  }
}

class Name {
  Name({this.abc = "Hello World"});

  String abc;
}
