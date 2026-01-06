import 'package:dartz/dartz.dart';
import 'package:movies/config/api_service.dart';
import 'package:movies/core/error/auth_faluire_service.dart';
import 'package:movies/feature/home/data/movie_model/movie_model.dart';
import 'package:movies/feature/home/domain/entity/movie_entity.dart';

abstract class WatchedListRemotDataSource {
  Future<Either<Failure, List<MovieEntity>>> featchWatchedList();
  Future<Either<Failure, void>> addToWatchedList(int movieId);
  Future<Either<Failure, void>> deleteFromWatchedList(int movieId);

}

class WatchedListRemotDataSourceImpl implements WatchedListRemotDataSource {
  final ApiService apiService;

  WatchedListRemotDataSourceImpl({required this.apiService});
  @override
  Future<Either<Failure, List<MovieEntity>>> featchWatchedList() async {
    try {
      var data = await apiService.featchWatchedlist();
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
  Future<Either<Failure, void>> addToWatchedList(int movieId) async {
    try {
      await apiService.watchedList(movieId,addTOWatchedList: true);
      return right(null);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, void>> deleteFromWatchedList(int movieId)async {
     try {
      await apiService.watchedList(movieId,);
      return right(null);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
