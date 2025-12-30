import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/utils/app_color.dart';

class BackBottom extends StatelessWidget {
  const BackBottom({super.key,required this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 7.w,
      top: 8.h,
      child: GestureDetector(
        onTap:onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
            color: AppColor.grey.withValues(alpha: 0.4),
          ),
          child: Padding(
            padding: EdgeInsetsGeometry.all(18),
            child: Icon(Icons.arrow_back_ios_new),
          ),
        ),
      ),
    );
  }
}
