import 'dart:async';

import 'package:sunsational/api/models/api_response.dart';
import 'package:sunsational/api/models/error_response.dart';
import 'package:sunsational/api/models/weather_response.dart';
import 'package:sunsational/api/repositories/weather_repository.dart';

class WeatherViewModel {
  WeatherViewModel(this._weatherRepository);

  final WeatherRepository _weatherRepository;

  final _weatherStreamController = StreamController<ApiResponse<WeatherResponse?>>();
  late final weatherStream = _weatherStreamController.stream;

  Future<void> fetchWeather(String city) async {
    _weatherStreamController.sink.add(OnLoad());
    try {
      final weatherResponse = await _weatherRepository.getWeather(city);
      _weatherStreamController.sink.add(OnComplete(weatherResponse));
    } catch (e) {
      if (e is ErrorResponse) {
        _weatherStreamController.sink.add(OnError(error: e));
        return;
      }
      _weatherStreamController.sink.add(
        OnError(
          error: ErrorResponse(
            (b) => b
              ..error = e
          ),
        ),
      );
    }
  }

  void dispose() {
    _weatherStreamController.close();
  }
}
