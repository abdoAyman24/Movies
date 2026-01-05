import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/widget/custom_back_ground.dart';
import 'package:movies/feature/favorite/presentation/manager/cubit/favorite_cubit.dart';
import 'package:movies/feature/home/presentation/manager/now_play_cubit/now_play_cubit.dart';
import 'package:movies/feature/home/presentation/manager/popular_cubit/popular_cubit.dart';
import 'package:movies/feature/home/presentation/manager/top_rate_cubit/top_rate_cubit.dart';
import 'package:movies/feature/home/presentation/view/widget/movies_grid_view.dart';
import 'package:movies/feature/home/presentation/view/widget/home_welcom.dart';
import 'package:movies/feature/home/presentation/view/widget/movies_type_title.dart';
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
                child: MoviesTypeTitle(
                  widget: NowPlayListViewItem(),
                  moviesType: 'NowPlay',
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      MoviesGridView.routName,
                      arguments: {
                        'Movie': context
                            .read<NowPlayCubit>()
                            .movies, // MovieEntity
                        'favoriteCubit': context.read<FavoriteCubit>(),
                      },
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: MoviesTypeTitle(
                  widget: PopularListViewItem(),
                  moviesType: 'Popular',
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      MoviesGridView.routName,
                      arguments: {
                        'Movie': context
                            .read<PopularCubit>()
                            .movies, // MovieEntity
                        'favoriteCubit': context.read<FavoriteCubit>(),
                      },
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: MoviesTypeTitle(
                  widget: TopRateListViewItem(),
                  moviesType: 'Top Rated',
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      MoviesGridView.routName,
                    arguments: {
                        'Movie': context
                            .read<TopRateCubit>()
                            .movies, // MovieEntity
                        'favoriteCubit': context.read<FavoriteCubit>(),
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
