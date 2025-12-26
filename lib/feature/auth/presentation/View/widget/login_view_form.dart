import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/helper/show_message.dart';
import 'package:movies/core/utils/app_color.dart';
import 'package:movies/core/widget/custom_button.dart';
import 'package:movies/core/widget/custom_text_form_field.dart';
import 'package:movies/core/widget/movie_icon.dart';
import 'package:movies/feature/auth/presentation/View/login.dart';
import 'package:movies/feature/auth/presentation/manager/cubit/auth_cubit.dart';

class LoginViewForm extends StatefulWidget {
  const LoginViewForm({super.key});

  @override
  State<LoginViewForm> createState() => _LoginViewFormState();
}

class _LoginViewFormState extends State<LoginViewForm> {
  final GlobalKey<FormState> _globalKey = GlobalKey();

  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  late String email;

  late String password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _globalKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 75.h),
          MovieIcon(iconSize: 100),
          const SizedBox(height: 20),
          CustomTextForm(
            hint: 'Email',
            onSave: (value) {
              email = value!;
            },
            keyboardType: TextInputType.emailAddress,
            textFormColor: AppColor.grey,
            preffixIcon: Icon(Icons.email_rounded, size: 25),
          ),
          CustomTextForm(
            hint: 'Password',

            onSave: (value) {
              password = value!;
            },
            keyboardType: TextInputType.multiline,
            textFormColor: AppColor.grey,
            preffixIcon: Icon(Icons.lock, size: 25),
            showSuffixIcon: true,
          ),
          SizedBox(height: 20.h),

          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is SignInSuccess) {
                showMessage(context, 'SignIn Success');
              }
              if (state is AuthFailure) {
                showMessage(context, state.errorMessage);
              }
            },
            builder: (context, state) {
              if (state is AuthInLoad) {
                return CustomButton(
                  onTap: () {
                    if (_globalKey.currentState!.validate()) {
                      _globalKey.currentState!.save();
                      _autovalidateMode = AutovalidateMode.disabled;
                      context.read<AuthCubit>().siginWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                    }
                  },
                  text: 'Login',
                  isLoding: true,
                );
              } else {
                return CustomButton(
                  onTap: () {
                    if (_globalKey.currentState!.validate()) {
                      _globalKey.currentState!.save();
                      _autovalidateMode = AutovalidateMode.disabled;
                      context.read<AuthCubit>().siginWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      Navigator.of(
                        context,
                      ).pushReplacementNamed(Login.routeName);
                    }
                  },
                  isLoding: false,
                  text: 'Login',
                );
              }
            },
          ),

          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
