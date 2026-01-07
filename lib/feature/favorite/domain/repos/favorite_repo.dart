import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failuer.dart';
import 'package:movies/feature/home/domain/entity/movie_entity.dart';

abstract class FavoriteRepo {
    Future<Either<Failuer, void>> addToFavorite({required int movieId});
  Future<Either<Failuer, void>> deleteFromFavorite({required int movieId});
  Future<Either<Failuer, List<MovieEntity>>> featchFavotriteMovies();
}