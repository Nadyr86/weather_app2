import 'package:geolocator/geolocator.dart';
import 'package:weather_app2/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather_app2/models/weather_model.dart';

class WeatherSercice {
  Future<Map<String, dynamic>> getWeatherByLocation(
      {required Position position}) async {
    var client = http.Client();
    try {
      Uri _uri = Uri.parse(
          '$baseUrl?&lat=${position.latitude}&lon=${position.longitude}&appid=$openWeatherApiKey');

      final response = await client.get(_uri);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = response.body;

        final _data = jsonDecode(body) as Map<String, dynamic>;

        return _data;
      } else {
        return null!;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>> getWeatherByCity(String city) async {
    try {
      final client = http.Client;
      final url = '$baseUrl?q=$city&appid=$openWeatherApiKey';
      Uri uri = Uri.parse(url);
      final response = await http.get(uri);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final _data = jsonDecode(response.body) as Map<String, dynamic>;

        return _data;
        // _cityName = _data['name'];
        // final kelvin = _data['main']['temp'] as num;

        // _celcius = (kelvin - 273.15).round().toString();
        // _icon = WeatherUtils.getWeatherIcon(kelvin.toInt());
        // _description = WeatherUtils.getDescription(int.parse(_celcius));
      } else {
        return null!;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<WeatherModel> getWeatherModelByLocation(Position position) async {
    final _data = await getWeatherByLocation(position: position);
    WeatherModel _weatherModel = WeatherModel.fromJson(_data);
    return _weatherModel;
  }

  Future<WeatherModel> getWeatherModelByCity(String city) async {
    return WeatherModel.fromJson(await getWeatherByCity(city));
  }
}
