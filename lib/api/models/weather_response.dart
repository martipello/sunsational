import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:sunsational/api/models/rain.dart';
import 'package:sunsational/api/models/weather.dart';
import 'package:sunsational/api/models/weather_values.dart';
import 'package:sunsational/api/models/wind.dart';

import '../serializers/serializers.dart';
import 'cloud.dart';

part 'weather_response.g.dart';

abstract class WeatherResponse implements Built<WeatherResponse, WeatherResponseBuilder> {

  String? get name;

  BuiltList<Weather> get weather;

  WeatherValues? get main;

  double? get visibility;

  Wind? get wind;

  Rain? get rain;

  Cloud? get clouds;

  WeatherResponse._();
  factory WeatherResponse([void Function(WeatherResponseBuilder) updates]) = _$WeatherResponse;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(WeatherResponse.serializer, this) as Map<String, dynamic>;
  }

  static WeatherResponse fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(WeatherResponse.serializer, json)!;
  }

  static Serializer<WeatherResponse> get serializer => _$weatherResponseSerializer;
}