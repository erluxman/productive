import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';

import 'animated_scale.dart';

class ScaleOnPressWidget extends StatefulWidget {
  const ScaleOnPressWidget(
      {this.child,
      this.onTap,
      this.outerPadding = EdgeInsets.zero,
      this.innerPadding = EdgeInsets.zero,
      this.scaleFactor = 0.95,
      Key key})
      : super(key: key);

  final Widget child;
  final GestureTapCallback onTap;
  final EdgeInsets outerPadding;
  final EdgeInsets innerPadding;
  final double scaleFactor;

  @override
  _ScaleOnPressWidgetState createState() => _ScaleOnPressWidgetState();
}

class _ScaleOnPressWidgetState extends State<ScaleOnPressWidget> {
  bool isPressed = false;

  void _unPress() => _update(false);

  void _press() => _update(true);

  void _update(bool pressed) {
    setState(() {
      isPressed = pressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onLongPressStart: (_) => _press,
      onLongPressEnd: (_) => _unPress,
      onTapDown: (_) => _press,
      onTapUp: (_) => _unPress,
      onLongPress: _press,
      onLongPressUp: _unPress,
      onDoubleTap: _press,
      onTap: widget.onTap,
      child: Padding(
        padding: widget.outerPadding,
        child: AnimatedScale(
          duration: (isPressed ? 50 : 200).milliseconds,
          scale: isPressed ? widget.scaleFactor : 1.0,
          curve: Curves.decelerate,
          child: AnimatedContainer(
            duration: (isPressed ? 50 : 200).milliseconds,
            curve: Curves.decelerate,
            padding: widget.innerPadding,
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
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
