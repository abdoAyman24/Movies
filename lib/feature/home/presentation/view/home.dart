import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/utils/app_text_styles.dart';
import 'package:movies/core/widget/custom_search.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static const String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
        child: Column(
          children: [
            Text('find Movies , Tv Series', style: AppText.semiBold28),
            SizedBox(height: 10.h),
            InkWell(
              onTap: () {
                
              },
              child: CustomSearch(text: 'Search', searchIcon: Icons.search_sharp)),
          ],
        ),
      ),
    );
  }
}
