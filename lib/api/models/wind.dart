import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers/serializers.dart';

part 'wind.g.dart';

abstract class Wind implements Built<Wind, WindBuilder> {

  double? get speed;

  int? get deg;

  double? get gust;

  Wind._();
  factory Wind([void Function(WindBuilder) updates]) = _$Wind;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Wind.serializer, this) as Map<String, dynamic>;
  }

  static Wind fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Wind.serializer, json)!;
  }

  static Serializer<Wind> get serializer => _$windSerializer;
}