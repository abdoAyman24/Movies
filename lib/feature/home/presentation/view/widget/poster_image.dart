import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/utils/app_color.dart';
import 'package:movies/core/widget/custom_cach_network_image.dart';

class PosterImage extends StatelessWidget {
  const PosterImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  width: 70.w,
                  child: CustomCachNetworkImage(imageUrl: imageUrl),
                ),
                const SizedBox(height: 15),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusGeometry.circular(50),
                      color: Colors.red,
                    ),
                    child: Padding(
                      padding: EdgeInsetsGeometry.all(15),
                      child: Icon(Icons.play_arrow, color: AppColor.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
