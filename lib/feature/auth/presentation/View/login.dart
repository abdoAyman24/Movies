import 'package:flutter/material.dart';
import 'package:movies/feature/auth/presentation/View/widget/login_view.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  static const String routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LoginView());
  }
}
