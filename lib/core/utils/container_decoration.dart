import 'package:flutter/material.dart';
import 'package:movies/core/utils/app_color.dart';

ShapeDecoration containerDecration(double borderCircler) {
  return ShapeDecoration(
    gradient: LinearGradient(
      begin: Alignment(0, 0),
      end: Alignment(1.00, 1.00),
      colors: [AppColor.secondPrimary, AppColor.primary],
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderCircler),
    ),
    shadows: [
      BoxShadow(
        color: Color(0x3F463F3F),
        blurRadius: 4,
        offset: Offset(0, 4),
        spreadRadius: 0,
      ),
    ],
  );
}
