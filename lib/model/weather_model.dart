class WeatherModel {
  final double temp;
  final int humidity;
  final String cityName;

  final String condition;
  final String weatherIcon;

  WeatherModel({
    required this.cityName,
    required this.weatherIcon,
    required this.temp,
    required this.humidity,
    required this.condition,
  });
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json["name"],

      weatherIcon: json["weather"][0]["icon"],
      temp: (json["main"]["temp"] as num).toDouble(),
      humidity: json["main"]["humidity"],
      condition: json["weather"][0]["main"],
    );
  }
}
