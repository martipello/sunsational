// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wind.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Wind> _$windSerializer = new _$WindSerializer();

class _$WindSerializer implements StructuredSerializer<Wind> {
  @override
  final Iterable<Type> types = const [Wind, _$Wind];
  @override
  final String wireName = 'Wind';

  @override
  Iterable<Object?> serialize(Serializers serializers, Wind object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.speed;
    if (value != null) {
      result
        ..add('speed')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.deg;
    if (value != null) {
      result
        ..add('deg')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.gust;
    if (value != null) {
      result
        ..add('gust')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  Wind deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WindBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'speed':
          result.speed = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'deg':
          result.deg = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'gust':
          result.gust = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$Wind extends Wind {
  @override
  final double? speed;
  @override
  final int? deg;
  @override
  final double? gust;

  factory _$Wind([void Function(WindBuilder)? updates]) =>
      (new WindBuilder()..update(updates))._build();

  _$Wind._({this.speed, this.deg, this.gust}) : super._();

  @override
  Wind rebuild(void Function(WindBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WindBuilder toBuilder() => new WindBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Wind &&
        speed == other.speed &&
        deg == other.deg &&
        gust == other.gust;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, speed.hashCode);
    _$hash = $jc(_$hash, deg.hashCode);
    _$hash = $jc(_$hash, gust.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Wind')
          ..add('speed', speed)
          ..add('deg', deg)
          ..add('gust', gust))
        .toString();
  }
}

class WindBuilder implements Builder<Wind, WindBuilder> {
  _$Wind? _$v;

  double? _speed;
  double? get speed => _$this._speed;
  set speed(double? speed) => _$this._speed = speed;

  int? _deg;
  int? get deg => _$this._deg;
  set deg(int? deg) => _$this._deg = deg;

  double? _gust;
  double? get gust => _$this._gust;
  set gust(double? gust) => _$this._gust = gust;

  WindBuilder();

  WindBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _speed = $v.speed;
      _deg = $v.deg;
      _gust = $v.gust;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Wind other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Wind;
  }

  @override
  void update(void Function(WindBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Wind build() => _build();

  _$Wind _build() {
    final _$result = _$v ?? new _$Wind._(speed: speed, deg: deg, gust: gust);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
