import 'package:flutter/material.dart';
import 'package:movies/core/utils/app_color.dart';
import 'package:movies/core/utils/app_text_styles.dart';

PreferredSizeWidget appBarBuilder({
  required BuildContext context,
  required String title,
  required IconData icon,
}) {
  return AppBar(
    backgroundColor: AppColor.secondPrimary,
    title: Text(title, style: AppText.bold23),
    centerTitle: true,
    leading: InkWell(
      onTap: () => Navigator.pop(context),
      child: Icon(icon, size: 28),
    ),
  );
}
