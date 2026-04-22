import 'package:dio_practice/model/weather_model.dart';
import 'package:dio_practice/services/weather_service.dart';
import 'package:riverpod/legacy.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeatherController extends StateNotifier<AsyncValue<WeatherModel>> {
  WeatherController() : super(const AsyncValue.loading());

  final WeatherService _service = WeatherService();
  Future<void> fetchweather(String? city) async {
    try {
      state = const AsyncValue.loading();
      if (city != null) {
        final response = await _service.getWeather(city);
        final weather = WeatherModel.fromJson(response.data);
        state = AsyncValue.data(weather);
      }
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
