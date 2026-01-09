import 'package:flutter/material.dart';

class SizesConstant {
  SizesConstant._();
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double widthPercentage(BuildContext context, double percent) =>
      screenWidth(context) * (percent / 100);

  static double heightPercentage(BuildContext context, double percent) =>
      screenHeight(context) * (percent / 100);
}
