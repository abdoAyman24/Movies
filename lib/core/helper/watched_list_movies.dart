import 'package:movies/feature/home/domain/entity/movie_entity.dart';

class WatchedListMovies {
  final List<MovieEntity> watchListMovies = [];
  void addAllMovieToWatchedList(List<MovieEntity> movies) {
    watchListMovies.addAll(movies);
  }

  void deleteMovieFromWatchedList(MovieEntity movie) {
    watchListMovies.remove(movie);
  }

  void deleteAllMovieFromWatchedList() {
    watchListMovies.clear();
  }

  void addMovieToWAtchedList(MovieEntity movie) {
    watchListMovies.add(movie);
  }

  bool isExistInWatchedList(MovieEntity movie) {
    for (var e in watchListMovies) {
      if (movie == e) {
        return true;
      }
    }
    return false;
  }
}
