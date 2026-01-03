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
      '${baseUrl}account/e610a9e4aea5e6cc384486c10e1bb4d8/favorite/movies?language=en-US&page=1&sort_by=created_at.asc',
      options: Options(
        headers: {
          'Authorization': EndPoint.userAccessToken,
          'Accept': 'application/json',
        },
      ),
    );

    return Response.data;
  }

  Future<Map<String, dynamic>> Favorite(
    int movieId, {
    bool addTOFavorite = false,
  }) async {
    late var Response;

    Response = await _dio.post(
      '${baseUrl}account/e610a9e4aea5e6cc384486c10e1bb4d8/favorite',
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

    return Response.data;
  }
}
