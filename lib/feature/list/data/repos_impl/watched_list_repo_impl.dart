import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/error/failuer.dart';
import 'package:movies/feature/home/domain/entity/movie_entity.dart';
import 'package:movies/feature/list/data/data_source/watched_list_remote_data_source.dart';
import 'package:movies/feature/list/domain/repos/watched_list_repo.dart';

class WatchedListRepoImpl implements WatchedListRepo {
  final WatchedListRemotDataSource watchedListRemotDataSource;

  WatchedListRepoImpl({required this.watchedListRemotDataSource});
  @override
  Future<Either<Failuer, void>> addToWatchedList(int movieId) async {
    try {
      await watchedListRemotDataSource.addToWatchedList(movieId);
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
  Future<Either<Failuer, void>> deleteFromWatchedList(int movieId) async {
  try {
      await watchedListRemotDataSource.deleteFromWatchedList(movieId);
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
  Future<Either<Failuer, List<MovieEntity>>> featchWatchedList() async {
  try {
  var movies=    await watchedListRemotDataSource.featchWatchedList();
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
