import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/helper/watched_list_movies.dart';
import 'package:movies/feature/home/domain/entity/movie_entity.dart';
import 'package:movies/feature/list/data/data_source/watched_list_remote_data_source.dart';

part 'watched_list_state.dart';

class WatchedListCubit extends Cubit<WatchedListState> {
  WatchedListCubit(this.watchedListRemotDataSource, this.watchedListMovies)
    : super(WatchedListInitial());
  final WatchedListRemotDataSource watchedListRemotDataSource;
  final WatchedListMovies watchedListMovies;
  void featchWatchedList() async {
    emit(WatchedListLoad());
    var result = await watchedListRemotDataSource.featchWatchedList();

    result.fold(
      (l) {
        emit(WatchedListFailure(errorMessage: l.message));

      },
      (r) {
        emit(WatchedListSuccess(movies: r));
        watchedListMovies.addAllMovieToWatchedList(r);
       
      },
    );
  }

  void addMovieToWatchedList(MovieEntity movie) async {
    emit(WatchedListLoad());
    var result = await watchedListRemotDataSource.addToWatchedList(movie.id);
    result.fold(
      (l) {
        log(l.message.toString());
        emit(WatchedListFailure(errorMessage: l.message));
      },
      (r) {
        emit(AddMovieToWatchedListSuccess());
        watchedListMovies.addMovieToWAtchedList(movie);
      },
    );
  }

  void deleteMovieFromWatchedList(MovieEntity movie) async {
    emit(WatchedListLoad());

    var result = await watchedListRemotDataSource.deleteFromWatchedList(
      movie.id,
    );
    result.fold(
      (l) {
        emit(WatchedListFailure(errorMessage: l.message));
      },
      (r) {
        emit(DeleteMoviefromWatchedListSuccess());
        watchedListMovies.deleteMovieFromWatchedList(movie);
      },
    );
  }
}
