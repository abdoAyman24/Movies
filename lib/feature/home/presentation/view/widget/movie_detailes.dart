import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/service/service_locator.dart';
import 'package:movies/core/utils/app_text_styles.dart';
import 'package:movies/feature/home/data/data_source/home_remote_data_source.dart';
import 'package:movies/feature/home/domain/entity/movie_entity.dart';
import 'package:movies/feature/home/presentation/manager/recommend_movie_cubit/recommend_movies_cubit.dart';
import 'package:movies/feature/home/presentation/view/widget/back_bottom.dart';
import 'package:movies/feature/home/presentation/view/widget/movie_back_ground_image.dart';
import 'package:movies/feature/home/presentation/view/widget/movie_data.dart';
import 'package:movies/feature/home/presentation/view/widget/movie_data_back_ground.dart';
import 'package:movies/feature/home/presentation/view/widget/poster_image.dart';
import 'package:movies/feature/home/presentation/view/widget/recommend_list_view.dart';

class MovieDetailes extends StatelessWidget {
  const MovieDetailes({super.key, required this.movie});
  final MovieEntity movie;
  static const String routeName = 'MovieDetailes';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => RecommendMoviesCubit(getIt.get<HomeRemoteDataSource>()),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 120.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      MovieBackGroundImage(
                        backGroundImagUrl: movie.backdropPath,
                      ),
                      BackBottom(
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      Positioned(bottom: 0, child: MovieDataBackGround()),
                      Positioned(
                        bottom: 0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              PosterImage(imageUrl: movie.posterPath),
                              const SizedBox(width: 20),
                              MovieData(movie: movie),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  movie.title,
                  style: AppText.bold23.copyWith(fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 6),
                Text(movie.overiew, style: AppText.medium16),
                const SizedBox(height: 20),
                Text('Suggested For You :', style: AppText.bold23),
                const SizedBox(height: 15),
                SizedBox(
                  height: 70.h,
                  child: RecommendListView(mvieId: movie.id),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
