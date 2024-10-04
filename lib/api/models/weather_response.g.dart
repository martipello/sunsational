// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WeatherResponse> _$weatherResponseSerializer =
    new _$WeatherResponseSerializer();

class _$WeatherResponseSerializer
    implements StructuredSerializer<WeatherResponse> {
  @override
  final Iterable<Type> types = const [WeatherResponse, _$WeatherResponse];
  @override
  final String wireName = 'WeatherResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, WeatherResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'weather',
      serializers.serialize(object.weather,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Weather)])),
    ];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.main;
    if (value != null) {
      result
        ..add('main')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(WeatherValues)));
    }
    value = object.visibility;
    if (value != null) {
      result
        ..add('visibility')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.wind;
    if (value != null) {
      result
        ..add('wind')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(Wind)));
    }
    value = object.rain;
    if (value != null) {
      result
        ..add('rain')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(Rain)));
    }
    value = object.clouds;
    if (value != null) {
      result
        ..add('clouds')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(Cloud)));
    }
    return result;
  }

  @override
  WeatherResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WeatherResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'weather':
          result.weather.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Weather)]))!
              as BuiltList<Object?>);
          break;
        case 'main':
          result.main.replace(serializers.deserialize(value,
              specifiedType: const FullType(WeatherValues))! as WeatherValues);
          break;
        case 'visibility':
          result.visibility = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'wind':
          result.wind.replace(serializers.deserialize(value,
              specifiedType: const FullType(Wind))! as Wind);
          break;
        case 'rain':
          result.rain.replace(serializers.deserialize(value,
              specifiedType: const FullType(Rain))! as Rain);
          break;
        case 'clouds':
          result.clouds.replace(serializers.deserialize(value,
              specifiedType: const FullType(Cloud))! as Cloud);
          break;
      }
    }

    return result.build();
  }
}

class _$WeatherResponse extends WeatherResponse {
  @override
  final String? name;
  @override
  final BuiltList<Weather> weather;
  @override
  final WeatherValues? main;
  @override
  final double? visibility;
  @override
  final Wind? wind;
  @override
  final Rain? rain;
  @override
  final Cloud? clouds;

  factory _$WeatherResponse([void Function(WeatherResponseBuilder)? updates]) =>
      (new WeatherResponseBuilder()..update(updates))._build();

  _$WeatherResponse._(
      {this.name,
      required this.weather,
      this.main,
      this.visibility,
      this.wind,
      this.rain,
      this.clouds})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        weather, r'WeatherResponse', 'weather');
  }

  @override
  WeatherResponse rebuild(void Function(WeatherResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherResponseBuilder toBuilder() =>
      new WeatherResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeatherResponse &&
        name == other.name &&
        weather == other.weather &&
        main == other.main &&
        visibility == other.visibility &&
        wind == other.wind &&
        rain == other.rain &&
        clouds == other.clouds;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, weather.hashCode);
    _$hash = $jc(_$hash, main.hashCode);
    _$hash = $jc(_$hash, visibility.hashCode);
    _$hash = $jc(_$hash, wind.hashCode);
    _$hash = $jc(_$hash, rain.hashCode);
    _$hash = $jc(_$hash, clouds.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WeatherResponse')
          ..add('name', name)
          ..add('weather', weather)
          ..add('main', main)
          ..add('visibility', visibility)
          ..add('wind', wind)
          ..add('rain', rain)
          ..add('clouds', clouds))
        .toString();
  }
}

class WeatherResponseBuilder
    implements Builder<WeatherResponse, WeatherResponseBuilder> {
  _$WeatherResponse? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<Weather>? _weather;
  ListBuilder<Weather> get weather =>
      _$this._weather ??= new ListBuilder<Weather>();
  set weather(ListBuilder<Weather>? weather) => _$this._weather = weather;

  WeatherValuesBuilder? _main;
  WeatherValuesBuilder get main => _$this._main ??= new WeatherValuesBuilder();
  set main(WeatherValuesBuilder? main) => _$this._main = main;

  double? _visibility;
  double? get visibility => _$this._visibility;
  set visibility(double? visibility) => _$this._visibility = visibility;

  WindBuilder? _wind;
  WindBuilder get wind => _$this._wind ??= new WindBuilder();
  set wind(WindBuilder? wind) => _$this._wind = wind;

  RainBuilder? _rain;
  RainBuilder get rain => _$this._rain ??= new RainBuilder();
  set rain(RainBuilder? rain) => _$this._rain = rain;

  CloudBuilder? _clouds;
  CloudBuilder get clouds => _$this._clouds ??= new CloudBuilder();
  set clouds(CloudBuilder? clouds) => _$this._clouds = clouds;

  WeatherResponseBuilder();

  WeatherResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _weather = $v.weather.toBuilder();
      _main = $v.main?.toBuilder();
      _visibility = $v.visibility;
      _wind = $v.wind?.toBuilder();
      _rain = $v.rain?.toBuilder();
      _clouds = $v.clouds?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WeatherResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WeatherResponse;
  }

  @override
  void update(void Function(WeatherResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WeatherResponse build() => _build();

  _$WeatherResponse _build() {
    _$WeatherResponse _$result;
    try {
      _$result = _$v ??
          new _$WeatherResponse._(
              name: name,
              weather: weather.build(),
              main: _main?.build(),
              visibility: visibility,
              wind: _wind?.build(),
              rain: _rain?.build(),
              clouds: _clouds?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'weather';
        weather.build();
        _$failedField = 'main';
        _main?.build();

        _$failedField = 'wind';
        _wind?.build();
        _$failedField = 'rain';
        _rain?.build();
        _$failedField = 'clouds';
        _clouds?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'WeatherResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
