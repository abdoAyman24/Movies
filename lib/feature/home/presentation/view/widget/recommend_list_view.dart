import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/dummy/dummy_movies.dart';
import 'package:movies/core/widget/custom_movies_error_widget.dart';
import 'package:movies/feature/home/presentation/manager/recommend_movie_cubit/recommend_movies_cubit.dart';
import 'package:movies/feature/home/presentation/view/widget/movies_list_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RecommendListView extends StatefulWidget {
  const RecommendListView({super.key, required this.mvieId});
  final int mvieId;
  @override
  State<RecommendListView> createState() => _RecommendListViewState();
}

class _RecommendListViewState extends State<RecommendListView> {
  @override
  void initState() {
    context.read<RecommendMoviesCubit>().featchRecommendMovies(
      movieId: widget.mvieId,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendMoviesCubit, RecommendMoviesState>(
      builder: (context, state) {
        if (state is RecommendMoviesLoad) {
          return Skeletonizer(
            enabled: true,
            child: MoviesListView(movies: dummyMovies,isLoad: true,),
          );
        } else if (state is RecommendMoviesSuccess) {
          return MoviesListView(movies: state.movies.isNotEmpty?state.movies:dummyMovies);
        }else if (state is RecommendMoviesFailure) {
          return CustomMoviesErrorWidget(
            errorMessage: state.errorMessage,
            icon: state.icon,
          );
        } else {
          return Icon(Icons.error);
        }
      },
    );
  }
}
