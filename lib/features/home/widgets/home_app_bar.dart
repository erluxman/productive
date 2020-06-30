import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive/common/resources/r.dart';

import 'animated_circle_progress.dart';

class AppbarContent extends StatelessWidget {
  const AppbarContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: const <Widget>[
            AnimatedMotivationMeter(motivation: 0.6, height: 42, width: 42),
            DisplayPic(height: 36, width: 36),
          ],
        ),
        Text(
          R.string.todo,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
        ),
        SvgPicture.asset(R.svg.successIcon, height: 28, width: 28)
      ],
    );
  }
}

class DisplayPic extends StatelessWidget {
  const DisplayPic({this.height, this.width, Key key}) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(200),
      child: R.buildMode.isTesting
          ? Container()
          : CachedNetworkImage(
              imageUrl: R.placeholders.johDoeImage,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              height: height,
              width: width,
            ),
    );
  }
}
