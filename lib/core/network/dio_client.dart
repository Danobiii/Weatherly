import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient()
    : dio = Dio(
        BaseOptions(
          baseUrl: "https://api.openweathermap.org/data/2.5",
          connectTimeout: Duration(seconds: 10),
          receiveTimeout: Duration(seconds: 10),
        ),
      ) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print("app working");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print("Response: ${response.statusCode}");
          return handler.next(response);
        },
        onError: (error, handler) {
          print("Error: ${error.message}");
          return handler.next(error);
        },
      ),
    );
  }
}
