import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers/serializers.dart';

part 'weather_values.g.dart';

abstract class WeatherValues implements Built<WeatherValues, WeatherValuesBuilder> {

  double? get temp;

  double? get feelsLike;

  double? get tempMin;

  double? get tempMax;

  int? get pressure;

  int? get humidity;

  WeatherValues._();
  factory WeatherValues([void Function(WeatherValuesBuilder) updates]) = _$WeatherValues;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(WeatherValues.serializer, this) as Map<String, dynamic>;
  }

  static WeatherValues fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(WeatherValues.serializer, json)!;
  }

  static Serializer<WeatherValues> get serializer => _$weatherValuesSerializer;
}