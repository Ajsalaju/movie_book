import 'package:flutter/material.dart';

class Sizing {
  static double width(double width, BuildContext context) {
    return MediaQuery.of(context).size.width * (width / 380);
  }

  static double height(double height, BuildContext context) {
    return MediaQuery.of(context).size.height * (height / 802);
  }
}
