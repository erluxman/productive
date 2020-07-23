import 'package:flutter/material.dart';
import 'package:productive/common/resources/r.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(R.string.appName),
    );
  }
}
