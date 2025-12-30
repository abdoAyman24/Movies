import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/utils/app_color.dart';

class MovieDataBackGround extends StatelessWidget {
  const MovieDataBackGround({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 90.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColor.black.withValues(alpha: 0.005),
    
            AppColor.black.withValues(alpha: 0.15),
            AppColor.black.withValues(alpha: 0.6),
    
            AppColor.black.withValues(alpha: 0.8),
            AppColor.black.withValues(alpha: 0.9),
            AppColor.black,
          ],
        ),
      ),
    );
  }
}
