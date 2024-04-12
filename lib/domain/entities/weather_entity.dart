// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

class WeatherEntity with ChangeNotifier {
  final double temp;
  final double tempMax;
  final double tempMin;
  final double lat;
  final double long;
  final double feelsLike;
  final int pressure;
  final String description;
  final String weatherCategory;
  final int humidity;
  final double windSpeed;
  String city;
  final String countryCode;
  final String weatherImage;

  WeatherEntity({
    required this.temp,
    required this.tempMax,
    required this.tempMin,
    required this.lat,
    required this.long,
    required this.feelsLike,
    required this.pressure,
    required this.description,
    required this.weatherCategory,
    required this.humidity,
    required this.windSpeed,
    required this.city,
    required this.countryCode,
    required this.weatherImage,
  });
}
