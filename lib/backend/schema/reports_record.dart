import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'reports_record.g.dart';

abstract class ReportsRecord
    implements Built<ReportsRecord, ReportsRecordBuilder> {
  static Serializer<ReportsRecord> get serializer => _$reportsRecordSerializer;

  @nullable
  String get reason;

  @nullable
  DocumentReference get userDocumentReference;

  @nullable
  DocumentReference get postDocumentReference;

  @nullable
  DocumentReference get commentDocumentReference;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ReportsRecordBuilder builder) =>
      builder..reason = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reports');

  static Stream<ReportsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ReportsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ReportsRecord._();
  factory ReportsRecord([void Function(ReportsRecordBuilder) updates]) =
      _$ReportsRecord;

  static ReportsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createReportsRecordData({
  String reason,
  DocumentReference userDocumentReference,
  DocumentReference postDocumentReference,
  DocumentReference commentDocumentReference,
}) =>
    serializers.toFirestore(
        ReportsRecord.serializer,
        ReportsRecord((r) => r
          ..reason = reason
          ..userDocumentReference = userDocumentReference
          ..postDocumentReference = postDocumentReference
          ..commentDocumentReference = commentDocumentReference));
