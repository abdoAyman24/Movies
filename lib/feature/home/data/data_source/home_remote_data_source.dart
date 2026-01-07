import 'package:movies/config/api_service.dart';
import 'package:movies/feature/home/data/movie_model/movie_model.dart';
import 'package:movies/feature/home/domain/entity/movie_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<MovieEntity>> featchMovies({required String movieType});
  Future<List<MovieEntity>> featchRecommendMovies({required int movieId});
  Future<List<MovieEntity>> featchPopularThisWeek();

  Future<List<MovieEntity>> movieSearch({required String movietitle});
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<MovieEntity>> featchMovies({required String movieType}) async {
    var data = await apiService.get('movie/${movieType}?language=en-US&page=1');
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
  Future<List<MovieEntity>> featchRecommendMovies({
    required int movieId,
  }) async {
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
    return moviesEntity;
  }

  @override
  Future<List<MovieEntity>> featchPopularThisWeek() async {
    var data = await apiService.get('trending/movie/week?language=en-US');
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
  Future<List<MovieEntity>> movieSearch({required String movietitle}) async {
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
    return moviesEntity;
  }
}

// {
//     "success": false,
//     "status_code": 6,
//     "status_message": "Invalid id: The pre-requisite id is invalid or not found."
//}
