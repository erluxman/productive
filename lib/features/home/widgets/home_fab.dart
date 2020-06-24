import 'package:flutter/material.dart';
import 'package:productive/utils/extensions/gradient_extensions.dart';

class Fab extends StatelessWidget {
  const Fab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: RaisedButton(
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
          padding: const EdgeInsets.all(0.0),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Text(
              '+ Add Todo',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ).withBlueGradientBg(),
        ));
  }
}
