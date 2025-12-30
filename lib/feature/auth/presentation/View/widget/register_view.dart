import 'package:flutter/material.dart';
import 'package:movies/core/widget/arrow_back_widget.dart';
import 'package:movies/core/widget/custom_back_ground.dart';
import 'package:movies/feature/auth/presentation/View/widget/register_view_form.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomBackGround(),

        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Form(child: RegisterViewForm()),
          ),
        ),
        ArrowBackWidget(),
      ],
    );
  }
}
