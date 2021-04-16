import 'package:test/test.dart';
import 'package:weather/src/model/city_model.dart';

void main() {
  group('Testing City Model class', () {
    test(
      'A city instance is created',
      () {
        CityModel city = CityModel(id: 1, country: 'Kenya', name: 'Nairobi');

        expect(city.id, 1);
      },
    );

    test(
      'Test a list of cities',
      () {
        List<CityModel> cities = [
          CityModel(
            id: 2637827,
            name: 'Silverstone',
            country: 'UK',
          ),
          CityModel(
            id: 3448433,
            name: "São Paulo",
            country: 'Brazil',
          ),
          CityModel(
            id: 2158177,
            name: 'Melbourne',
            country: 'Australia',
          ),
          CityModel(
            id: 2992741,
            name: 'Monte Carlo',
            country: 'Monaco',
          ),
        ];

        // Add 4 cities and check if length is 4
        expect(cities.length, 4);

        cities.removeLast();

        // Add 4 cities and check if length is for
        expect(cities.length, 3);
      },
    );
  });
}
