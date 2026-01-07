import 'package:flutter/material.dart';
import 'package:movies/core/utils/app_text_styles.dart';
import 'package:movies/core/widget/custom_back_ground.dart';
import 'package:movies/feature/Profile/presentation/view/widget/profile_account_data.dart';
import 'package:movies/feature/Profile/presentation/view/widget/profile_premium.dart';
import 'package:movies/feature/Profile/presentation/view/widget/profile_user_data.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomBackGround(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Text('Profile ', style: AppText.bold28),
              const SizedBox(height: 20),
              ProfileUserData(),
              const SizedBox(height: 20),

              ProfilePremium(),
              const SizedBox(height: 20),

              ProfileAccountData(),
            ],
          ),
        ),
      ],
    );
  }
}
