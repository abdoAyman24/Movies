import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/dummy/dummy_movies.dart';
import 'package:movies/core/utils/app_color.dart';
import 'package:movies/core/utils/app_text_styles.dart';
import 'package:movies/core/widget/custom_movies_error_widget.dart';
import 'package:movies/core/widget/custom_movies_grid_view_body.dart';
import 'package:movies/feature/favorite/presentation/manager/cubit/favorite_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        if (state is FavoriteLoad) {
          return Expanded(
            child: Skeletonizer(
              child: CustomMoviesGridViewBody(movies: dummyMovies),
            ),
          );
        } else if (state is FavoriteSuccess ||
            state is AddMoviesToFavorite ||
            state is RemoveMovieFromFavorite) {
          return Expanded(
            child: CustomMoviesGridViewBody(
              movies: context
                  .watch<FavoriteCubit>()
                  .favoriteMovie
                  .favoriteMovies,
            ),
          );
        } else if (state is FavoriteFailure) {
          return Expanded(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
            
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 50.h),
                    CustomMoviesErrorWidget(
                      errorMessage: state.errorMessage,
                      icon: state.icon,
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.movie_outlined, color: AppColor.black),
                  Text('Empty', style: AppText.bold20),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
