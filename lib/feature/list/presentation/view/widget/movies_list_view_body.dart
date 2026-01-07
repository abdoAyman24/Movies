import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/dummy/dummy_movies.dart';
import 'package:movies/core/utils/app_text_styles.dart';
import 'package:movies/core/widget/custom_movies_error_widget.dart';
import 'package:movies/core/widget/custom_movies_grid_view_body.dart';
import 'package:movies/feature/list/presentation/manager/cubit/watched_list_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MoviesListViewBody extends StatelessWidget {
  const MoviesListViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchedListCubit, WatchedListState>(
      builder: (context, state) {
        if (state is WatchedListLoad) {
          return Expanded(
            child: Skeletonizer(
              enabled: true,
              child: CustomMoviesGridViewBody(movies: dummyMovies),
            ),
          );
        } else if (state is WatchedListSuccess) {
          return Expanded(
            child: CustomMoviesGridViewBody(movies: state.movies),
          );
        } else if (state is WatchedListFailure) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: 50.h),
                CustomMoviesErrorWidget(
                  errorMessage: state.errorMessage,
                  icon: state.icon,
                ),
              ],
            ),
          );
        }
        if (context
            .read<WatchedListCubit>()
            .watchedListMovies
            .watchListMovies
            .isEmpty) {
          return Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Column(
                      children: [
                        Icon(Icons.list_outlined, size: 50),
                        const SizedBox(height: 10),
                        Text('Watched list is empty', style: AppText.bold20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return Expanded(
          child: CustomMoviesGridViewBody(
            movies: context
                .watch<WatchedListCubit>()
                .watchedListMovies
                .watchListMovies,
          ),
        );
      },
    );
  }
}
