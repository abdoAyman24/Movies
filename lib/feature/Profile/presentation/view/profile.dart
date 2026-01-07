import 'package:flutter/material.dart';
import 'package:movies/feature/Profile/presentation/view/widget/profile_view.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(title: Text('Profile'),),
        body: ProfileView(),
      ),
    );
  }
}
