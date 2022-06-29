// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CommentsRecord> _$commentsRecordSerializer =
    new _$CommentsRecordSerializer();

class _$CommentsRecordSerializer
    implements StructuredSerializer<CommentsRecord> {
  @override
  final Iterable<Type> types = const [CommentsRecord, _$CommentsRecord];
  @override
  final String wireName = 'CommentsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, CommentsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.content;
    if (value != null) {
      result
        ..add('content')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userDocumentReference;
    if (value != null) {
      result
        ..add('userDocumentReference')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.postDocumentReference;
    if (value != null) {
      result
        ..add('postDocumentReference')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('createdAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.order;
    if (value != null) {
      result
        ..add('order')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.depth;
    if (value != null) {
      result
        ..add('depth')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.noOfComments;
    if (value != null) {
      result
        ..add('noOfComments')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.likes;
    if (value != null) {
      result
        ..add('likes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(DocumentReference, const [const FullType(Object)])
            ])));
    }
    value = object.images;
    if (value != null) {
      result
        ..add('images')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  CommentsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CommentsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'content':
          result.content = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'userDocumentReference':
          result.userDocumentReference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'postDocumentReference':
          result.postDocumentReference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'order':
          result.order = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'depth':
          result.depth = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'noOfComments':
          result.noOfComments = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'likes':
          result.likes.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType(Object)])
              ])) as BuiltList<Object>);
          break;
        case 'images':
          result.images.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$CommentsRecord extends CommentsRecord {
  @override
  final String content;
  @override
  final DocumentReference<Object> userDocumentReference;
  @override
  final DocumentReference<Object> postDocumentReference;
  @override
  final DateTime createdAt;
  @override
  final String order;
  @override
  final int depth;
  @override
  final int noOfComments;
  @override
  final BuiltList<DocumentReference<Object>> likes;
  @override
  final BuiltList<String> images;
  @override
  final DocumentReference<Object> reference;

  factory _$CommentsRecord([void Function(CommentsRecordBuilder) updates]) =>
      (new CommentsRecordBuilder()..update(updates)).build();

  _$CommentsRecord._(
      {this.content,
      this.userDocumentReference,
      this.postDocumentReference,
      this.createdAt,
      this.order,
      this.depth,
      this.noOfComments,
      this.likes,
      this.images,
      this.reference})
      : super._();

  @override
  CommentsRecord rebuild(void Function(CommentsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommentsRecordBuilder toBuilder() =>
      new CommentsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CommentsRecord &&
        content == other.content &&
        userDocumentReference == other.userDocumentReference &&
        postDocumentReference == other.postDocumentReference &&
        createdAt == other.createdAt &&
        order == other.order &&
        depth == other.depth &&
        noOfComments == other.noOfComments &&
        likes == other.likes &&
        images == other.images &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc(0, content.hashCode),
                                        userDocumentReference.hashCode),
                                    postDocumentReference.hashCode),
                                createdAt.hashCode),
                            order.hashCode),
                        depth.hashCode),
                    noOfComments.hashCode),
                likes.hashCode),
            images.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CommentsRecord')
          ..add('content', content)
          ..add('userDocumentReference', userDocumentReference)
          ..add('postDocumentReference', postDocumentReference)
          ..add('createdAt', createdAt)
          ..add('order', order)
          ..add('depth', depth)
          ..add('noOfComments', noOfComments)
          ..add('likes', likes)
          ..add('images', images)
          ..add('reference', reference))
        .toString();
  }
}

class CommentsRecordBuilder
    implements Builder<CommentsRecord, CommentsRecordBuilder> {
  _$CommentsRecord _$v;

  String _content;
  String get content => _$this._content;
  set content(String content) => _$this._content = content;

  DocumentReference<Object> _userDocumentReference;
  DocumentReference<Object> get userDocumentReference =>
      _$this._userDocumentReference;
  set userDocumentReference(DocumentReference<Object> userDocumentReference) =>
      _$this._userDocumentReference = userDocumentReference;

  DocumentReference<Object> _postDocumentReference;
  DocumentReference<Object> get postDocumentReference =>
      _$this._postDocumentReference;
  set postDocumentReference(DocumentReference<Object> postDocumentReference) =>
      _$this._postDocumentReference = postDocumentReference;

  DateTime _createdAt;
  DateTime get createdAt => _$this._createdAt;
  set createdAt(DateTime createdAt) => _$this._createdAt = createdAt;

  String _order;
  String get order => _$this._order;
  set order(String order) => _$this._order = order;

  int _depth;
  int get depth => _$this._depth;
  set depth(int depth) => _$this._depth = depth;

  int _noOfComments;
  int get noOfComments => _$this._noOfComments;
  set noOfComments(int noOfComments) => _$this._noOfComments = noOfComments;

  ListBuilder<DocumentReference<Object>> _likes;
  ListBuilder<DocumentReference<Object>> get likes =>
      _$this._likes ??= new ListBuilder<DocumentReference<Object>>();
  set likes(ListBuilder<DocumentReference<Object>> likes) =>
      _$this._likes = likes;

  ListBuilder<String> _images;
  ListBuilder<String> get images =>
      _$this._images ??= new ListBuilder<String>();
  set images(ListBuilder<String> images) => _$this._images = images;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  CommentsRecordBuilder() {
    CommentsRecord._initializeBuilder(this);
  }

  CommentsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _content = $v.content;
      _userDocumentReference = $v.userDocumentReference;
      _postDocumentReference = $v.postDocumentReference;
      _createdAt = $v.createdAt;
      _order = $v.order;
      _depth = $v.depth;
      _noOfComments = $v.noOfComments;
      _likes = $v.likes?.toBuilder();
      _images = $v.images?.toBuilder();
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CommentsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CommentsRecord;
  }

  @override
  void update(void Function(CommentsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CommentsRecord build() {
    _$CommentsRecord _$result;
    try {
      _$result = _$v ??
          new _$CommentsRecord._(
              content: content,
              userDocumentReference: userDocumentReference,
              postDocumentReference: postDocumentReference,
              createdAt: createdAt,
              order: order,
              depth: depth,
              noOfComments: noOfComments,
              likes: _likes?.build(),
              images: _images?.build(),
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'likes';
        _likes?.build();
        _$failedField = 'images';
        _images?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CommentsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
