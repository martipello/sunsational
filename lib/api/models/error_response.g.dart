// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ErrorResponse> _$errorResponseSerializer =
    new _$ErrorResponseSerializer();

class _$ErrorResponseSerializer implements StructuredSerializer<ErrorResponse> {
  @override
  final Iterable<Type> types = const [ErrorResponse, _$ErrorResponse];
  @override
  final String wireName = 'ErrorResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, ErrorResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'parameters',
      serializers.serialize(object.parameters,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];
    Object? value;
    value = object.statusMessage;
    if (value != null) {
      result
        ..add('statusMessage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.error;
    if (value != null) {
      result
        ..add('error')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Object)));
    }
    value = object.url;
    if (value != null) {
      result
        ..add('url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.statusCode;
    if (value != null) {
      result
        ..add('statusCode')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  ErrorResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ErrorResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'statusMessage':
          result.statusMessage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'error':
          result.error = serializers.deserialize(value,
              specifiedType: const FullType(Object));
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'parameters':
          result.parameters.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'statusCode':
          result.statusCode = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$ErrorResponse extends ErrorResponse {
  @override
  final String? statusMessage;
  @override
  final String? message;
  @override
  final Object? error;
  @override
  final String? url;
  @override
  final BuiltList<String> parameters;
  @override
  final int? statusCode;

  factory _$ErrorResponse([void Function(ErrorResponseBuilder)? updates]) =>
      (new ErrorResponseBuilder()..update(updates))._build();

  _$ErrorResponse._(
      {this.statusMessage,
      this.message,
      this.error,
      this.url,
      required this.parameters,
      this.statusCode})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        parameters, r'ErrorResponse', 'parameters');
  }

  @override
  ErrorResponse rebuild(void Function(ErrorResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ErrorResponseBuilder toBuilder() => new ErrorResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ErrorResponse &&
        statusMessage == other.statusMessage &&
        message == other.message &&
        error == other.error &&
        url == other.url &&
        parameters == other.parameters &&
        statusCode == other.statusCode;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, statusMessage.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, parameters.hashCode);
    _$hash = $jc(_$hash, statusCode.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ErrorResponse')
          ..add('statusMessage', statusMessage)
          ..add('message', message)
          ..add('error', error)
          ..add('url', url)
          ..add('parameters', parameters)
          ..add('statusCode', statusCode))
        .toString();
  }
}

class ErrorResponseBuilder
    implements Builder<ErrorResponse, ErrorResponseBuilder> {
  _$ErrorResponse? _$v;

  String? _statusMessage;
  String? get statusMessage => _$this._statusMessage;
  set statusMessage(String? statusMessage) =>
      _$this._statusMessage = statusMessage;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  Object? _error;
  Object? get error => _$this._error;
  set error(Object? error) => _$this._error = error;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  ListBuilder<String>? _parameters;
  ListBuilder<String> get parameters =>
      _$this._parameters ??= new ListBuilder<String>();
  set parameters(ListBuilder<String>? parameters) =>
      _$this._parameters = parameters;

  int? _statusCode;
  int? get statusCode => _$this._statusCode;
  set statusCode(int? statusCode) => _$this._statusCode = statusCode;

  ErrorResponseBuilder();

  ErrorResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _statusMessage = $v.statusMessage;
      _message = $v.message;
      _error = $v.error;
      _url = $v.url;
      _parameters = $v.parameters.toBuilder();
      _statusCode = $v.statusCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ErrorResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ErrorResponse;
  }

  @override
  void update(void Function(ErrorResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ErrorResponse build() => _build();

  _$ErrorResponse _build() {
    _$ErrorResponse _$result;
    try {
      _$result = _$v ??
          new _$ErrorResponse._(
              statusMessage: statusMessage,
              message: message,
              error: error,
              url: url,
              parameters: parameters.build(),
              statusCode: statusCode);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'parameters';
        parameters.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ErrorResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
