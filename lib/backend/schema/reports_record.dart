import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'reports_record.g.dart';

abstract class ReportsRecord
    implements Built<ReportsRecord, ReportsRecordBuilder> {
  static Serializer<ReportsRecord> get serializer => _$reportsRecordSerializer;

  @nullable
  DocumentReference get post;

  @nullable
  DocumentReference get user;

  @nullable
  String get reason;

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
  DocumentReference post,
  DocumentReference user,
  String reason,
}) =>
    serializers.toFirestore(
        ReportsRecord.serializer,
        ReportsRecord((r) => r
          ..post = post
          ..user = user
          ..reason = reason));
