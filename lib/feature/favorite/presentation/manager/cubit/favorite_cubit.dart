import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/helper/favorite_movie.dart';
import 'package:movies/feature/favorite/data/data_source/favorite_remote_data_source.dart';
import 'package:movies/feature/home/domain/entity/movie_entity.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.favoriteRemoteDataSource, this.favoriteMovie)
    : super(FavoriteInitial());
  final FavoriteRemoteDataSource favoriteRemoteDataSource;
  final FavoriteMovie favoriteMovie;
  void featchFavoriteMovies() async {
    emit(FavoriteLoad());
 favoriteMovie.removeAllMovieFromFavorite();
    var result = await favoriteRemoteDataSource.featchFavotriteMovies();
    result.fold(
      (l) {
        emit(FavoriteFailure(errorMessage: l.message));
      },
      (r) {
        favoriteMovie.addListOfMoviesToFavorite(r);
        emit(FavoriteSuccess(movies: r));
      },
    );
  }

  void addMovieToFavorite(MovieEntity movie) async {
    emit(FavoriteLoad());
    
    var result = await favoriteRemoteDataSource.addToFavorite(
      movieId: movie.id,
    );
    result.fold(
      (l) {
        emit(FavoriteFailure(errorMessage: l.message));
      },
      (r) {
        favoriteMovie.addMovieToFavorite(movie);
        emit(SuccessAddMoviesToFavorite());
      },
    );
  }

  void deleteFromFavorite(MovieEntity movie) async {
    emit(FavoriteLoad());

    var result = await favoriteRemoteDataSource.deleteFromFavorite(
      movieId: movie.id,
    );
    result.fold(
      (l) {
        emit(FavoriteFailure(errorMessage: l.message));
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
