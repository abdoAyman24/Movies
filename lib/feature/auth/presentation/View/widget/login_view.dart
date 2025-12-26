import 'package:flutter/material.dart';
import 'package:movies/core/widget/arrow_back_widget.dart';
import 'package:movies/feature/auth/presentation/View/widget/auth_back_ground.dart';
import 'package:movies/feature/auth/presentation/View/widget/login_view_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    
        return Stack(
          children: [
            AuthBackGround(),

            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: LoginViewForm(),
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
            ArrowBackWidget(),
          ],
        );
  }
}
