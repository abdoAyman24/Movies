import 'package:dio/dio.dart';
import 'package:movies/core/utils/end_point.dart';

class ApiService {
  final String baseUrl = EndPoint.movieBaseUrl;
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get(String endPoint) async {
    late var Response;

    Response = await _dio.get(
      '$baseUrl$endPoint',
      options: Options(
        headers: {
          'Authorization': EndPoint.userAccessToken,
          'Accept': 'application/json',
        },
      ),
    );

    return Response.data;
  }

  Future<Map<String, dynamic>> getFavorite() async {
    late var Response;

    Response = await _dio.get(
      '${baseUrl}account/${EndPoint.userId}/favorite/movies?language=en-US&sort_by=created_at.asc',
      options: Options(
        headers: {
          'Authorization': EndPoint.userAccessToken,
          'Accept': 'application/json',
        },
      ),
    );

    return Response.data;
  }

  Future<Map<String, dynamic>> favorite(
    int movieId, {
    bool addTOFavorite = false,
  }) async {
    var response = await _dio.post(
      '${baseUrl}account/${EndPoint.userId}/favorite',
      options: Options(
        headers: {
          'Authorization': EndPoint.userAccessToken,
          'Accept': 'application/json',
        },
      ),
      data: {
        "media_type": "movie",
        "media_id": movieId,
        "favorite": addTOFavorite,
      },
    );

    return response.data;
  }

  Future<Map<String, dynamic>> featchWatchedlist() async {
    late var Response;

    Response = await _dio.get(
      '${baseUrl}account/${EndPoint.userId}/watchlist/movies?language=en-US&sort_by=created_at.asc',
      options: Options(
        headers: {
          'Authorization': EndPoint.userAccessToken,
          'Accept': 'application/json',
        },
      ),
    );

    return Response.data;
  }

  Future<Map<String, dynamic>> watchedList(
    int movieId, {
    bool addTOWatchedList = false,
  }) async {
    var response = await _dio.post(
      '${baseUrl}account/${EndPoint.userId}/watchlist',
      options: Options(
        headers: {
          'Authorization': EndPoint.userAccessToken,
          'Accept': 'application/json',
        },
      ),
      data: {
        "media_type": "movie",
        "media_id": movieId,
        "watchlist": addTOWatchedList,
      },
    );

    return response.data;
  }
}
