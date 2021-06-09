import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'meals_record.g.dart';

abstract class MealsRecord implements Built<MealsRecord, MealsRecordBuilder> {
  static Serializer<MealsRecord> get serializer => _$mealsRecordSerializer;

  @nullable
  String get mealTime;

  @nullable
  String get name;

  @nullable
  String get timeTaken;

  @nullable
  String get preparation;

  @nullable
  String get imagePath;

  @nullable
  double get calories;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(MealsRecordBuilder builder) => builder
    ..mealTime = ''
    ..name = ''
    ..timeTaken = ''
    ..preparation = ''
    ..imagePath = ''
    ..calories = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('meals');

  static Stream<MealsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  MealsRecord._();
  factory MealsRecord([void Function(MealsRecordBuilder) updates]) =
      _$MealsRecord;
}

Map<String, dynamic> createMealsRecordData({
  String mealTime,
  String name,
  String timeTaken,
  String preparation,
  String imagePath,
  double calories,
}) =>
    serializers.serializeWith(
        MealsRecord.serializer,
        MealsRecord((m) => m
          ..mealTime = mealTime
          ..name = name
          ..timeTaken = timeTaken
          ..preparation = preparation
          ..imagePath = imagePath
          ..calories = calories));

MealsRecord get dummyMealsRecord {
  final builder = MealsRecordBuilder()
    ..mealTime = dummyString
    ..name = dummyString
    ..timeTaken = dummyString
    ..preparation = dummyString
    ..imagePath = dummyImagePath
    ..calories = dummyDouble;
  return builder.build();
}

List<MealsRecord> createDummyMealsRecord({int count}) =>
    List.generate(count, (_) => dummyMealsRecord);
