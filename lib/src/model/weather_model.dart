class WeatherModel {
  final int id; // The weather Id,
  final String title; // The weather title,
  final String description; // The weather description
  final String image; // The weather image

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      id: json['id'],
      title: json['main'],
      description: json['description'],
      image: "http://openweathermap.org/img/wn/${json['icon']}@2x.png",
    );
  }

  WeatherModel({this.description, this.id, this.image, this.title});
}
