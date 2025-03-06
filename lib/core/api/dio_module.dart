import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_constants.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio providerDio() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(milliseconds: 5000),
        receiveTimeout: const Duration(milliseconds: 5000),
      ),
    );

    // Add headers
    dio.options.headers = {
      'Content-Type': 'application/json',
      // 'Authorization': 'Bearer YOUR_TOKEN',
    };

    // Add PrettyDioLogger
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        compact: true,
        maxWidth: 90,
      ),
    );

    // Add Error Handling
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print('Request: ${options.method} ${options.path}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print('Response: ${response.statusCode}');
          return handler.next(response);
        },
        onError: (DioError error, handler) {
          print('Error: ${error.response?.statusCode} - ${error.message}');
          return handler.next(error);
        },
      ),
    );

    return dio;
  }
}
