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

String completePhoneNumber(String userPhoneNumber) {
  if (userPhoneNumber.startsWith('+')) return userPhoneNumber;
  userPhoneNumber =
      userPhoneNumber.trim().replaceAll('-', '').replaceAll(' ', '');
  return "+82" + int.parse(userPhoneNumber).toString();
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
  phoneNumber = phoneNumber.trim().replaceAll('-', '').replaceAll(' ', '');
  if (int.tryParse(phoneNumber) == null) return false;
  return phoneNumber.length > 9;
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
