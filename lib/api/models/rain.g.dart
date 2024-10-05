// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rain.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Rain> _$rainSerializer = new _$RainSerializer();

class _$RainSerializer implements StructuredSerializer<Rain> {
  @override
  final Iterable<Type> types = const [Rain, _$Rain];
  @override
  final String wireName = 'Rain';

  @override
  Iterable<Object?> serialize(Serializers serializers, Rain object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.oneHour;
    if (value != null) {
      result
        ..add('1h')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  Rain deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RainBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '1h':
          result.oneHour = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$Rain extends Rain {
  @override
  final double? oneHour;

  factory _$Rain([void Function(RainBuilder)? updates]) =>
      (new RainBuilder()..update(updates))._build();

  _$Rain._({this.oneHour}) : super._();

  @override
  Rain rebuild(void Function(RainBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RainBuilder toBuilder() => new RainBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Rain && oneHour == other.oneHour;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, oneHour.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Rain')..add('oneHour', oneHour))
        .toString();
  }
}

class RainBuilder implements Builder<Rain, RainBuilder> {
  _$Rain? _$v;

  double? _oneHour;
  double? get oneHour => _$this._oneHour;
  set oneHour(double? oneHour) => _$this._oneHour = oneHour;

  RainBuilder();

  RainBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _oneHour = $v.oneHour;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Rain other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Rain;
  }

  @override
  void update(void Function(RainBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Rain build() => _build();

  _$Rain _build() {
    final _$result = _$v ?? new _$Rain._(oneHour: oneHour);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
