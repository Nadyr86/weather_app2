import 'package:weather_app2/data/utils/weather_utils.dart';

class WeatherModel {
  final String celcius;
  final String cityName;
  final String icon;
  final String description;

  WeatherModel({required this.celcius,required this.cityName,required this.icon,required this.description});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      celcius: WeatherUtils.kelvinToCelcius(json['main']['temp'] as num),
      cityName: json['name'],
      icon: WeatherUtils.getWeatherIcon((json['main']['temp'] as num).toInt()),
      description: WeatherUtils.getDescription(
      int.parse(WeatherUtils.kelvinToCelcius(json['main']['temp'] as num))),
    );
  }
}
