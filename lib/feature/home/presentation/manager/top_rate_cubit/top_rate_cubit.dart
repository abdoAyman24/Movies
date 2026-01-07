import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:movies/core/utils/end_point.dart';
import 'package:movies/feature/home/domain/entity/movie_entity.dart';
import 'package:movies/feature/home/domain/repos/home_repo.dart';

part 'top_rate_state.dart';

class TopRateCubit extends Cubit<TopRateState> {
  TopRateCubit(this.homeRepo) : super(TopRateInitial());
  final HomeRepo homeRepo;
  List<MovieEntity> movies = [];
  void featchTopRate() async {
    emit(TopRateLoad());
    var result = await homeRepo.featchMovies(
      movieType: EndPoint.topRate,
    );

    result.fold(
      (l) {
        emit(TopRateFailure(errorMessage: l.message,icon: l.icon));
      },
      (r) {
        movies.addAll(r);

        emit(TopRateSuccess(movies: r));
      },
    );
  }
}
