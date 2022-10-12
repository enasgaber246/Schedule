import 'package:dio/dio.dart';

import 'endpoints.dart';

class DioClient {
// dio instance
  final Dio _dio;

  DioClient(this._dio) {
    _dio..options.baseUrl = Endpoints.baseUrl;
  }

  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
