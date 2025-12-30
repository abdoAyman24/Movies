import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/feature/home/data/data_source/home_remote_data_source.dart';
import 'package:movies/feature/home/domain/entity/movie_entity.dart';

part 'recommend_movies_state.dart';

class RecommendMoviesCubit extends Cubit<RecommendMoviesState> {
  RecommendMoviesCubit(this.homeRemoteDataSource)
    : super(RecommendMoviesInitial());
  final HomeRemoteDataSource homeRemoteDataSource;

  void featchRecommendMovies({required int movieId}) async {
    emit(RecommendMoviesLoad());
    var result = await homeRemoteDataSource.featchRecommendMovies(
      movieId: movieId,
    );
    result.fold(
      (l) {
        emit(RecommendMoviesFailure(errorMessage: l.message));
      },
      (r) {
        log(movieId.toString());

        emit(RecommendMoviesSuccess(movies: r));
      },
    );
  }
}
