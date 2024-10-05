import 'package:sunsational/api/models/weather_response.dart';

import '../api_client.dart';

class WeatherRepository {
  WeatherRepository(this.apiClient);

  final ApiClient apiClient;

  final String kWeatherPath = '/weather?q=';

  Future<WeatherResponse> getWeather(String city) async {
    final weatherResponse = await apiClient.get(path: '$kWeatherPath$city&units=metric');
    return WeatherResponse.fromJson(weatherResponse);
  }
}