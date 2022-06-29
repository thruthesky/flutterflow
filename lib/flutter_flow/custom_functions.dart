import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

String completePhoneNumber(String phoneNumber) {
  if (phoneNumber == null) return '';
  phoneNumber = phoneNumber.trim();

  // 전화 번호에서 공백과 하이픈(-)을 제거함.
  phoneNumber = phoneNumber.trim().replaceAll('-', '').replaceAll(' ', '');

  // 전화 번호 앞자리가 + 로 시작하면 그냥 통과.
  if (phoneNumber.startsWith('+')) return phoneNumber;

  // 앞 자리 0을 제거.
  int number = int.tryParse(phoneNumber) ?? 0;

  // 전화 번호에서 숫자만 가져와 10자리 숫자 (앞에 0 빼고, 10 1234 5678) 이어야 올바른 전화 번호.
  phoneNumber = number.toString();

  return "+82$phoneNumber";
}

String likeText(List<DocumentReference> likes) {
  final count = likes?.length ?? 0;
  if (count == 0) {
    return "좋아요";
  } else {
    return "좋아요($count)";
  }
}

bool isCorrectPhoneNumber(String phoneNumber) {
  if (phoneNumber == null) return false;
  phoneNumber = phoneNumber.trim();

  // 전화 번호 앞자리가 + 로 시작하면 그냥 통과.
  if (phoneNumber.startsWith('+')) return true;

  // 전화 번호에서 공백과 하이픈(-)을 제거함.
  phoneNumber = phoneNumber.trim().replaceAll('-', '').replaceAll(' ', '');

  // 앞 자리 0을 제거.
  int number = int.tryParse(phoneNumber);
  if (number == null) return false;

  // 전화 번호에서 숫자만 가져와 10자리 숫자 (앞에 0 빼고, 10 1234 5678) 이어야 올바른 전화 번호.
  phoneNumber = number.toString();

  return phoneNumber.length == 10;
}

bool hasTemporaryImages(List<String> images) {
  return (images?.length ?? 0) > 0;
}

bool hasPostPhoto(PostsRecord post) {
  return (post?.images?.length ?? 0) > 0;
}

String oneLineString(String text) {
  if (text == null) return "";
  return text.replaceAll("\n", " ").replaceAll("\r", "");
}

String firstImageOfFirstPost(List<PostsRecord> posts) {
  if (posts == null || posts.isEmpty) return '';
  return posts[0].images?.first ?? '';
}

PostsRecord firstPost(List<PostsRecord> posts) {
  return posts.first;
}

bool isListImagePathEmpty(List<String> paths) {
  return paths.isEmpty;
}

String firstImageOfPost(PostsRecord post) {
  return post.images?.first ?? '';
}

String getCommentOrder(
  int noOfComments,
  String order,
  int depth,
) {
  noOfComments ??= 0;
  order ??= "";
  print("noOfComments: $noOfComments, order: $order, depth: $depth");
  if (order == "" || depth == 0) {
    final firstPart = 100000 + noOfComments;
    return '$firstPart.1000.1000.1000.1000.1000.1000.1000.1000.1000';
  } else {
    List<String> parts = order.split('.');
    String el = parts[depth];
    int computed =
        int.parse(el) + noOfComments + 1; // 처음이 0일 수 있다. 0이면, 부모와 같아서 안됨.
    parts[depth] = computed.toString();
    order = parts.join('.');
    return order;
  }
}

String emptyImagePathString() {
  return "";
}

String emptyString() {
  return "";
}

bool hasComments(PostsRecord post) {
  return (post.noOfComments ?? 0) > 0;
}

int increaseInteger(int no) {
  return (no ?? 0) + 1;
}

double indentComment(int no) {
  if (no == null) return 0;
  if (no == 0 || no == 1) {
    return 0;
  } else if (no == 2) {
    return 32;
  } else if (no == 3) {
    return 64;
  } else if (no == 4) {
    return 80;
  } else if (no == 5) {
    return 96;
  } else if (no == 6) {
    return 106;
  } else {
    return 112;
  }
}

bool postHasValue(PostsRecord post) {
  print('isPostNull() post: $post');
  return post != null;
}

bool isCommentEmpty(CommentsRecord comment) {
  return comment == null;
}

String getCommentContent(CommentsRecord commentDocument) {
  return commentDocument?.content ?? "";
}

bool hasCommnetFiles(CommentsRecord comment) {
  if (comment == null) return false;
  if (comment.images == null) return false;
  if (comment.images.isEmpty) return false;
  return true;
}

bool hasSearchResults(dynamic documents) {
  print('documents; $documents');
  if (documents == null) return false;
  if (documents is Map) {
    if (documents['found'] == null) return false;
    if (documents['found'] == 0) return false;
    return true;
  } else {
    return false;
  }
}

bool isSearchPost(dynamic search) {
  if (search == null || search['document'] == null) return false;
  return search['document']['category'] != null;
}

DocumentReference getPostDocumentReferenceFromSearch(String id) {
  return FirebaseFirestore.instance.doc("/posts/$id");
}

DocumentReference getCommentReferenceFromSearch(String id) {
  return FirebaseFirestore.instance.doc("/comments/$id");
}
