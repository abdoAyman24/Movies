
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/helper/favorite_movie.dart';
import 'package:movies/feature/home/data/data_source/home_remote_data_source.dart';
import 'package:movies/feature/home/domain/entity/movie_entity.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.homeRemoteDataSource, this.favoriteMovie)
    : super(FavoriteInitial());
  final HomeRemoteDataSource homeRemoteDataSource;
  final FavoriteMovie favoriteMovie;
  void featchFavoriteMovies() async {
    emit(FavoriteLoad());

    var result = await homeRemoteDataSource.featchFavotriteMovies();
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

  void addMovieToFavorite(int movieId) async {
    emit(FavoriteLoad());

    var result = await homeRemoteDataSource.addToFavorite(movieId: movieId);
    result.fold(
      (l) {
        emit(FavoriteFailure(errorMessage: l.message));
      },
      (r) {
        emit(SuccessAddMoviesToFavorite());
      },
    );
  }

  void deleteFromFavorite(int movieId) async{
    emit(FavoriteLoad());

    var result = await homeRemoteDataSource.deleteFromFavorite(movieId: movieId);
    result.fold(
      (l) {
        emit(FavoriteFailure(errorMessage: l.message));
      },
      (r) {
        emit(SuccessAddMoviesToFavorite());
      },
    );
  }

  void addmovieToFavorite(MovieEntity movie) {
    emit(FavoriteLoad());

    favoriteMovie.addMovieToFavorite(movie);
    emit(AddMoviesToFavorite());
   
  }
}
