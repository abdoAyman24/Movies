import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/utils/app_icon.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(50),
      child: SizedBox(
        width: 50,
        height: 50,
        child: SvgPicture.asset(Assets.imagesProfileImage),
      ),
    );
  }
}
