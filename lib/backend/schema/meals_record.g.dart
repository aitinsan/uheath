// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meals_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MealsRecord> _$mealsRecordSerializer = new _$MealsRecordSerializer();

class _$MealsRecordSerializer implements StructuredSerializer<MealsRecord> {
  @override
  final Iterable<Type> types = const [MealsRecord, _$MealsRecord];
  @override
  final String wireName = 'MealsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, MealsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.mealTime;
    if (value != null) {
      result
        ..add('mealTime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.timeTaken;
    if (value != null) {
      result
        ..add('timeTaken')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.preparation;
    if (value != null) {
      result
        ..add('preparation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.imagePath;
    if (value != null) {
      result
        ..add('imagePath')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.calories;
    if (value != null) {
      result
        ..add('calories')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DocumentReference)));
    }
    return result;
  }

  @override
  MealsRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MealsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'mealTime':
          result.mealTime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'timeTaken':
          result.timeTaken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'preparation':
          result.preparation = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'imagePath':
          result.imagePath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'calories':
          result.calories = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(DocumentReference))
              as DocumentReference;
          break;
      }
    }

    return result.build();
  }
}

class _$MealsRecord extends MealsRecord {
  @override
  final String mealTime;
  @override
  final String name;
  @override
  final String timeTaken;
  @override
  final String preparation;
  @override
  final String imagePath;
  @override
  final double calories;
  @override
  final DocumentReference reference;

  factory _$MealsRecord([void Function(MealsRecordBuilder) updates]) =>
      (new MealsRecordBuilder()..update(updates)).build();

  _$MealsRecord._(
      {this.mealTime,
      this.name,
      this.timeTaken,
      this.preparation,
      this.imagePath,
      this.calories,
      this.reference})
      : super._();

  @override
  MealsRecord rebuild(void Function(MealsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MealsRecordBuilder toBuilder() => new MealsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MealsRecord &&
        mealTime == other.mealTime &&
        name == other.name &&
        timeTaken == other.timeTaken &&
        preparation == other.preparation &&
        imagePath == other.imagePath &&
        calories == other.calories &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, mealTime.hashCode), name.hashCode),
                        timeTaken.hashCode),
                    preparation.hashCode),
                imagePath.hashCode),
            calories.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MealsRecord')
          ..add('mealTime', mealTime)
          ..add('name', name)
          ..add('timeTaken', timeTaken)
          ..add('preparation', preparation)
          ..add('imagePath', imagePath)
          ..add('calories', calories)
          ..add('reference', reference))
        .toString();
  }
}

class MealsRecordBuilder implements Builder<MealsRecord, MealsRecordBuilder> {
  _$MealsRecord _$v;

  String _mealTime;
  String get mealTime => _$this._mealTime;
  set mealTime(String mealTime) => _$this._mealTime = mealTime;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _timeTaken;
  String get timeTaken => _$this._timeTaken;
  set timeTaken(String timeTaken) => _$this._timeTaken = timeTaken;

  String _preparation;
  String get preparation => _$this._preparation;
  set preparation(String preparation) => _$this._preparation = preparation;

  String _imagePath;
  String get imagePath => _$this._imagePath;
  set imagePath(String imagePath) => _$this._imagePath = imagePath;

  double _calories;
  double get calories => _$this._calories;
  set calories(double calories) => _$this._calories = calories;

  DocumentReference _reference;
  DocumentReference get reference => _$this._reference;
  set reference(DocumentReference reference) => _$this._reference = reference;

  MealsRecordBuilder() {
    MealsRecord._initializeBuilder(this);
  }

  MealsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _mealTime = $v.mealTime;
      _name = $v.name;
      _timeTaken = $v.timeTaken;
      _preparation = $v.preparation;
      _imagePath = $v.imagePath;
      _calories = $v.calories;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MealsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MealsRecord;
  }

  @override
  void update(void Function(MealsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MealsRecord build() {
    final _$result = _$v ??
        new _$MealsRecord._(
            mealTime: mealTime,
            name: name,
            timeTaken: timeTaken,
            preparation: preparation,
            imagePath: imagePath,
            calories: calories,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
