import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:sunsational/api/models/weather.dart';
import 'package:sunsational/api/models/weather_response.dart';

import '../models/cloud.dart';
import '../models/rain.dart';
import '../models/weather_values.dart';
import '../models/wind.dart';
import 'date_time_serializer.dart';

part 'serializers.g.dart';

@SerializersFor([
  WeatherResponse,
  Weather,
  Cloud,
  Rain,
  Wind,
  WeatherValues,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..add(const DateTimeSerializer())
      ..addPlugin(StandardJsonPlugin()))
    .build();
