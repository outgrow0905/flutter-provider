import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:open_weather/constants/constants.dart';
import 'package:open_weather/exceptions/wheather_exception.dart';
import 'package:open_weather/models/direct_geocoding.dart';
import 'package:open_weather/models/weather.dart';
import 'package:open_weather/services/http_error_handler.dart';

class WeatherApiServices {
  final http.Client httpClient;

  WeatherApiServices({
    required this.httpClient,
  });

  Future<DirectGeocoding> getDirectGeocoding(String city) async {
    final Uri uri = Uri(
        scheme: 'https',
        host: kApiHost,
        path: '/geo/1.0/direct',
        queryParameters: {
          'q': city,
          'limit': kLimit,
          'appid': dotenv.env['APPID'],
        });

    print('getDirectGeocoding uri: $uri');

    try {
      final http.Response response = await httpClient.get(uri);

      if (response.statusCode != 200) {
        throw Exception(httpErrorHandler(response));
      }

      final directGeocodingJson = json.decode(response.body);
      if (directGeocodingJson.isEmpty) {
        throw WeatherException('Cannot get the location of $city');
      }

      final directGeocoding = DirectGeocoding.fromJson(directGeocodingJson);
      return directGeocoding;
    } catch (e) {
      rethrow; // 이렇게 할꺼면 try catch 뺴도 되지않나
    }
  }

  Future<Weather> getWeather(DirectGeocoding directGeocoding) async {
    final Uri uri = Uri(
        scheme: 'https',
        host: kApiHost,
        path: '/data/2.5/weather',
        queryParameters: {
          'lat': '${directGeocoding.lat}',
          'lon': '${directGeocoding.lon}',
          'units': kUnit,
          'appid': dotenv.env['APPID'],
        });

    print('getWeather uri: $uri');

    try {
      final http.Response response = await httpClient.get(uri);

      if (response.statusCode != 200) {
        throw Exception(httpErrorHandler(response));
      }

      final weatherJson = json.decode(response.body);
      final weather = Weather.fromJson(weatherJson);
      return weather;
    } catch (e) {
      rethrow; // 이렇게 할꺼면 try catch 뺴도 되지않나
    }
  }
}
