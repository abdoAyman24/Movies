import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failuer.dart';
import 'package:movies/feature/home/domain/entity/movie_entity.dart';

abstract class WatchedListRepo {
   Future<Either<Failuer, List<MovieEntity>>> featchWatchedList();
  Future<Either<Failuer, void>> addToWatchedList(int movieId);
  Future<Either<Failuer, void>> deleteFromWatchedList(int movieId);
}