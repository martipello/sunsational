// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_values.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WeatherValues> _$weatherValuesSerializer =
    new _$WeatherValuesSerializer();

class _$WeatherValuesSerializer implements StructuredSerializer<WeatherValues> {
  @override
  final Iterable<Type> types = const [WeatherValues, _$WeatherValues];
  @override
  final String wireName = 'WeatherValues';

  @override
  Iterable<Object?> serialize(Serializers serializers, WeatherValues object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.temp;
    if (value != null) {
      result
        ..add('temp')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.feelsLike;
    if (value != null) {
      result
        ..add('feelsLike')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.tempMin;
    if (value != null) {
      result
        ..add('tempMin')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.tempMax;
    if (value != null) {
      result
        ..add('tempMax')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.pressure;
    if (value != null) {
      result
        ..add('pressure')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.humidity;
    if (value != null) {
      result
        ..add('humidity')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  WeatherValues deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WeatherValuesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'temp':
          result.temp = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'feelsLike':
          result.feelsLike = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'tempMin':
          result.tempMin = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'tempMax':
          result.tempMax = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'pressure':
          result.pressure = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'humidity':
          result.humidity = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$WeatherValues extends WeatherValues {
  @override
  final double? temp;
  @override
  final double? feelsLike;
  @override
  final double? tempMin;
  @override
  final double? tempMax;
  @override
  final int? pressure;
  @override
  final int? humidity;

  factory _$WeatherValues([void Function(WeatherValuesBuilder)? updates]) =>
      (new WeatherValuesBuilder()..update(updates))._build();

  _$WeatherValues._(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.humidity})
      : super._();

  @override
  WeatherValues rebuild(void Function(WeatherValuesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherValuesBuilder toBuilder() => new WeatherValuesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeatherValues &&
        temp == other.temp &&
        feelsLike == other.feelsLike &&
        tempMin == other.tempMin &&
        tempMax == other.tempMax &&
        pressure == other.pressure &&
        humidity == other.humidity;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, temp.hashCode);
    _$hash = $jc(_$hash, feelsLike.hashCode);
    _$hash = $jc(_$hash, tempMin.hashCode);
    _$hash = $jc(_$hash, tempMax.hashCode);
    _$hash = $jc(_$hash, pressure.hashCode);
    _$hash = $jc(_$hash, humidity.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WeatherValues')
          ..add('temp', temp)
          ..add('feelsLike', feelsLike)
          ..add('tempMin', tempMin)
          ..add('tempMax', tempMax)
          ..add('pressure', pressure)
          ..add('humidity', humidity))
        .toString();
  }
}

class WeatherValuesBuilder
    implements Builder<WeatherValues, WeatherValuesBuilder> {
  _$WeatherValues? _$v;

  double? _temp;
  double? get temp => _$this._temp;
  set temp(double? temp) => _$this._temp = temp;

  double? _feelsLike;
  double? get feelsLike => _$this._feelsLike;
  set feelsLike(double? feelsLike) => _$this._feelsLike = feelsLike;

  double? _tempMin;
  double? get tempMin => _$this._tempMin;
  set tempMin(double? tempMin) => _$this._tempMin = tempMin;

  double? _tempMax;
  double? get tempMax => _$this._tempMax;
  set tempMax(double? tempMax) => _$this._tempMax = tempMax;

  int? _pressure;
  int? get pressure => _$this._pressure;
  set pressure(int? pressure) => _$this._pressure = pressure;

  int? _humidity;
  int? get humidity => _$this._humidity;
  set humidity(int? humidity) => _$this._humidity = humidity;

  WeatherValuesBuilder();

  WeatherValuesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _temp = $v.temp;
      _feelsLike = $v.feelsLike;
      _tempMin = $v.tempMin;
      _tempMax = $v.tempMax;
      _pressure = $v.pressure;
      _humidity = $v.humidity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WeatherValues other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WeatherValues;
  }

  @override
  void update(void Function(WeatherValuesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WeatherValues build() => _build();

  _$WeatherValues _build() {
    final _$result = _$v ??
        new _$WeatherValues._(
            temp: temp,
            feelsLike: feelsLike,
            tempMin: tempMin,
            tempMax: tempMax,
            pressure: pressure,
            humidity: humidity);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
