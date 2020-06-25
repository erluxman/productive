import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive/common/resources/strings.dart';
import 'package:productive/utils/animation/animated_scale_button.dart';
import 'package:productive/utils/extensions/gradient_extensions.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  NavButtonsState navState =
      const NavButtonsState(selectedIndex: 0, pressedIndex: -1);

  int selectedIndex = 0;

  void _selectPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void _selectHome() => _selectPage(0);

  void _selectStats() => _selectPage(1);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
            color: Color(0x33CCCCCC),
            offset: Offset(-4, -4),
            blurRadius: 8,
            spreadRadius: 8)
      ]),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        child: BottomAppBar(
          elevation: 20,
          shape: const AutomaticNotchedShape(
            RoundedRectangleBorder(),
            StadiumBorder(
              side: BorderSide(),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ScaleOnPressWidget(
                  scaleFactor: 0.8,
                  onTap: _selectHome,
                  outerPadding: const EdgeInsets.all(16),
                  child: SvgPicture.asset(
                    R.svgImages.homeIcon,
                    height: selectedIndex == 0 ? 32 : 24,
                  ).getShadedWidget(selectedIndex == 0
                      ? blueLinearGradient
                      : greyLinearGradient),
                ),
                ScaleOnPressWidget(
                  scaleFactor: 0.8,
                  onTap: _selectStats,
                  outerPadding: const EdgeInsets.all(16),
                  child: SvgPicture.asset(
                    R.svgImages.statsIcon,
                    height: selectedIndex == 1 ? 32 : 24,
                  ).getShadedWidget(selectedIndex == 1
                      ? blueLinearGradient
                      : greyLinearGradient),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NavButtonsState {
  const NavButtonsState({this.selectedIndex, this.pressedIndex});

  final int selectedIndex;
  final int pressedIndex;
  
}
