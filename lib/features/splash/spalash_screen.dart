import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashScreenBody(),
    );
  }
}

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        const Spacer(
          flex: 3,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Lottie.asset(
              'assets/lottie/paper_plane.json',
              height: 300,
              width: 300,
            ),
          ],
        ),
        const Spacer(
          flex: 3,
        ),
        Text(
          "Productive",
          style: Theme.of(context).textTheme.headline2.copyWith(
                fontWeight: FontWeight.w700,
                color: Colors.blue,
              ),
        ),
        const Spacer(
          flex: 5,
        ),
        InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48.0),
            child: Container(
              padding: const EdgeInsets.only(
                  top: 12, bottom: 8, left: 12, right: 12),
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Color(0x33CCCCCC),
                      blurRadius: 4,
                      offset: Offset(4, 4),
                      spreadRadius: 4)
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(200),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset("assets/images/google.svg"),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    "Continue with google",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Spacer(
          flex: 2,
        )
      ],
    );
  }
}
