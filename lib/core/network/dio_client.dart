import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'dart:developer';

import 'package:weather_clean_architecture/core/constant/Constant.dart';

class DioClient {
  late final Dio _dio;
  DioClient()
      : _dio = Dio(BaseOptions(
            baseUrl: Constant.url,
            connectTimeout: Duration(seconds: 30),
            receiveTimeout: Duration(seconds: 20),
            responseType: ResponseType.json))
          ..interceptors.add(PrettyDioLogger(
            compact: false,
            logPrint: (object) => log(object.toString(), name: 'Weather API'),
          ));

  Future<Response<dynamic>> get(String url, Map<String, dynamic> queryParams,
      [Options? option,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress]) async {
    try {
      final response = await _dio.get(url,
          queryParameters: queryParams,
          options: option,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress);
      return response;
    } on DioException {
      rethrow;
    }
  }
}
