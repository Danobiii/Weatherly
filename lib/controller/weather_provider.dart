import 'package:dio_practice/controller/weather_controller.dart';
import 'package:dio_practice/model/weather_model.dart';
import 'package:riverpod/legacy.dart';
import 'package:riverpod/riverpod.dart';

final weatherProvider =
    StateNotifierProvider<WeatherController, AsyncValue<WeatherModel>>(
      (ref) => WeatherController(),
    );
