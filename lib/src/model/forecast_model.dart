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
    /// If it contains the cnt keys then it is a 5 day forecast els its the current weather
    if (json.containsKey('cnt')) {
      var data = json['list'][0];
      return ForecastModel(
        cityID: json['city']['id'],
        weather: WeatherModel.fromJson(data['weather'][0]),
        windSpeed: data['wind']['speed'],
        feelsLike: data['main']['feels_like'],
        humidity: data['main']['humidity'],
        temp: data['main']['temp'],
        tempMax: data['main']['temp_max'],
        tempMin: data['main']['temp_min'],
        unixTime: data['dt'],
      );
    } else {
      return ForecastModel(
        weather: WeatherModel.fromJson(json['weather'][0]),
        cityID: json['id'],
        windSpeed: json['wind']['speed'],
        feelsLike: json['main']['feels_like'],
        temp: json['main']['temp'],
        tempMin: json['main']['temp_min'],
        tempMax: json['main']['temp_max'],
        humidity: json['main']['humidity'],
        unixTime: json['dt'],
      );
    }
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
