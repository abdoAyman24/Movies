import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/utils/app_color.dart';
import 'package:movies/core/utils/app_text_styles.dart';
import 'package:movies/core/widget/custom_button.dart';
import 'package:movies/core/widget/custom_text_form_field.dart';
import 'package:movies/core/widget/movie_icon.dart';
import 'package:movies/feature/auth/presentation/View/widget/auth_back_ground.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AuthBackGround(),

        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50.h),
                  MovieIcon(iconSize: 100),
                  const SizedBox(height: 20),
                  CustomTextForm(
                    hint: 'User Name',
                    onSave: (value) {},
                    keyboardType: TextInputType.emailAddress,
                    textFormColor: AppColor.grey,
                    preffixIcon: Icon(Icons.person_3_rounded, size: 25),
                  ),
                  CustomTextForm(
                    hint: 'Email',
                    onSave: (value) {},
                    keyboardType: TextInputType.emailAddress,
                    textFormColor: AppColor.grey,
                    preffixIcon: Icon(Icons.person_3_rounded, size: 25),
                  ),
                  CustomTextForm(
                    hint: 'Password',
                    onSave: (value) {},
                    keyboardType: TextInputType.multiline,
                    textFormColor: AppColor.grey,
                    preffixIcon: Icon(Icons.lock, size: 25),
                    showSuffixIcon: true,
                  ),
                  CustomTextForm(
                    hint: 'Confirm Password',
                    onSave: (value) {},
                    keyboardType: TextInputType.multiline,
                    textFormColor: AppColor.grey,
                    preffixIcon: Icon(Icons.lock, size: 25),
                    showSuffixIcon: true,
                  ),
                  CustomButton(onTap: () {}, text: 'Login'),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an Account? ',
                        style: AppText.regular13,
                      ),
                      Text(
                        'Login',
                        style: AppText.semiBold16.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 10,
          height: 100,
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios_new, size: 30),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
