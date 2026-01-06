import 'package:flutter/material.dart';
import 'package:movies/core/utils/app_color.dart';
import 'package:movies/core/utils/app_text_styles.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.leading,
    required this.title,
    this.subTitle,
    required this.trailing,
    required this.trailingOnTap,
  });

  final Icon leading;

  final String title;
  final String? subTitle;
  final Icon trailing;
  final VoidCallback trailingOnTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      style: ListTileStyle.drawer,

      title: Text(title, style: AppText.bold23),
      subtitle: subTitle != null
          ? Text(
              subTitle!,
              style: AppText.medium18.copyWith(color: AppColor.grey),
            )
          : null,
      leading: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadiusGeometry.circular(50),
          color: AppColor.grey.withValues(alpha: 0.2),
        ),
        child: Padding(padding: const EdgeInsets.all(7), child: leading),
      ),
      trailing: InkWell(onTap: trailingOnTap, child: trailing),
    );
  }
}
