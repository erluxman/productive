import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

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
