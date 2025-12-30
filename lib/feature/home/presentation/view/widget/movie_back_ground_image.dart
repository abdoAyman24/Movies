import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/utils/end_point.dart';

class MovieBackGroundImage extends StatelessWidget {
  const MovieBackGroundImage({
    super.key,
    required this.backGroundImagUrl,
  });

  final String backGroundImagUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: double.infinity,
      imageUrl: EndPoint.imageBaseUrl +backGroundImagUrl ,
      fit: BoxFit.cover,
    );
  }
}