import 'package:dartz/dartz.dart';
import 'package:movies/config/api_service.dart';
import 'package:movies/core/error/auth_faluire_service.dart';
import 'package:movies/feature/home/data/movie_model/movie_model.dart';
import 'package:movies/feature/home/domain/entity/movie_entity.dart';

abstract class FavoriteRemoteDataSource {
  Future<Either<Failure, void>> addToFavorite({required int movieId});
  Future<Either<Failure, void>> deleteFromFavorite({required int movieId});
  Future<Either<Failure, List<MovieEntity>>> featchFavotriteMovies();
}

class FavoriteRemoteDataSourceImpl implements FavoriteRemoteDataSource {
  final ApiService apiService;

  FavoriteRemoteDataSourceImpl({required this.apiService});

  @override
  Future<Either<Failure, List<MovieEntity>>> featchFavotriteMovies() async {
    try {
      var data = await apiService.getFavorite();
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
  Future<Either<Failure, void>> addToFavorite({required int movieId}) async {
    try {
      await apiService.favorite(movieId, addTOFavorite: true);

      return Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteFromFavorite({
    required int movieId,
  }) async {
    try {
      await apiService.favorite(movieId, addTOFavorite: false);

      return Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
