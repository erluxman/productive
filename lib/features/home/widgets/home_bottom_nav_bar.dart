import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive/common/resources/strings.dart';
import 'package:productive/utils/extensions/gradient_extensions.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selectedIndex = 0;

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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SvgPicture.asset(
                    R.svgImages.homeIcon,
                  ).withGreyGradientFg(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SvgPicture.asset(
                    R.svgImages.statsIcon,
                  ).withBlueGradientFg(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}