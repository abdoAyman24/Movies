import 'package:flutter/material.dart';
import 'package:movies/core/utils/app_color.dart';

class OnBordingLinear extends StatelessWidget {
  const OnBordingLinear({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.01, 0.01),
                end: Alignment(1.00, 1.00),
                colors: [
                  AppColor.black.withValues(alpha: 0.2),
                  AppColor.black.withValues(alpha: 0.8),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
