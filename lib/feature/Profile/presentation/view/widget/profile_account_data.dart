import 'package:flutter/material.dart';
import 'package:movies/core/utils/app_color.dart';
import 'package:movies/core/utils/app_text_styles.dart';
import 'package:movies/feature/List/presentation/view/movies_list.dart';
import 'package:movies/feature/Profile/presentation/view/widget/customListTile.dart';

class ProfileAccountData extends StatelessWidget {
  const ProfileAccountData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: BoxBorder.all(width: 1.3, color: AppColor.grey),
        borderRadius: BorderRadius.circular(10),
        color: AppColor.black.withValues(alpha: 0.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Account', style: AppText.bold28),

            CustomListTile(
              leading: Icon(Icons.person),
              title: 'Member',
              trailing: Icon(
                Icons.arrow_back,
                textDirection: TextDirection.rtl,
              ),
              trailingOnTap: () {},
            ),
            Divider(),
            CustomListTile(
              leading: Icon(Icons.list),
              title: 'Add To Watched List',
              trailing: Icon(
                Icons.arrow_back,
                textDirection: TextDirection.rtl,
              ),
              trailingOnTap: () {
                Navigator.pushNamed(
                  context,
                  MoviesList.routeName,
                  // arguments: {
                  //   // MovieEntity
                  //   'favoriteCubit': context.read<FavoriteCubit>(),
                  // },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
