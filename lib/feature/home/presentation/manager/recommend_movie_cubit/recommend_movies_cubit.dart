
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:movies/feature/home/domain/entity/movie_entity.dart';
import 'package:movies/feature/home/domain/repos/home_repo.dart';

part 'recommend_movies_state.dart';

class RecommendMoviesCubit extends Cubit<RecommendMoviesState> {
  RecommendMoviesCubit(this.homeRepo)
    : super(RecommendMoviesInitial());
  final HomeRepo homeRepo;

  void featchRecommendMovies({required int movieId}) async {
    emit(RecommendMoviesLoad());
    var result = await homeRepo.featchRecommendMovies(
      movieId: movieId,
    );
    result.fold(
      (l) {
        emit(RecommendMoviesFailure(errorMessage: l.message,icon: l.icon));
      },
      (r) {

        emit(RecommendMoviesSuccess(movies: r));
      },
    );
  }
}
