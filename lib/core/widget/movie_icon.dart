import 'package:flutter/material.dart';
import 'package:movies/core/utils/app_icon.dart';

class MovieIcon extends StatelessWidget {
  final double iconSize;
  const MovieIcon({super.key, required this.iconSize});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(Assets.imagesMovieIcon),
      width: iconSize,
      height: iconSize,
    );
  }
}
