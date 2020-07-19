import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:productive/features/home/widgets/home_screen.dart';

import '../utils/extensions/navigation_extension.dart';

class DummyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Screen1(),
    );
  }
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            MaterialButton(
              key: const Key("go_screen_2"),
              onPressed: () {
                context.navigateTo(Screen2());
              },
              child: const Text("Go to screen2"),
            ),
            GestureDetector(
              key: const Key("gd1"),
              onTap: () {
                context.navigateTo(Screen2());
              },
              child: const Text("Jump to screen2"),
            ),
          ],
        ),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            MaterialButton(
              key: const Key("go_screen_1"),
              onPressed: () {
                context.navigateTo(Screen1());
//            Navigator.of(context)
//                .push(MaterialPageRoute(builder: (context) => Screen1()));
              },
              child: const Text("Go to screen1"),
            ),
            GestureDetector(
              key: const Key("gd2"),
              onTap: () {
                context.navigateTo(Screen1());
              },
              child: const Text("Jump to screen1"),
            )
          ],
        ),
      ),
    );
  }
}
