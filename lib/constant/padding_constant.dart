import 'package:flutter/material.dart';

class PaddingConstant {
  PaddingConstant._();

  static EdgeInsetsGeometry top({required top, required others}) {
    return EdgeInsets.only(
      top: top,
      left: others,
      right: others,
      bottom: others,
    );
  }

  static EdgeInsetsGeometry bottom({
    required double bottom,
    required double others,
  }) {
    return EdgeInsets.only(
      top: others,
      left: others,
      right: others,
      bottom: bottom,
    );
  }
}
