import 'package:movies/feature/home/domain/entity/movie_entity.dart';

class FavoriteMovie {
  final List<MovieEntity> favoriteMovies = [];
  void addListOfMoviesToFavorite(List<MovieEntity> movies) {
    favoriteMovies.clear();
    favoriteMovies.addAll(movies);
  }

  void addMovieToFavorite(MovieEntity movies) {
    favoriteMovies.add(movies);
  }

  void removeMovieFromFavorite(MovieEntity movie) {
    favoriteMovies.remove(movie);
  }

  bool isExist(MovieEntity movie) {
    for (var element in favoriteMovies) {
      if (element == movie) {
        return true;
      }
    }
    return false;
  }
}
