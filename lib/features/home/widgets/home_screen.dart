import 'package:flutter/material.dart';
import 'package:productive/features/home/widgets/home_body.dart';
import 'package:productive/utils/animation/animated_scale_button.dart';

import 'home_app_bar.dart';
import 'home_bottom_nav_bar.dart';
import 'home_fab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeBody(),
      appBar: AppBar(
          title: const AppbarContent(), automaticallyImplyLeading: false),
      floatingActionButton: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        child: ScaleOnPressWidget(
          key: Key("home_fab"),
          child: Fab(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomNav(),
    );
  }
}
