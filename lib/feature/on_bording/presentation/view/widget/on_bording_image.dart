import 'package:flutter/material.dart';
import 'package:movies/core/utils/app_icon.dart';

class OnBordingImage extends StatelessWidget {
  const OnBordingImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image(
      width: double.infinity,
      image: AssetImage(Assets.imagesOnBordingImage),
      fit: BoxFit.fill,
    );
  }
}
