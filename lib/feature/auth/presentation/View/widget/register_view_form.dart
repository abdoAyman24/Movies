import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/helper/show_message.dart';
import 'package:movies/core/utils/app_color.dart';
import 'package:movies/core/utils/app_text_styles.dart';
import 'package:movies/core/widget/custom_button.dart';
import 'package:movies/core/widget/custom_text_form_field.dart';
import 'package:movies/core/widget/movie_icon.dart';
import 'package:movies/feature/auth/presentation/View/login.dart';
import 'package:movies/feature/auth/presentation/manager/cubit/auth_cubit.dart';

class RegisterViewForm extends StatefulWidget {
  const RegisterViewForm({super.key});

  @override
  State<RegisterViewForm> createState() => _RegisterViewFormState();
}

class _RegisterViewFormState extends State<RegisterViewForm> {
  final GlobalKey<FormState> _globalKey = GlobalKey();

  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  final _password = TextEditingController();

  late String name;
  late String email;
  late String password;
  @override
  void dispose() {
    _password.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _globalKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50.h),
          MovieIcon(iconSize: 100),
          const SizedBox(height: 20),
          CustomTextForm(
            hint: 'User Name',
            onSave: (value) {
              name = value!;
            },
            keyboardType: TextInputType.emailAddress,
            textFormColor: AppColor.grey,
            preffixIcon: Icon(Icons.person_3_rounded, size: 25),
          ),
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
            textEditingController: _password,

            hint: 'Password',
            onSave: (value) {
              password = value!;
            },
            keyboardType: TextInputType.multiline,
            textFormColor: AppColor.grey,
            preffixIcon: Icon(Icons.lock, size: 25),
            showSuffixIcon: true,
          ),
          CustomTextForm(
            confirmPassword: _password,
            hint: 'Confirm Password',
            onSave: (value) {},
            keyboardType: TextInputType.multiline,
            textFormColor: AppColor.grey,
            preffixIcon: Icon(Icons.lock, size: 25),
            showSuffixIcon: true,
            // confirmPassword: password,
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already have an Account? ', style: AppText.regular13),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Login.routeName);
                },
                child: Text(
                  'Login',
                  style: AppText.semiBold16.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is RegisterSuccess) {
                showMessage(context, 'Register Success');
              }
              if (state is AuthFailure) {
                showMessage(context, state.errorMessage);
              }
            },
            builder: (context, state) {
              if (state is AuthInLoad) {
                return CustomButton(
                  onTap: () {},
                  text: 'Register',
                  isLoding: true,
                );
              } else {
                return CustomButton(
                  onTap: () {
                    if (_globalKey.currentState!.validate()) {
                      _globalKey.currentState!.save();
                      _autovalidateMode = AutovalidateMode.disabled;

                      context.read<AuthCubit>().createUserWithEmailAndPassword(
                        name: name,
                        email: email,
                        password: password,
                      );
                      Future.delayed(Duration(seconds: 2), () {
                        Navigator.pop(context);
                      });
                    }
                  },
                  isLoding: false,
                  text: 'Register',
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
