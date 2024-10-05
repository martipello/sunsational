import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers/serializers.dart';

part 'rain.g.dart';

abstract class Rain implements Built<Rain, RainBuilder> {

  @BuiltValueField(wireName: '1h')
  double? get oneHour;

  Rain._();
  factory Rain([void Function(RainBuilder) updates]) = _$Rain;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Rain.serializer, this) as Map<String, dynamic>;
  }

  static Rain fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Rain.serializer, json)!;
  }

  static Serializer<Rain> get serializer => _$rainSerializer;
}