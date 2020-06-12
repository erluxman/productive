import 'package:flutter/material.dart';

void main() {
  runApp(ProductiveApp());
}

class ProductiveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(Name(abc: "Laxman").abc),
        ),
      ),
    );
  }
}

class Name {
  Name({this.abc = "Hello World"});
  String abc;
}
