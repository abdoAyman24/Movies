import 'package:flutter/material.dart';
import 'package:movies/core/utils/app_color.dart';

class CustomBackGround extends StatelessWidget {
  const CustomBackGround({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: ShapeDecoration(
              gradient: LinearGradient(
                begin: Alignment(0, -0.8),
                end: Alignment(0.5, 1),
                colors: [
                  AppColor.secondPrimary,
                  AppColor.primary,
                  AppColor.secondPrimary,
                ],
                tileMode: TileMode.clamp,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x3F463F3F),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
