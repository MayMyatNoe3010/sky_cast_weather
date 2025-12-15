import 'package:dio/dio.dart';
import 'package:sky_cast_weather/core/utils/api_costants.dart';

class DioClient {
  final Dio _dio;

  DioClient()
    : _dio = Dio(
        BaseOptions(
          baseUrl: APIConstants.baseURL,
          connectTimeout: Duration(
            milliseconds: APIConstants.connectionTimeout,
          ),
          receiveTimeout: Duration(milliseconds: APIConstants.receiveTimeout),
          headers: {"Accept": "application/json"},
        ),
      ) {
    _dio.interceptors.addAll([
      LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
      ),
      SetupInterceptor(),
      RetryInterceptor(dio: _dio),
    ]);
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParams}) async {
    return _dio.get(path, queryParameters: queryParams);
  }

  Future<Response> post(String path, dynamic data) =>
      _dio.post(path, data: data);

  Future<Response> delete(String path) => _dio.delete(path);

  Future<Response> put(String path, dynamic data) => _dio.put(path, data: data);
}

class SetupInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.extra[APIConstants.retryCount] = 0;

    return handler.next(options);
  }
}

class RetryInterceptor extends Interceptor {
  final Dio dio;
  final int retries;
  final Duration delay;

  RetryInterceptor({
    required this.dio,
    this.retries = 3,
    this.delay = const Duration(seconds: 1),
  });

  bool _shouldRetry(DioException error) {
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      return true;
    }

    if (error.response?.statusCode == 503 ||
        error.response?.statusCode == 500) {
      return true;
    }
    return false;
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (_shouldRetry(err) &&
        err.requestOptions.extra[APIConstants.retryCount] < retries) {
      err.requestOptions.extra[APIConstants.retryCount] =
          (err.requestOptions.extra[APIConstants.retryCount] ?? 0) + 1;
      final currentRetry = err.requestOptions.extra[APIConstants.retryCount];
      print('RETRYING REQUEST ($currentRetry/$retries)');
      await Future<void>.delayed(delay);
      try {
        final response = await dio.request(
          err.requestOptions.path,
          cancelToken: err.requestOptions.cancelToken,
          data: err.requestOptions.data,
          queryParameters: err.requestOptions.queryParameters,
          options: Options(
            method: err.requestOptions.method,
            headers: err.requestOptions.headers,
            extra: err.requestOptions.extra, // Pass the updated retry_count
          ),
          onReceiveProgress: err.requestOptions.onReceiveProgress,
          onSendProgress: err.requestOptions.onSendProgress,
        );
        return handler.resolve(response);
      } on DioException catch (e) {
        return handler.next(e);
      }
    }
    return handler.next(err);
  }
}
