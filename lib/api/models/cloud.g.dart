// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Cloud> _$cloudSerializer = new _$CloudSerializer();

class _$CloudSerializer implements StructuredSerializer<Cloud> {
  @override
  final Iterable<Type> types = const [Cloud, _$Cloud];
  @override
  final String wireName = 'Cloud';

  @override
  Iterable<Object?> serialize(Serializers serializers, Cloud object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.all;
    if (value != null) {
      result
        ..add('all')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  Cloud deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CloudBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'all':
          result.all = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$Cloud extends Cloud {
  @override
  final int? all;

  factory _$Cloud([void Function(CloudBuilder)? updates]) =>
      (new CloudBuilder()..update(updates))._build();

  _$Cloud._({this.all}) : super._();

  @override
  Cloud rebuild(void Function(CloudBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CloudBuilder toBuilder() => new CloudBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Cloud && all == other.all;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, all.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Cloud')..add('all', all)).toString();
  }
}

class CloudBuilder implements Builder<Cloud, CloudBuilder> {
  _$Cloud? _$v;

  int? _all;
  int? get all => _$this._all;
  set all(int? all) => _$this._all = all;

  CloudBuilder();

  CloudBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _all = $v.all;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Cloud other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Cloud;
  }

  @override
  void update(void Function(CloudBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Cloud build() => _build();

  _$Cloud _build() {
    final _$result = _$v ?? new _$Cloud._(all: all);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
