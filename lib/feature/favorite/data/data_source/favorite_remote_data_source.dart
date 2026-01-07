import 'package:movies/config/api_service.dart';
import 'package:movies/feature/home/data/movie_model/movie_model.dart';
import 'package:movies/feature/home/domain/entity/movie_entity.dart';

abstract class FavoriteRemoteDataSource {
  Future<void> addToFavorite({required int movieId});
  Future<void> deleteFromFavorite({required int movieId});
  Future<List<MovieEntity>> featchFavotriteMovies();
}

class FavoriteRemoteDataSourceImpl implements FavoriteRemoteDataSource {
  final ApiService apiService;

  FavoriteRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<MovieEntity>> featchFavotriteMovies() async {
    var data = await apiService.getFavorite();
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
  Future<void> addToFavorite({required int movieId}) async {
    await apiService.favorite(movieId, addTOFavorite: true);
  }

  @override
  Future<void> deleteFromFavorite({required int movieId}) async {
    await apiService.favorite(movieId, addTOFavorite: false);
  }
}
