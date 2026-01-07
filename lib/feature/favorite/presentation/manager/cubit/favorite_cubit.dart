import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:movies/core/helper/favorite_movie.dart';
import 'package:movies/feature/favorite/domain/repos/favorite_repo.dart';
import 'package:movies/feature/home/domain/entity/movie_entity.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.favoriteRepo, this.favoriteMovie)
    : super(FavoriteInitial());
  final FavoriteRepo favoriteRepo;
  final FavoriteMovie favoriteMovie;
  void featchFavoriteMovies() async {
    emit(FavoriteLoad());
 favoriteMovie.removeAllMovieFromFavorite();
    var result = await favoriteRepo.featchFavotriteMovies();
    result.fold(
      (l) {
        emit(FavoriteFailure(errorMessage: l.message,icon: l.icon));
      },
      (r) {
        favoriteMovie.addListOfMoviesToFavorite(r);
        emit(FavoriteSuccess(movies: r));
      },
    );
  }

  void addMovieToFavorite(MovieEntity movie) async {
    emit(FavoriteLoad());
    
    var result = await favoriteRepo.addToFavorite(
      movieId: movie.id,
    );
    result.fold(
      (l) {
        emit(FavoriteFailure(errorMessage: l.message,icon: l.icon));
      },
      (r) {
        favoriteMovie.addMovieToFavorite(movie);
        emit(SuccessAddMoviesToFavorite());
      },
    );
  }

  void deleteFromFavorite(MovieEntity movie) async {
    emit(FavoriteLoad());

    var result = await favoriteRepo.deleteFromFavorite(
      movieId: movie.id,
    );
    result.fold(
      (l) {
        emit(FavoriteFailure(errorMessage: l.message,icon: l.icon));
      },
      (r) {
        favoriteMovie.removeMovieFromFavorite(movie);

        emit(RemoveMovieFromFavorite());
      },
    );
  }

  // void addmovieToFavorite(MovieEntity movie) {
  //   emit(FavoriteLoad());

  //   favoriteMovie.addMovieToFavorite(movie);
  //   emit(AddMoviesToFavorite());

  // }
}
