import 'package:sunsational/api/models/weather_response.dart';

import '../api_client.dart';

class WeatherRepository {
  WeatherRepository({required this.apiClient});
  final ApiClient apiClient;

  final String kWeatherPath = '/weather?q=';

  Future<WeatherResponse> getWeather(String city) async {
    final weatherResponse = await apiClient.get(path: '$kWeatherPath$city');
    return WeatherResponse.fromJson(weatherResponse);
  }
}