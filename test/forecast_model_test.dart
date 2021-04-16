import 'package:test/test.dart';
import 'package:weather/src/model/forecast_model.dart';
import 'package:weather/src/model/weather_model.dart';

void main() {
  group(
    'Testing Forecast Model class',
    () {
      test(
        'A forecast instance is created',
        () {
          ForecastModel forecast = ForecastModel();

          expect(forecast, isNotNull);
        },
      );

      test(
        'Create forecast from a json',
        () {
          Map<String, dynamic> json = {
            "coord": {"lon": -0.1257, "lat": 51.5085},
            "weather": [
              {
                "id": 800,
                "main": "Clear",
                "description": "clear sky",
                "icon": "01d"
              }
            ],
            "base": "stations",
            "main": {
              "temp": 278.9,
              "feels_like": 277.9,
              "temp_min": 277.04,
              "temp_max": 280.93,
              "pressure": 1032,
              "humidity": 81
            },
            "visibility": 10000,
            "wind": {"speed": 1.54, "deg": 0},
            "clouds": {"all": 8},
            "dt": 1618560000,
            "sys": {
              "type": 1,
              "id": 1414,
              "country": "GB",
              "sunrise": 1618549331,
              "sunset": 1618599475
            },
            "timezone": 3600,
            "id": 2643743,
            "name": "London",
            "cod": 200
          };

          var forecast = ForecastModel.fromJson(json);

          expect(forecast.runtimeType, ForecastModel);

          expect(forecast.weather.runtimeType, WeatherModel);
        },
      );

      test(
        'Create a List containing 5 day forecast',
        () {
          Map<String, dynamic> json = {
            "cod": "200",
            "message": 0,
            "cnt": 40,
            "list": [
              {
                "dt": 1618563600,
                "main": {
                  "temp": 5.74,
                  "feels_like": 3.69,
                  "temp_min": 5.74,
                  "temp_max": 6.84,
                  "pressure": 1032,
                  "sea_level": 1032,
                  "grnd_level": 1028,
                  "humidity": 81,
                  "temp_kf": -1.1
                },
                "weather": [
                  {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                  }
                ],
                "clouds": {"all": 7},
                "wind": {"speed": 2.61, "deg": 44, "gust": 3.95},
                "visibility": 10000,
                "pop": 0,
                "sys": {"pod": "d"},
                "dt_txt": "2021-04-16 09:00:00"
              },
              {
                "dt": 1618574400,
                "main": {
                  "temp": 7.31,
                  "feels_like": 5.63,
                  "temp_min": 7.31,
                  "temp_max": 10.45,
                  "pressure": 1032,
                  "sea_level": 1032,
                  "grnd_level": 1028,
                  "humidity": 66,
                  "temp_kf": -3.14
                },
                "weather": [
                  {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                  }
                ],
                "clouds": {"all": 7},
                "wind": {"speed": 2.51, "deg": 40, "gust": 3.27},
                "visibility": 10000,
                "pop": 0,
                "sys": {"pod": "d"},
                "dt_txt": "2021-04-16 12:00:00"
              },
              {
                "dt": 1618585200,
                "main": {
                  "temp": 9.53,
                  "feels_like": 7.69,
                  "temp_min": 9.53,
                  "temp_max": 11.42,
                  "pressure": 1030,
                  "sea_level": 1030,
                  "grnd_level": 1026,
                  "humidity": 51,
                  "temp_kf": -1.89
                },
                "weather": [
                  {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04d"
                  }
                ],
                "clouds": {"all": 61},
                "wind": {"speed": 3.46, "deg": 57, "gust": 3.66},
                "visibility": 10000,
                "pop": 0,
                "sys": {"pod": "d"},
                "dt_txt": "2021-04-16 15:00:00"
              },
            ],
            "city": {
              "id": 2643743,
              "name": "London",
              "coord": {"lat": 51.5085, "lon": -0.1257},
              "country": "GB",
              "population": 1000000,
              "timezone": 3600,
              "sunrise": 1618549331,
              "sunset": 1618599475
            }
          };

          var data = List.generate(
            json['list'].length,
            (index) => ForecastModel.fromJson(
              json['list'][index],
            ),
          );

          expect(data.runtimeType.toString(), 'List<ForecastModel>');
        },
      );
    },
  );
}
