import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'comments_record.g.dart';

abstract class CommentsRecord
    implements Built<CommentsRecord, CommentsRecordBuilder> {
  static Serializer<CommentsRecord> get serializer =>
      _$commentsRecordSerializer;

  @nullable
  String get content;

  @nullable
  DocumentReference get userDocumentReference;

  @nullable
  DocumentReference get postDocumentReference;

  @nullable
  DateTime get createdAt;

  @nullable
  String get order;

  @nullable
  int get depth;

  @nullable
  int get noOfComments;

  @nullable
  BuiltList<DocumentReference> get likes;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CommentsRecordBuilder builder) => builder
    ..content = ''
    ..order = ''
    ..depth = 0
    ..noOfComments = 0
    ..likes = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('comments');

  static Stream<CommentsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<CommentsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  CommentsRecord._();
  factory CommentsRecord([void Function(CommentsRecordBuilder) updates]) =
      _$CommentsRecord;

  static CommentsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCommentsRecordData({
  String content,
  DocumentReference userDocumentReference,
  DocumentReference postDocumentReference,
  DateTime createdAt,
  String order,
  int depth,
  int noOfComments,
}) =>
    serializers.toFirestore(
        CommentsRecord.serializer,
        CommentsRecord((c) => c
          ..content = content
          ..userDocumentReference = userDocumentReference
          ..postDocumentReference = postDocumentReference
          ..createdAt = createdAt
          ..order = order
          ..depth = depth
          ..noOfComments = noOfComments
          ..likes = null));
