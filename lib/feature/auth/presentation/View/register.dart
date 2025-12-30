import 'package:flutter/material.dart';
import 'package:movies/feature/auth/presentation/View/widget/register_view.dart';

class Register extends StatelessWidget {
  const Register({super.key});
  static const String routeName = 'register';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: RegisterView());
  }
}
