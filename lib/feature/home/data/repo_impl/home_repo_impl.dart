import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/error/failuer.dart';
import 'package:movies/feature/home/data/data_source/home_remote_data_source.dart';
import 'package:movies/feature/home/domain/entity/movie_entity.dart';
import 'package:movies/feature/home/domain/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl({required this.homeRemoteDataSource});
  @override
  Future<Either<Failuer, List<MovieEntity>>> featchMovies({
    required String movieType,
  }) async {
    try {
      var movies = await homeRemoteDataSource.featchMovies(
        movieType: movieType,
      );
      return Right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailuer.fromDioError(e));
      } else{
        return left(ServerFailuer(message: e.toString(),icon: Icons.error_outline));

      }
    }
  }

  @override
  Future<Either<Failuer, List<MovieEntity>>> featchPopularThisWeek() async{
     try {
      var movies = await homeRemoteDataSource.featchPopularThisWeek(
    
      );
      return Right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailuer.fromDioError(e));
      } else{
        return left(ServerFailuer(message: e.toString(),icon: Icons.error_outline));

      }
    }
  }

  @override
  Future<Either<Failuer, List<MovieEntity>>> featchRecommendMovies({
    required int movieId,
  }) async{
    try {
      var movies = await homeRemoteDataSource.featchRecommendMovies(
       movieId: movieId
      );
      return Right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailuer.fromDioError(e));
      } else{
        return left(ServerFailuer(message: e.toString(),icon: Icons.error_outline));

      }
    }
  }

  @override
  Future<Either<Failuer, List<MovieEntity>>> movieSearch({
    required String movietitle,
  })async {
    try {
      var movies = await homeRemoteDataSource.movieSearch(
       movietitle: movietitle
      );
      return Right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailuer.fromDioError(e));
      } else{
        return left(ServerFailuer(message: e.toString(),icon: Icons.error_outline));

      }
    }
  }
}
