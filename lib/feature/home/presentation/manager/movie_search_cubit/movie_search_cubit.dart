import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:movies/feature/home/domain/entity/movie_entity.dart';
import 'package:movies/feature/home/domain/repos/home_repo.dart';

part 'movie_search_state.dart';

class MovieSearchCubit extends Cubit<MovieSearchState> {
  MovieSearchCubit(this.homeRepo) : super(MovieSearchInitial());
  final HomeRepo homeRepo;
  Timer? _debounce;
  void movieSearch({required String movietitle}) async {
    _debounce?.cancel();
    _debounce = Timer(const Duration(microseconds: 500), () async {
      emit(MovieSearchLoad());
      var result = await homeRepo.movieSearch(movietitle: movietitle);

      result.fold(
        (l) {
          emit(MovieSearchFailure(errorMessage: l.message, icon: l.icon));
        },
        (r) {
          emit(MovieSearchSuccess(movies: r));
        },
      );
    });
  }
}
