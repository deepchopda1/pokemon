import 'package:dio/dio.dart';
import 'package:pokemon/data/services/api_endpoint_url.dart';

class ApiClient {
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiEndpointUrl.baseUrl));

  Future<Response> get(String endPoint,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final Response response = await _dio.get(endPoint, data: queryParameters);
      return response;
    } on DioException catch (e) {
      throw Exception("@@@GET Error: ${e.message}");
    }
  }
}
