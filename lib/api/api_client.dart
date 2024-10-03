import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';

import 'models/error_response.dart';

class ApiClient {
  ApiClient(this.dio);

  final Dio dio;

  Future<dynamic> get({
    required String path,
    Object? data,
    Map<String, dynamic>? params,
    Duration? timeout,
  }) async {
    try {
      final body = data != null ? jsonEncode(data) : null;
      final response = await dio.get(
        path,
        data: body,
        queryParameters: params,
      );
      return _handleDioResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } on ErrorResponse {
      rethrow;
    } catch (e) {
      throw ErrorResponse(
        (b) => b
          ..statusCode = 1000
          ..error = e,
      );
    }
  }

  dynamic _handleDioResponse(Response response) {
    // A very simple implementation of handling the response
    final statusCode = response.statusCode ?? 0;
    if (statusCode >= 200 && statusCode < 300 || statusCode == 304) {
      return response.data;
    } else {
      throw ErrorResponse(
        (b) => b
          ..statusCode = response.statusCode
          ..url = response.realUri.toString()
          ..error = response.data,
      );
    }
  }

  ErrorResponse _handleDioError(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.cancel:
        return ErrorResponse(
          (p0) => p0
            ..statusCode = exception.response?.statusCode ?? 502
            ..message = 'Request to API server was cancelled.',
        );
      case DioExceptionType.sendTimeout:
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.connectionError:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
        return ErrorResponse(
          (p0) => p0
            ..statusCode = exception.response?.statusCode ?? 503
            ..message = _connectionErrorMessage,
        );
      case DioExceptionType.badResponse:
        return ErrorResponse(
          (p0) => p0
            ..statusCode = exception.response?.statusCode ?? 449
            ..message = '${exception.response?.data.toString()}',
        );
    }
  }

  static Dio initDioClient(String baseUrl) {
    const duration = Duration(seconds: 10);
    return Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: duration,
        receiveTimeout: duration,
        sendTimeout: duration,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        headers: {
          'Accept': 'application/json, text/plain, */*',
          //TODO(MS): This should be a secure token not stored in the application use dart define or similar
          'Authorization': 'zBv33i1TQrTdoPGux8EsRlQCRwUVEhgsXfOSHdUAWnbBvV9w08jExapX',
        },
        validateStatus: (status) {
          if (status == null) return false;
          return status >= 200 && status < 300 || status == 304;
        },
      ),
    )..interceptors.add(
        LogInterceptor(requestBody: true, responseBody: true),
      );
  }

  String get _connectionErrorMessage => 'Either there is an issue with the Internet connection, '
      'or the server is sleeping please try again later...';
}
