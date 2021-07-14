import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:dartx/dartx.dart';
import 'package:productive/features/home/home_screen.dart';
import 'package:productive/utils/extensions/navigation_extension.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen();

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.navigateTo(const HomeScreen(), delay: 20.seconds);
  }

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
        ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (Rect bound) {
            return const LinearGradient(
              colors: [
                Color(0xFF01A4FF),
                Color(0xFF0186FF),
              ],
              begin: Alignment(-1.0, -8.0),
              end: Alignment(1.0, 4.0),
            ).createShader(bound);
          },
          child: Text(
            "Productive",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 64,
              color: Colors.blue,
            ),
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
