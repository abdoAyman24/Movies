import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/utils/app_color.dart';
import 'package:movies/core/utils/app_icon.dart';
import 'package:movies/core/utils/app_text_styles.dart';
import 'package:movies/core/widget/movie_icon.dart';

class HomeWelcom extends StatelessWidget {
  const HomeWelcom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MovieIcon(iconSize: 50),
            Text('Watched', style: AppText.bold23),
          ],
        ),
        const SizedBox(height: 20),
        Text('Welcome, Arpan', style: AppText.bold23),
        const SizedBox(height: 20),
        Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image(image: AssetImage(Assets.imagesImage)),
            ),
            Positioned(
              bottom: 2,
              right: 5,
              child: Icon(
                Icons.play_circle_fill_rounded,
                color: AppColor.white,
                size: 50,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
