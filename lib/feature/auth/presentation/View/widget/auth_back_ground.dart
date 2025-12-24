
import 'package:flutter/material.dart';
import 'package:movies/core/utils/app_color.dart';

class AuthBackGround extends StatelessWidget {
  const AuthBackGround({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(color: AppColor.primary.withValues(alpha: 0.5)),
        ),
      ],
    );
  }
}
