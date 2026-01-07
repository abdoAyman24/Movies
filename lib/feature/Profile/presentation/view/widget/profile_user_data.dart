

import 'package:flutter/material.dart';
import 'package:movies/core/helper/get_user_data.dart';
import 'package:movies/core/utils/app_color.dart';
import 'package:movies/core/utils/app_text_styles.dart';
import 'package:movies/feature/Profile/presentation/view/widget/profile_image.dart';

class ProfileUserData extends StatelessWidget {
  const ProfileUserData({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: BoxBorder.all(width: 1.3, color: AppColor.grey),
        borderRadius: BorderRadius.circular(10),
        color: AppColor.black.withValues(alpha: 0.5),
      ),
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(20),
        child: ListTile(
          leading: ProfileImage(),
          title: Text(getUser().name, style: AppText.semiBold20),
          subtitle: Text(
            getUser().email,
            style: AppText.medium18.copyWith(color: AppColor.grey),
          ),
          trailing: Icon(Icons.edit_note_sharp, size: 30, color: Colors.blue),
        ),
      ),
    );
  }
}
