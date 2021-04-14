class CityModel {
  final String name; // The name of the city

  final String country; // the country where it's located

  final int id; // The used to query data from openweathermap Api

  CityModel({this.id, this.country, this.name});
}
