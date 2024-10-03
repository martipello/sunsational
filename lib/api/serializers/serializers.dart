import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'date_time_serializer.dart';

part 'serializers.g.dart';

@SerializersFor([

])
final Serializers serializers = (_$serializers.toBuilder()
      ..add(const DateTimeSerializer())
      ..addPlugin(StandardJsonPlugin()))
    .build();
