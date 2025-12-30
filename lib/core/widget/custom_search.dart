import 'package:flutter/material.dart';
import 'package:movies/core/utils/app_color.dart';
import 'package:movies/core/utils/app_text_styles.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key, required this.text, required this.searchIcon});

  final String text;
  final IconData searchIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xD81E1F22),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(17),
        child: Row(
          children: [
            Icon(searchIcon, size: 30, color: AppColor.grey),
            const SizedBox(width: 15),
            Text(text, style: AppText.bold19.copyWith(color: AppColor.grey)),
          ],
        ),
      ),
    );
  }
}
