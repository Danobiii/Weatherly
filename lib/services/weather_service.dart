import 'package:dio/dio.dart';
import 'package:dio_practice/core/network/dio_client.dart';

class WeatherService {
  final Dio _dio = DioClient().dio;
  Future<Response> getWeather(String city) async {
    return await _dio.get(
      "/weather",
      queryParameters: {
        "q": city,
        "appid": "78656f1edcbe7ee9fd1718c25017f3e3",
        "units": "metric",
      },
    );
  }
}
