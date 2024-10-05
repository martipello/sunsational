import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers/serializers.dart';

part 'weather.g.dart';

abstract class Weather implements Built<Weather, WeatherBuilder> {

  String? get main;

  String? get description;

  String? get icon;

  Weather._();
  factory Weather([void Function(WeatherBuilder) updates]) = _$Weather;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Weather.serializer, this) as Map<String, dynamic>;
  }

  static Weather fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Weather.serializer, json)!;
  }

  static Serializer<Weather> get serializer => _$weatherSerializer;
}