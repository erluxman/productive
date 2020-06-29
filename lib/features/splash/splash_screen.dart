import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:productive/common/resources/r.dart';
import 'package:productive/features/home/widgets/home_screen.dart';
import 'package:productive/utils/animation/animated_scale_button.dart';
import 'package:productive/utils/extensions/gradient_extensions.dart';
import 'package:productive/utils/extensions/navigation_extension.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _audioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    super.initState();
    _audioPlayer.open(Audio(R.audio.splashBreeze),
        loopMode: LoopMode.single,
        playInBackground: PlayInBackground.disabledRestoreOnForeground,
        seek: const Duration(seconds: 2),
        volume: 0.5);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashScreenBody(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _audioPlayer.dispose();
  }
}

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        const Spacer(flex: 3),
        Lottie.asset(R.lottie.paperPlane, height: 300, width: 300),
        const Spacer(flex: 3),
        Text(
          R.string.appName,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 64),
        ).withBlueGradientFg(),
        const Spacer(flex: 5),
        ScaleOnPressWidget(
            gestureKey: "login",
            onTap: () {
              context.navigateTo(const HomeScreen(), replace: true);
            },
            outerPadding: const EdgeInsets.symmetric(horizontal: 48.0),
            innerPadding:
                const EdgeInsets.only(top: 12, bottom: 8, left: 12, right: 12),
            child: const SignInWithGoogleButton()),
        const Spacer(flex: 2)
      ],
    );
  }
}

class SignInWithGoogleButton extends StatelessWidget {
  const SignInWithGoogleButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SvgPicture.asset(R.svg.googleIcon),
        const SizedBox(width: 16),
        Text(
          R.string.loginWithGoogle,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
