import 'package:dartz/dartz.dart';
import 'package:movies/config/api_service.dart';
import 'package:movies/core/error/auth_faluire_service.dart';
import 'package:movies/feature/home/data/movie_model/movie_model.dart';
import 'package:movies/feature/home/domain/entity/movie_entity.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failure, List<MovieEntity>>> featchMovies({
    required String movieType,
  });
  Future<Either<Failure, List<MovieEntity>>> featchRecommendMovies({
    required int movieId,
  });
  Future<Either<Failure, List<MovieEntity>>> featchPopularThisWeek();
  Future<Either<Failure, List<MovieEntity>>> movieSearch({required String movietitle});

}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});
  @override
  Future<Either<Failure, List<MovieEntity>>> featchMovies({
    required String movieType,
  }) async {
    try {
      var data = await apiService.get(
        'movie/${movieType}?language=en-US&page=1',
      );
      List<MovieModel> moviesModel = List<MovieModel>.from(
        (data['results'] as List).map(
          (e) => MovieModel.fromJson(e as Map<String, dynamic>),
        ),
      );
      List<MovieEntity> moviesEntity = moviesModel
          .map((e) => e.toEntity())
          .toList();
      return Right(moviesEntity);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }


  @override
  Future<Either<Failure, List<MovieEntity>>> featchRecommendMovies({
    required int movieId,
  }) async {
    try {
      var data = await apiService.get(
        'movie/$movieId/recommendations?language=en-US&page=1',
      );
      List<MovieModel> moviesModel = List<MovieModel>.from(
        (data['results'] as List).map(
          (e) => MovieModel.fromJson(e as Map<String, dynamic>),
        ),
      );
      List<MovieEntity> moviesEntity = moviesModel
          .map((e) => e.toEntity())
          .toList();
      return Right(moviesEntity);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, List<MovieEntity>>> featchPopularThisWeek()async {
     try {
      var data = await apiService.get(
        'trending/movie/week?language=en-US',
      );
      List<MovieModel> moviesModel = List<MovieModel>.from(
        (data['results'] as List).map(
          (e) => MovieModel.fromJson(e as Map<String, dynamic>),
        ),
      );
      List<MovieEntity> moviesEntity = moviesModel
          .map((e) => e.toEntity())
          .toList();
      return Right(moviesEntity);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, List<MovieEntity>>> movieSearch({required String movietitle})async {
        try {
      var data = await apiService.get(
        'search/movie?query=$movietitle&include_adult=false&language=en-US&page=1',
      );
      List<MovieModel> moviesModel = List<MovieModel>.from(
        (data['results'] as List).map(
          (e) => MovieModel.fromJson(e as Map<String, dynamic>),
        ),
      );
      List<MovieEntity> moviesEntity = moviesModel
          .map((e) => e.toEntity())
          .toList();
      return Right(moviesEntity);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}


// {
//     "success": false,
//     "status_code": 6,
//     "status_message": "Invalid id: The pre-requisite id is invalid or not found."
// }