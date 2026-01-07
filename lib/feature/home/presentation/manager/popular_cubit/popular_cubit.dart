import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import 'package:movies/feature/home/domain/entity/movie_entity.dart';
import 'package:movies/feature/home/domain/repos/home_repo.dart';

import '../../../../../core/utils/end_point.dart';

part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  PopularCubit(this.homeRepo) : super(PopularInitial());
  final HomeRepo homeRepo;
  List<MovieEntity> movies = [];
  void featchPopular() async {
    emit(PopularLoad());
    var result = await homeRepo.featchMovies(
      movieType: EndPoint.popular,
    );

    result.fold(
      (l) {
        emit(PopularFailure(errorMessage: l.message,icon: l.icon));
      },
      (r) {
        movies.addAll(r);
        emit(PopularSuccess(movies: r));
      },
    );
  }
}
