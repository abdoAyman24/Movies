import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/utils/app_text_styles.dart';

class MoviesTypeTitle extends StatelessWidget {
  const MoviesTypeTitle({
    super.key,
    required this.moviesType,
    required this.onTap, required this.widget,
  });

  final String moviesType;
  final VoidCallback onTap;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(moviesType, style: AppText.bold23),
            InkWell(
              onTap: onTap,
              child: Text(
                'See All,',
                style: AppText.regular18.copyWith(
                  //textBaseline: TextBaseline.ideographic,
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(height: 70.h, child:widget),
      ],
    );
  }
}
