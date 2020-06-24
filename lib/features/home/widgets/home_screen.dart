import 'package:flutter/material.dart';
import 'package:productive/features/home/widgets/home_body.dart';

import 'home_app_bar.dart';
import 'home_bottom_nav_bar.dart';
import 'home_fab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeBody(),
      appBar: homeAppbar,
      floatingActionButton: const Fab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomNav(),
    );
  }
}
