import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failuer.dart';
import 'package:movies/feature/home/domain/entity/movie_entity.dart';

abstract class HomeRepo {
  Future<Either<Failuer, List<MovieEntity>>> featchMovies({
    required String movieType,
  });
  Future<Either<Failuer, List<MovieEntity>>> featchRecommendMovies({
    required int movieId,
  });
  Future<Either<Failuer, List<MovieEntity>>> featchPopularThisWeek();

  Future<Either<Failuer, List<MovieEntity>>> movieSearch({
    required String movietitle,
  });
}