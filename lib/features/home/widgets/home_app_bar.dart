import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppbarContent extends StatelessWidget {
  const AppbarContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            const MotivationMeter(motivation: 0.8),
            ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: Image.network(johnDoeImage, height: 32, width: 32),
            ),
          ],
        ),
        const Text(
          "Todo",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
        ),
        SvgPicture.asset(
          "assets/images/success.svg",
          height: 32,
          width: 32,
        )
      ],
    );
  }
}

class MotivationMeter extends StatelessWidget {
  const MotivationMeter({
    this.motivation,
    Key key,
  })  : assert(motivation <= 1.0 && motivation >= 0),
        super(key: key);

  final double motivation;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      width: 58,
      decoration: ShapeDecoration(
          shape: const CircleBorder(),
          gradient: SweepGradient(
              colors: [
                const Color(0xFF0286FF),
                const Color(0xFF0290FF),
                const Color(0xFF0199FF),
                const Color(0xFF01AAFF),
                const Color(0xFF01BBFF),
                const Color(0xFF00C2FF),
                const Color(0xFF00C2FF),
                Colors.transparent,
              ],
              startAngle: pi / 2,
              endAngle: 2 * motivation * pi,
              transform: const GradientRotation(3 * pi / 2))),
    );
  }
}

AppBar homeAppbar =
    AppBar(title: const AppbarContent(), automaticallyImplyLeading: false);

String johnDoeImage =
    "https://themes.themewaves.com/nuzi/wp-content/uploads/sites/4/2013/05/Team-Member-3.jpg";
