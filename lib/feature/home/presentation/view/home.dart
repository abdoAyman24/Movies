import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/utils/app_text_styles.dart';
import 'package:movies/core/widget/custom_back_ground.dart';
import 'package:movies/feature/home/presentation/view/widget/home_welcom.dart';
import 'package:movies/feature/home/presentation/view/widget/now_play_list_view_item.dart';
import 'package:movies/feature/home/presentation/view/widget/popular_list_view_item.dart';
import 'package:movies/feature/home/presentation/view/widget/top_rate_list_view_item.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomBackGround(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: HomeWelcom()),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Now Play', style: AppText.bold23),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'See All,',
                            style: AppText.regular18.copyWith(
                              //textBaseline: TextBaseline.ideographic,
                              fontStyle: FontStyle.italic,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(height: 70.h, child: NowPlayListViewItem()),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Popular', style: AppText.bold23),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'See All,',
                            style: AppText.regular18.copyWith(
                              //textBaseline: TextBaseline.ideographic,
                              fontStyle: FontStyle.italic,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(height: 70.h, child: PopularListViewItem()),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Top Rated', style: AppText.bold23),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'See All,',
                            style: AppText.regular18.copyWith(
                              //textBaseline: TextBaseline.ideographic,
                              fontStyle: FontStyle.italic,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(height: 70.h, child: TopRateListViewItem()),
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
