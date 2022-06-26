// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ReportsRecord> _$reportsRecordSerializer =
    new _$ReportsRecordSerializer();

class _$ReportsRecordSerializer implements StructuredSerializer<ReportsRecord> {
  @override
  final Iterable<Type> types = const [ReportsRecord, _$ReportsRecord];
  @override
  final String wireName = 'ReportsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, ReportsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.reason;
    if (value != null) {
      result
        ..add('reason')
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
    value = object.commentDocumentReference;
    if (value != null) {
      result
        ..add('commentDocumentReference')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
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
  ReportsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ReportsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'reason':
          result.reason = serializers.deserialize(value,
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
        case 'commentDocumentReference':
          result.commentDocumentReference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
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

class _$ReportsRecord extends ReportsRecord {
  @override
  final String reason;
  @override
  final DocumentReference<Object> userDocumentReference;
  @override
  final DocumentReference<Object> postDocumentReference;
  @override
  final DocumentReference<Object> commentDocumentReference;
  @override
  final DocumentReference<Object> reference;

  factory _$ReportsRecord([void Function(ReportsRecordBuilder) updates]) =>
      (new ReportsRecordBuilder()..update(updates)).build();

  _$ReportsRecord._(
      {this.reason,
      this.userDocumentReference,
      this.postDocumentReference,
      this.commentDocumentReference,
      this.reference})
      : super._();

  @override
  ReportsRecord rebuild(void Function(ReportsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReportsRecordBuilder toBuilder() => new ReportsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReportsRecord &&
        reason == other.reason &&
        userDocumentReference == other.userDocumentReference &&
        postDocumentReference == other.postDocumentReference &&
        commentDocumentReference == other.commentDocumentReference &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, reason.hashCode), userDocumentReference.hashCode),
                postDocumentReference.hashCode),
            commentDocumentReference.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ReportsRecord')
          ..add('reason', reason)
          ..add('userDocumentReference', userDocumentReference)
          ..add('postDocumentReference', postDocumentReference)
          ..add('commentDocumentReference', commentDocumentReference)
          ..add('reference', reference))
        .toString();
  }
}

class ReportsRecordBuilder
    implements Builder<ReportsRecord, ReportsRecordBuilder> {
  _$ReportsRecord _$v;

  String _reason;
  String get reason => _$this._reason;
  set reason(String reason) => _$this._reason = reason;

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

  DocumentReference<Object> _commentDocumentReference;
  DocumentReference<Object> get commentDocumentReference =>
      _$this._commentDocumentReference;
  set commentDocumentReference(
          DocumentReference<Object> commentDocumentReference) =>
      _$this._commentDocumentReference = commentDocumentReference;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  ReportsRecordBuilder() {
    ReportsRecord._initializeBuilder(this);
  }

  ReportsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _reason = $v.reason;
      _userDocumentReference = $v.userDocumentReference;
      _postDocumentReference = $v.postDocumentReference;
      _commentDocumentReference = $v.commentDocumentReference;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReportsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReportsRecord;
  }

  @override
  void update(void Function(ReportsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ReportsRecord build() {
    final _$result = _$v ??
        new _$ReportsRecord._(
            reason: reason,
            userDocumentReference: userDocumentReference,
            postDocumentReference: postDocumentReference,
            commentDocumentReference: commentDocumentReference,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
