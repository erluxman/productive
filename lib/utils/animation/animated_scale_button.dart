import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';

import 'animated_scale.dart';

class ScaleOnPressWidget extends StatefulWidget {
  const ScaleOnPressWidget(
      {this.child,
      this.onTap,
      this.outerPadding = EdgeInsets.zero,
      this.innerPadding = EdgeInsets.zero,
      this.scaleFactor = 0.95});

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
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
      onLongPress: () {
        setState(() {
          isPressed = true;
        });
      },
      onLongPressUp: () {
        setState(() {
          isPressed = false;
        });
      },
      onSecondaryTapUp: (details) {
        setState(() {
          isPressed = false;
        });
      },
      onDoubleTap: () {
        setState(() {
          isPressed = true;
        });
      },
      onTap: () {
        widget.onTap();
        setState(() {
          isPressed = true;
        });
      },
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
