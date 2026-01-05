import 'package:flutter/material.dart';
import 'package:movies/core/utils/app_color.dart';
import 'package:movies/core/utils/app_text_styles.dart';

class ProfilePremium extends StatelessWidget {
  const ProfilePremium({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: BoxBorder.all(width: 1.3),
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFFF8700),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 15,
        ),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  color: AppColor.grey.withValues(alpha: 0.3),
                  child: Icon(Icons.workspace_premium),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Premium Member', style: AppText.bold23),
                Text(
                  'New movies are coming for you,',
                  style: AppText.regular16,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

