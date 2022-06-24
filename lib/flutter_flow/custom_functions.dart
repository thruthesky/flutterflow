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
  phoneNumber = phoneNumber.trim();

  // 전화 번호에서 공백과 하이픈(-)을 제거함.
  phoneNumber = phoneNumber.trim().replaceAll('-', '').replaceAll(' ', '');

  // 전화 번호 앞자리가 + 로 시작하면 그냥 통과.
  if (phoneNumber.startsWith('+')) return phoneNumber;

  // 앞 자리 0을 제거.
  int number = int.tryParse(phoneNumber);

  // 전화 번호에서 숫자만 가져와 10자리 숫자 (앞에 0 빼고, 10 1234 5678) 이어야 올바른 전화 번호.
  phoneNumber = number.toString();

  return "+82" + phoneNumber;
}

String likeText(PostsRecord post) {
  final count = post.likes.length;
  if (count == 0) {
    return "좋아요";
  } else {
    return "좋아요($count)";
  }
}

bool isCorrectPhoneNumber(String phoneNumber) {
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
  return images.length > 0;
}

bool hasPostPhoto(PostsRecord post) {
  return post.images.length > 0;
}

String oneLineString(String text) {
  return text.replaceAll("\n", " ").replaceAll("\r", "");
}

String firstImageOfFirstPost(List<PostsRecord> posts) {
  if (posts == null || posts.isEmpty) return '';
  if (posts[0].images == null || posts[0].images.isEmpty) return '';
  return posts[0].images.first;
}

PostsRecord firstPost(List<PostsRecord> posts) {
  return posts[0];
}

bool isListImagePathEmpty(List<String> paths) {
  return paths.isEmpty;
}

String firstImageOfPost(PostsRecord post) {
  if (post == null || post.images == null || post.images.isEmpty) {
    return '';
  } else {
    return post.images.first;
  }
}

String getCommentOrderFromNoOfComments(int noOfComments) {
  final firstPart = 100000 + noOfComments;
  return '$firstPart.1000.1000.1000.1000.1000.1000.1000.1000.1000';
}

String emptyImagePathString() {
  return "";
}
