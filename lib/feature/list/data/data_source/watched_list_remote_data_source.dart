import 'package:movies/config/api_service.dart';
import 'package:movies/feature/home/data/movie_model/movie_model.dart';
import 'package:movies/feature/home/domain/entity/movie_entity.dart';

abstract class WatchedListRemotDataSource {
  Future<List<MovieEntity>> featchWatchedList();
  Future<void> addToWatchedList(int movieId);
  Future<void> deleteFromWatchedList(int movieId);
}

class WatchedListRemotDataSourceImpl implements WatchedListRemotDataSource {
  final ApiService apiService;

  WatchedListRemotDataSourceImpl({required this.apiService});
  @override
  Future<List<MovieEntity>> featchWatchedList() async {
    var data = await apiService.featchWatchedlist();
    List<MovieModel> moviesModel = List<MovieModel>.from(
      (data['results'] as List).map(
        (e) => MovieModel.fromJson(e as Map<String, dynamic>),
      ),
    );
    List<MovieEntity> moviesEntity = moviesModel
        .map((e) => e.toEntity())
        .toList();
    return moviesEntity;
  }

  @override
  Future<void> addToWatchedList(int movieId) async {
    await apiService.watchedList(movieId, addTOWatchedList: true);
  }

  @override
  Future<void> deleteFromWatchedList(int movieId) async {
    await apiService.watchedList(movieId);
  }
}
