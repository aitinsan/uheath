import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'trainings_record.g.dart';

abstract class TrainingsRecord
    implements Built<TrainingsRecord, TrainingsRecordBuilder> {
  static Serializer<TrainingsRecord> get serializer =>
      _$trainingsRecordSerializer;

  @nullable
  String get imagePath;

  @nullable
  String get name;

  @nullable
  String get instruction;

  @nullable
  double get calories;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TrainingsRecordBuilder builder) => builder
    ..imagePath = ''
    ..name = ''
    ..instruction = ''
    ..calories = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('trainings');

  static Stream<TrainingsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  TrainingsRecord._();
  factory TrainingsRecord([void Function(TrainingsRecordBuilder) updates]) =
      _$TrainingsRecord;
}

Map<String, dynamic> createTrainingsRecordData({
  String imagePath,
  String name,
  String instruction,
  double calories,
}) =>
    serializers.serializeWith(
        TrainingsRecord.serializer,
        TrainingsRecord((t) => t
          ..imagePath = imagePath
          ..name = name
          ..instruction = instruction
          ..calories = calories));

TrainingsRecord get dummyTrainingsRecord {
  final builder = TrainingsRecordBuilder()
    ..imagePath = dummyImagePath
    ..name = dummyString
    ..instruction = dummyString
    ..calories = dummyDouble;
  return builder.build();
}

List<TrainingsRecord> createDummyTrainingsRecord({int count}) =>
    List.generate(count, (_) => dummyTrainingsRecord);
