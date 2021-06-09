// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainings_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TrainingsRecord> _$trainingsRecordSerializer =
    new _$TrainingsRecordSerializer();

class _$TrainingsRecordSerializer
    implements StructuredSerializer<TrainingsRecord> {
  @override
  final Iterable<Type> types = const [TrainingsRecord, _$TrainingsRecord];
  @override
  final String wireName = 'TrainingsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, TrainingsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.imagePath;
    if (value != null) {
      result
        ..add('imagePath')
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
    value = object.instruction;
    if (value != null) {
      result
        ..add('instruction')
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
  TrainingsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TrainingsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'imagePath':
          result.imagePath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'instruction':
          result.instruction = serializers.deserialize(value,
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

class _$TrainingsRecord extends TrainingsRecord {
  @override
  final String imagePath;
  @override
  final String name;
  @override
  final String instruction;
  @override
  final double calories;
  @override
  final DocumentReference reference;

  factory _$TrainingsRecord([void Function(TrainingsRecordBuilder) updates]) =>
      (new TrainingsRecordBuilder()..update(updates)).build();

  _$TrainingsRecord._(
      {this.imagePath,
      this.name,
      this.instruction,
      this.calories,
      this.reference})
      : super._();

  @override
  TrainingsRecord rebuild(void Function(TrainingsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TrainingsRecordBuilder toBuilder() =>
      new TrainingsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TrainingsRecord &&
        imagePath == other.imagePath &&
        name == other.name &&
        instruction == other.instruction &&
        calories == other.calories &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, imagePath.hashCode), name.hashCode),
                instruction.hashCode),
            calories.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TrainingsRecord')
          ..add('imagePath', imagePath)
          ..add('name', name)
          ..add('instruction', instruction)
          ..add('calories', calories)
          ..add('reference', reference))
        .toString();
  }
}

class TrainingsRecordBuilder
    implements Builder<TrainingsRecord, TrainingsRecordBuilder> {
  _$TrainingsRecord _$v;

  String _imagePath;
  String get imagePath => _$this._imagePath;
  set imagePath(String imagePath) => _$this._imagePath = imagePath;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _instruction;
  String get instruction => _$this._instruction;
  set instruction(String instruction) => _$this._instruction = instruction;

  double _calories;
  double get calories => _$this._calories;
  set calories(double calories) => _$this._calories = calories;

  DocumentReference _reference;
  DocumentReference get reference => _$this._reference;
  set reference(DocumentReference reference) => _$this._reference = reference;

  TrainingsRecordBuilder() {
    TrainingsRecord._initializeBuilder(this);
  }

  TrainingsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _imagePath = $v.imagePath;
      _name = $v.name;
      _instruction = $v.instruction;
      _calories = $v.calories;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TrainingsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TrainingsRecord;
  }

  @override
  void update(void Function(TrainingsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TrainingsRecord build() {
    final _$result = _$v ??
        new _$TrainingsRecord._(
            imagePath: imagePath,
            name: name,
            instruction: instruction,
            calories: calories,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
