import 'package:dio/dio.dart';
import 'package:movies/core/utils/end_point.dart';

class ApiService {
  final String baseUrl = EndPoint.movieBaseUrl;
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get(String endPoint) async {
    var Response = await _dio.get('$baseUrl$endPoint',
    options: Options(
    headers: {
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlNjEwYTllNGFlYTVlNmNjMzg0NDg2YzEwZTFiYjRkOCIsIm5iZiI6MTc2NjQ3NjM5OC4zNiwic3ViIjoiNjk0YTRhNmU3ZjkzZjQxYTVkOGNlZjAzIiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.gfXm9Z8fiGzhcfpGkjYnifUk6tLwErm1ZIX0GAlzIc0',
      'Accept': 'application/json',
    },
  ),
    );
    return Response.data;
  }
}
