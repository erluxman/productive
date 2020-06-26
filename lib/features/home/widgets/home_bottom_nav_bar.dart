import 'package:flutter/material.dart';

import 'animated_nav_button.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  NavButtonsState navState =
      const NavButtonsState(selectedIndex: 0, pressedIndex: -1);

  void _selectPage(int index) {
    setState(() {
      navState = navState.copyWith(selectedIndex: index);
    });
  }

  void _touchIcon(int index) {
    setState(() {
      navState = navState.copyWith(pressedIndex: index);
    });
  }

  void _selectHome() => _selectPage(0);

  void _touchHomeIcon() => _touchIcon(0);

  void _selectStats() => _selectPage(1);

  void _touchStatsIcon() => _touchIcon(1);

  void _unTouch() => _touchIcon(-1);

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              AnimatedNavIcon(
                navState: navState,
                select: _selectHome,
                unTouch: _unTouch,
                touch: _touchHomeIcon,
                child: HomeIcon(navState: navState),
              ),
              AnimatedNavIcon(
                navState: navState,
                select: _selectStats,
                unTouch: _unTouch,
                touch: _touchStatsIcon,
                child: StatsIcon(navState: navState),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
