import 'package:flutter/material.dart';

extension TestWidget on Widget {
  Widget get testWidget =>
      Directionality(textDirection: TextDirection.ltr, child: this);
}
