import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive/common/resources/r.dart';
import 'package:productive/utils/animation/animated_scale.dart';
import 'package:productive/utils/extensions/gradient_extensions.dart';

class AnimatedNavIcon extends StatelessWidget {
  const AnimatedNavIcon({
    Key key,
    @required this.navState,
    @required this.select,
    @required this.touch,
    @required this.unTouch,
    @required this.child,
  }) : super(key: key);
  final NavButtonsState navState;
  final Function() select;
  final Function() touch;
  final Function() unTouch;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: select,
      onLongPress: touch,
      onLongPressUp: unTouch,
      onTapUp: (_) => unTouch,
      onLongPressStart: (_) => touch,
      onLongPressEnd: (_) => unTouch,
      child: child,
    );
  }
}

class HomeIcon extends StatelessWidget {
  const HomeIcon({Key key, @required this.navState}) : super(key: key);

  final NavButtonsState navState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 200),
        scale: _getScale(0, navState),
        child: SvgPicture.asset(
          R.svg.homeIcon,
          height: 32,
        ).getShadedWidget(_getGradient(0, navState)),
      ),
    );
  }
}

class StatsIcon extends StatelessWidget {
  const StatsIcon({Key key, @required this.navState}) : super(key: key);

  final NavButtonsState navState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 200),
        scale: _getScale(1, navState),
        child: SvgPicture.asset(
          R.svg.statsIcon,
          height: 32,
        ).getShadedWidget(_getGradient(1, navState)),
      ),
    );
  }
}

LinearGradient _getGradient(int buttonIndex, NavButtonsState navState) {
  return buttonIndex == navState.selectedIndex
      ? blueLinearGradient
      : greyLinearGradient;
}

double _getScale(int buttonIndex, NavButtonsState navState) {
  if (buttonIndex == navState.pressedIndex &&
      buttonIndex == navState.selectedIndex) return 0.8;
  if (buttonIndex == navState.pressedIndex) return 0.6;
  if (buttonIndex != navState.pressedIndex &&
      buttonIndex != navState.selectedIndex) return 0.8;
  return 1.0;
}

class NavButtonsState {
  const NavButtonsState({this.selectedIndex, this.pressedIndex});

  final int selectedIndex;
  final int pressedIndex;

  NavButtonsState copyWith({
    int selectedIndex,
    int pressedIndex,
  }) {
    if ((selectedIndex == null ||
        identical(selectedIndex, this.selectedIndex)) &&
        (pressedIndex == null || identical(pressedIndex, this.pressedIndex))) {
      return this;
    }

    return NavButtonsState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      pressedIndex: pressedIndex ?? this.pressedIndex,
    );
  }
}