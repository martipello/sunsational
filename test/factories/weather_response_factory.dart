import 'package:sunsational/api/models/cloud.dart';
import 'package:sunsational/api/models/weather.dart';
import 'package:sunsational/api/models/weather_response.dart';
import 'package:sunsational/api/models/weather_values.dart';

class WeatherResponseFactory {
  static WeatherResponse create() {
    return WeatherResponse(
      (b) => b
        ..weather.replace(
          [
            Weather(
              (b) => b
                ..description = 'Clear sky'
                ..icon = '01d'
                ..main = 'Clear',
            ),
          ],
        )
        ..name = 'New York'
        ..clouds = Cloud((b) => b..all = 0).toBuilder()
        ..main = WeatherValues((b) => b
          ..temp = 20.0
          ..tempMax = 21.0
          ..tempMin = 19.0
          ..humidity = 50
          ..pressure = 1013
          ..feelsLike = 20.0).toBuilder()
        ..visibility = 10000
        ..rain = null
        ..wind = null,
    );
  }
}
