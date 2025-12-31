import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/utils/app_color.dart';
import 'package:movies/core/utils/end_point.dart';

class CustomCachNetworkImage extends StatelessWidget {
  const CustomCachNetworkImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: EndPoint.imageBaseUrl + imageUrl,
      errorWidget: (context, url, error) {
        return Center(
          child: Icon(Icons.error_outline, color: AppColor.grey, size: 80),
        );
      },
    );
  }
}
