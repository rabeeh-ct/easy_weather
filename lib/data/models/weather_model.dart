// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_weather/domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  WeatherModel({
    required super.temp,
    required super.tempMax,
    required super.tempMin,
    required super.lat,
    required super.long,
    required super.feelsLike,
    required super.pressure,
    required super.description,
    required super.weatherCategory,
    required super.humidity,
    required super.windSpeed,
    required super.city,
    required super.countryCode,
    required super.weatherImage,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temp: (json['main']['temp']).toDouble(),
      tempMax: (json['main']['temp_max']).toDouble(),
      tempMin: (json['main']['temp_min']).toDouble(),
      lat: json['coord']['lat'],
      long: json['coord']['lon'],
      feelsLike: (json['main']['feels_like']).toDouble(),
      pressure: json['main']['pressure'],
      weatherCategory: json['weather'][0]['main'],
      description: json['weather'][0]['description'],
      humidity: json['main']['humidity'],
      windSpeed: (json['wind']['speed']).toDouble(),
      city: json['name'],
      countryCode: json['sys']['country'],
      weatherImage: "https://openweathermap.org/img/wn/${json['weather'][0]['icon']}@2x.png",
    );
  }
}
