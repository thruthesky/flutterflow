import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'posts_record.g.dart';

abstract class PostsRecord implements Built<PostsRecord, PostsRecordBuilder> {
  static Serializer<PostsRecord> get serializer => _$postsRecordSerializer;

  @nullable
  String get title;

  @nullable
  DocumentReference get userDocumentReference;

  @nullable
  DateTime get timestamp;

  @nullable
  BuiltList<DocumentReference> get likes;

  @nullable
  BuiltList<String> get images;

  @nullable
  String get category;

  @nullable
  bool get hasPhoto;

  @nullable
  int get noOfComments;

  @nullable
  String get content;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PostsRecordBuilder builder) => builder
    ..title = ''
    ..likes = ListBuilder()
    ..images = ListBuilder()
    ..category = ''
    ..hasPhoto = false
    ..noOfComments = 0
    ..content = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<PostsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PostsRecord._();
  factory PostsRecord([void Function(PostsRecordBuilder) updates]) =
      _$PostsRecord;

  static PostsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPostsRecordData({
  String title,
  DocumentReference userDocumentReference,
  DateTime timestamp,
  String category,
  bool hasPhoto,
  int noOfComments,
  String content,
}) =>
    serializers.toFirestore(
        PostsRecord.serializer,
        PostsRecord((p) => p
          ..title = title
          ..userDocumentReference = userDocumentReference
          ..timestamp = timestamp
          ..likes = null
          ..images = null
          ..category = category
          ..hasPhoto = hasPhoto
          ..noOfComments = noOfComments
          ..content = content));
