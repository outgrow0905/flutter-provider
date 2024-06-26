import 'package:open_weather/exceptions/wheather_exception.dart';
import 'package:open_weather/models/custom_error.dart';
import 'package:open_weather/models/weather.dart';
import 'package:open_weather/services/weather_api_services.dart';

class WeatherRepository {
  final WeatherApiServices weatherApiServices;

  WeatherRepository({
    required this.weatherApiServices,
  });

  Future<Weather> fetchWeather(String city) async {
    try {
      final directGeocoding = await weatherApiServices.getDirectGeocoding(city);
      print('directGeocoding: $directGeocoding');

      final tempWeather = await weatherApiServices.getWeather(directGeocoding);

      final weather = tempWeather.copyWith(
        name: directGeocoding.name,
        country: directGeocoding.country,
      );

      return weather;
    } on WeatherException catch (e) {
      throw CustomError(errMsg: e.message);
    } catch (e) {
      throw CustomError(errMsg: e.toString());
    }
  }
}
