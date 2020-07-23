import 'package:flutter/material.dart';

extension TestWidget on Widget {
  Widget get testWidget =>
      Directionality(textDirection: TextDirection.ltr, child: this);

  Widget get asScaffold => MaterialApp(home: this);

  Widget get insideMaterialApp =>MaterialApp(home: Scaffold(body: this,));
}
