import 'package:flutter/material.dart';
import 'package:movies/core/utils/app_text_styles.dart';
import 'package:movies/core/widget/custom_back_ground.dart';
import 'package:movies/core/widget/custom_search.dart';

class Play extends StatelessWidget {
  const Play({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomBackGround(),
        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Text('Find Movies, TV Series', style: AppText.bold20),
                    const SizedBox(height: 15),
                    CustomSearch(
                      text: 'Search',
                      searchIcon: Icons.search_rounded,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
