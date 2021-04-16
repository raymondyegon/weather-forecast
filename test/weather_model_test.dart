import 'package:test/test.dart';
import 'package:weather/src/model/weather_model.dart';

void main() {
  group(
    'Testing Weather Model class',
    () {
      test(
        'A weather is created ',
        () {
          WeatherModel weather = WeatherModel();

          expect(weather, isNotNull);
        },
      );

      test(
        'Create weather model from a json',
        () {
          Map<String, dynamic> json = {
            'id': 1,
            'main': 'Cloudy',
            'description': 'slighty cloudy',
            'icon': '10d',
          };

          var weather = WeatherModel.fromJson(json);

          expect(weather.id, 1);

          expect(weather.runtimeType, WeatherModel);
        },
      );
    },
  );
}
