import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:productive/common/resources/strings.dart';
import 'package:productive/features/home/widgets/home_screen.dart';
import 'package:productive/utils/animation/animated_scale.dart';
import 'package:productive/utils/extensions/navigation_extension.dart';
import 'package:productive/utils/extensions/gradient_extensions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen();

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
      children: const <Widget>[
        Spacer(flex: 3),
        PaperPlaneWidget(),
        Spacer(flex: 3),
        SplashLogo(),
        Spacer(flex: 5),
        LoginWithGoogle(),
        Spacer(flex: 2)
      ],
    );
  }
}

class PaperPlaneWidget extends StatelessWidget {
  const PaperPlaneWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Lottie.asset(
          'assets/lottie/paper_plane.json',
          height: 300,
          width: 300,
        ),
      ],
    );
  }
}

class SplashLogo extends StatelessWidget {
  const SplashLogo();

  @override
  Widget build(BuildContext context) {
    return Text(
      R.strings.appName,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 64,
        color: Colors.blue,
      ),
    ).withBlueGradientFg();
  }
}

class LoginWithGoogle extends StatefulWidget {
  const LoginWithGoogle();

  @override
  _LoginWithGoogleState createState() => _LoginWithGoogleState();
}

class _LoginWithGoogleState extends State<LoginWithGoogle> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (details) {
        setState(() {
          isPressed = true;
        });
      },
      onLongPressEnd: (details) {
        setState(() {
          isPressed = false;
        });
      },
      onTapDown: (details) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (details) {
        setState(() {
          isPressed = false;
        });
      },
      onTap: () {
        context.navigateTo(const HomeScreen());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48.0),
        child: AnimatedScale(
          duration: (isPressed ? 100 : 200).milliseconds,
          scale: isPressed ? 0.95 : 1.0,
          curve: Curves.decelerate,
          child: AnimatedContainer(
            duration: (isPressed ? 100 : 200).milliseconds,
            curve: Curves.decelerate,
            padding:
                const EdgeInsets.only(top: 12, bottom: 8, left: 12, right: 12),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: const Color(0x33CCCCCC),
                    blurRadius: isPressed ? 0 : 4,
                    offset: isPressed ? const Offset(0, 0) : const Offset(4, 4),
                    spreadRadius: isPressed ? 0 : 4)
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
    );
  }
}
