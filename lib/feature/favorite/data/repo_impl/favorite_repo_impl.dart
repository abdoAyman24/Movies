import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/error/failuer.dart';
import 'package:movies/feature/favorite/data/data_source/favorite_remote_data_source.dart';
import 'package:movies/feature/favorite/domain/repos/favorite_repo.dart';
import 'package:movies/feature/home/domain/entity/movie_entity.dart';

class FavoriteRepoImpl implements FavoriteRepo {
  final FavoriteRemoteDataSource favoriteRemoteDataSource;

  FavoriteRepoImpl({required this.favoriteRemoteDataSource});
  @override
  Future<Either<Failuer, void>> addToFavorite({required int movieId}) async {
    try {
      await favoriteRemoteDataSource.addToFavorite(movieId: movieId);
      return Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailuer.fromDioError(e));
      } else {
        return Left(ServerFailuer(message: e.toString(),icon: Icons.error_outline));
      }
    }
  }

  @override
  Future<Either<Failuer, void>> deleteFromFavorite({
    required int movieId,
  }) async {
    try {
      await favoriteRemoteDataSource.deleteFromFavorite(movieId: movieId);
      return Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailuer.fromDioError(e));
      } else {
        return Left(ServerFailuer(message: e.toString(),icon: Icons.error_outline));
      }
    }
  }

  @override
  Future<Either<Failuer, List<MovieEntity>>> featchFavotriteMovies() async {
    try {
   var movies =   await favoriteRemoteDataSource.featchFavotriteMovies();
      return Right(movies);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailuer.fromDioError(e));
      } else {
        return Left(ServerFailuer(message: e.toString(),icon: Icons.error_outline));
      }
    }
  }
}
