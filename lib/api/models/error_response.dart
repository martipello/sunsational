import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import '../serializers/serializers.dart';

part 'error_response.g.dart';

abstract class ErrorResponse implements Built<ErrorResponse, ErrorResponseBuilder> {
  factory ErrorResponse([void Function(ErrorResponseBuilder) updates]) = _$ErrorResponse;

  ErrorResponse._();

  String? get statusMessage;

  String? get message;

  Object? get error;

  String? get url;

  BuiltList<String> get parameters;

  int? get statusCode;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(ErrorResponse.serializer, this) as Map<String, dynamic>;
  }

  static ErrorResponse? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(ErrorResponse.serializer, json);
  }

  static Serializer<ErrorResponse> get serializer => _$errorResponseSerializer;
}
