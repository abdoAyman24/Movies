import 'package:flutter/material.dart';
import 'package:movies/feature/auth/presentation/View/login.dart';
import 'package:movies/feature/auth/presentation/View/register.dart';
import 'package:movies/feature/home/presentation/view/home.dart';
import 'package:movies/feature/on_bording/presentation/view/on_bording.dart';

Route<dynamic> onGenerateRoute(RouteSettings setting) {
  switch (setting.name) {
    case OnBording.routeName:
      return MaterialPageRoute(builder: (context) => OnBording());

    case Login.routeName:
      return MaterialPageRoute(builder: (context) => Login());
    case Register.routeName:
      return MaterialPageRoute(builder: (context) => Register());
    
    case Home.routeName:
      return MaterialPageRoute(builder: (context) => Home());
    
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
