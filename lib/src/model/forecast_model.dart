import 'package:weather/src/model/weather_model.dart';

class ForecastModel {
  final int cityID; // The city id
  final String temp; // The temperature
  final String tempMax; // Max temperature,
  final String tempMin; // Minimum temperature
  final String windSpeed; // Wind speed
  final String humidity; // Percentage of humidity
  final WeatherModel weather; // The weather description and Icon
  final String feelsLike; // What temp feels like
  final int unixTime; // timesince epoch when it is forecasted

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
      weather: WeatherModel.fromJson(json['weather'][0]),
      cityID: json['id'] ?? null,
      windSpeed: json['wind']['speed'].toString(),
      feelsLike: json['main']['feels_like'].toString(),
      temp: json['main']['temp'].toString(),
      tempMin: json['main']['temp_min'].toString(),
      tempMax: json['main']['temp_max'].toString(),
      humidity: json['main']['humidity'].toString(),
      unixTime: json['dt'],
    );
  }

  ForecastModel({
    this.cityID,
    this.feelsLike,
    this.humidity,
    this.temp,
    this.tempMax,
    this.tempMin,
    this.weather,
    this.windSpeed,
    this.unixTime,
  });
}
