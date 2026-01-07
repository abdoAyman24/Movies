import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movies/feature/home/domain/entity/movie_entity.dart';
import 'package:movies/feature/home/domain/repos/home_repo.dart';

import '../../../../../core/utils/end_point.dart';

part 'now_play_state.dart';

class NowPlayCubit extends Cubit<NowPlayState> {
  NowPlayCubit(this.homeRepo) : super(NowPlayInitial());
  final HomeRepo homeRepo;
  List<MovieEntity> movies = [];
  void featchNowPlaying() async {
    emit(NowPlayLoad());
    var result = await homeRepo.featchMovies(
      movieType: EndPoint.nowPlay,
    );

    result.fold(
      (l) {
        emit(NowPlayFailure(errorMessage: l.message,icon: l.icon));
      },
      (r) {
        emit(NowPlaySuccess(movies: r));
        movies.addAll(r);
      },
    );
  }
}
