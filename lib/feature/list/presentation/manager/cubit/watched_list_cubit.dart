
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:movies/core/helper/watched_list_movies.dart';
import 'package:movies/feature/home/domain/entity/movie_entity.dart';
import 'package:movies/feature/list/domain/repos/watched_list_repo.dart';

part 'watched_list_state.dart';

class WatchedListCubit extends Cubit<WatchedListState> {
  WatchedListCubit(this.watchedListRepo, this.watchedListMovies)
    : super(WatchedListInitial());
  final WatchedListRepo watchedListRepo;
  final WatchedListMovies watchedListMovies;
  void featchWatchedList() async {
    emit(WatchedListLoad());
    watchedListMovies.deleteAllMovieFromWatchedList();
    var result = await watchedListRepo.featchWatchedList();

    result.fold(
      (l) {
        emit(WatchedListFailure(errorMessage: l.message,icon: l.icon));
      },
      (r) {
        watchedListMovies.addAllMovieToWatchedList(r);
        emit(WatchedListSuccess(movies: r));
      },
    );
  }

  void addMovieToWatchedList(MovieEntity movie) async {
    emit(WatchedListLoad());
    var result = await watchedListRepo.addToWatchedList(movie.id);
    result.fold(
      (l) {
        emit(WatchedListFailure(errorMessage: l.message,icon: l.icon));
      },
      (r) {
        watchedListMovies.addMovieToWAtchedList(movie);
        emit(AddMovieToWatchedListSuccess());
      },
    );
  }

  void deleteMovieFromWatchedList(MovieEntity movie) async {
    emit(WatchedListLoad());
    watchedListMovies.deleteMovieFromWatchedList(movie);

    var result = await watchedListRepo.deleteFromWatchedList(
      movie.id,
    );
    result.fold(
      (l) {
        emit(WatchedListFailure(errorMessage: l.message,icon: l.icon));
      },
      (r) {
        emit(DeleteMoviefromWatchedListSuccess());
      },
    );
  }
}
