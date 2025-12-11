import 'package:dio/dio.dart';
import 'package:sky_cast_weather/core/utils/api_costants.dart';


class DioClient{
  final Dio dio;
  DioClient() : dio = Dio(BaseOptions(
      baseUrl: APIConstants.baseUrl,
      connectTimeout: Duration(milliseconds: APIConstants.connectionTimeout),
      receiveTimeout: Duration(milliseconds: APIConstants.receiveTimeout)
  ));
  Future<Response> get(String path) => dio.get(path);
  Future<Response> post(String path, dynamic data) => dio.post(path, data: data);
  Future<Response> delete(String path) => dio.delete(path);
  Future<Response> put(String path, dynamic data) => dio.put(path, data: data);
}