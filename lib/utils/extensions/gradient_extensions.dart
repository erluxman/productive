import 'package:flutter/material.dart';

extension WidgetUnderGradient on Widget {
  Widget withBlueGradientFg() {
    return _getShadedWidget(blueLinearGradient);
  }

  Widget withGreyGradientFg() {
    return _getShadedWidget(greyLinearGradient);
  }

  Widget _getShadedWidget(LinearGradient gradient) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (Rect bound) {
        return gradient.createShader(bound);
      },
      child: this,
    );
  }

  Widget withBlueGradientBg(
      {BorderRadiusGeometry borderRadius =
          const BorderRadius.all(Radius.circular(200.0))}) {
    return Ink(
      decoration: BoxDecoration(
        gradient: blueLinearGradient,
        borderRadius: borderRadius,
      ),
      child: this,
    );
  }
}

LinearGradient blueLinearGradient = getLinearGradient(blueGradientColors);
LinearGradient greyLinearGradient = getLinearGradient(_greyGradientColors);

LinearGradient getLinearGradient(List<Color> colors) {
  return LinearGradient(
    colors: colors,
    begin: const Alignment(-1.0, -1.0),
    end: const Alignment(0.7, 0.7),
    transform: const GradientRotation(-3.14 / 3),
  );
}

const List<Color> blueGradientColors = [Color(0xFF0186FF), Color(0xFF00C2FF)];
const List<Color> _greyGradientColors = [Color(0xFFD0D1D1), Color(0xFF8E9496)];
