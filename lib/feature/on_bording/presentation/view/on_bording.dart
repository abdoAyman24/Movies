import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/utils/app_text_styles.dart';
import 'package:movies/core/widget/custom_button.dart';
import 'package:movies/core/widget/movie_icon.dart';
import 'package:movies/feature/auth/presentation/View/login.dart';
import 'package:movies/feature/auth/presentation/View/register.dart';
import 'package:movies/feature/on_bording/presentation/view/widget/on_bording_image.dart';
import 'package:movies/feature/on_bording/presentation/view/widget/on_bording_linear.dart';

class OnBording extends StatelessWidget {
  const OnBording({super.key});
  static const String routeName = 'onBording';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          OnBordingImage(),
          OnBordingLinear(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 90.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MovieIcon(iconSize: 80),
                    const Text('Movies', style: AppText.bold32),
                  ],
                ),

                const SizedBox(height: 20),

                CustomButton(
                  onTap: () {
                    Navigator.pushNamed(context, Login.routeName);
                  },
                  text: 'Login',
                ),
                const SizedBox(height: 25),
                CustomButton(
                  onTap: () {
                    Navigator.pushNamed(context, Register.routeName);
                  },
                  text: 'Register',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
