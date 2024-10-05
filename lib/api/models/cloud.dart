import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers/serializers.dart';

part 'cloud.g.dart';

abstract class Cloud implements Built<Cloud, CloudBuilder> {

  int? get all;

  Cloud._();
  factory Cloud([void Function(CloudBuilder) updates]) = _$Cloud;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Cloud.serializer, this) as Map<String, dynamic>;
  }

  static Cloud fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Cloud.serializer, json)!;
  }

  static Serializer<Cloud> get serializer => _$cloudSerializer;
}