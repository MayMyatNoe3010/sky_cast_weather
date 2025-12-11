import 'package:dio/dio.dart';
import 'package:sky_cast_weather/core/utils/api_costants.dart';


class DioClient{
  final Dio _dio;
  DioClient() : _dio = Dio(BaseOptions(
      baseUrl: APIConstants.baseURL,
      connectTimeout: Duration(milliseconds: APIConstants.connectionTimeout),
      receiveTimeout: Duration(milliseconds: APIConstants.receiveTimeout)
  ));
  Future<Response> get(String path, {Map<String, dynamic>? queryParams}) async {
    return _dio.get(path, queryParameters: queryParams);
  }
  Future<Response> post(String path, dynamic data) => _dio.post(path, data: data);
  Future<Response> delete(String path) => _dio.delete(path);
  Future<Response> put(String path, dynamic data) => _dio.put(path, data: data);
}