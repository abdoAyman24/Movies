import 'package:flutter/material.dart';
import 'package:movies/core/helper/app_bar_builder.dart';
import 'package:movies/feature/Profile/presentation/view/widget/profile_view.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarBuilder(context: context, title: 'Profile', icon: Icons.arrow_back_ios_new),
        body:  ProfileView()
      ),
    );
  }
}

