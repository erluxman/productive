import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:productive/common/resources/r.dart';
import 'package:productive/utils/extensions/gradient_extensions.dart';

class AnimatedMotivationMeter extends StatefulWidget {
  const AnimatedMotivationMeter({
    this.motivation,
    this.height,
    this.width,
    Key key,
  })  : assert(motivation <= 1.0 && motivation >= 0),
        super(key: key);

  final double motivation;
  final double height;
  final double width;

  @override
  _AnimatedMotivationMeterState createState() =>
      _AnimatedMotivationMeterState();
}

class _AnimatedMotivationMeterState extends State<AnimatedMotivationMeter>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  final _audioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    super.initState();
    _audioPlayer.open(Audio(R.audio.welcomeTone), volume: 0.5);
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    animation = Tween<double>(
      begin: widget.motivation * 0.5,
      end: widget.motivation,
    ).chain(CurveTween(curve: Curves.decelerate)).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      willChange: true,
      painter: CircleProgressPainter(widget.motivation, animation.value),
      size: Size(widget.width, widget.height),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    controller.dispose();
    super.dispose();
  }
}

class CircleProgressPainter extends CustomPainter {
  CircleProgressPainter(this.maxMotivation, this.animatingMotivation) {
    endAngle = pi * 2 * min(animatingMotivation, 0.95);
  }

  final double startAngle = -pi / 2;
  final double gradientRotationAngle = -pi / 2 - 0.14;
  double endAngle;
  final double maxMotivation;
  final double animatingMotivation;
  Paint _ink;

  @override
  void paint(Canvas canvas, Size size) {
    _ink ??= Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round
      ..shader = SweepGradient(
              colors: blueGradientColors,
              startAngle: startAngle,
              endAngle: endAngle,
              transform: GradientRotation(gradientRotationAngle))
          .createShader(
        Rect.fromCenter(
            center: Offset(size.height / 2, size.width / 2),
            width: size.width,
            height: size.height),
      );
    canvas.drawArc(
        Rect.fromCenter(
            center: Offset(size.height / 2, size.width / 2),
            width: size.width,
            height: size.height),
        startAngle,
        endAngle,
        false,
        _ink);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
