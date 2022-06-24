// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:firebase_storage/firebase_storage.dart';

Future<String> deleteImage(String imagePath) async {
  try {
    await FirebaseStorage.instance.refFromURL(imagePath).delete();
    return '';
  } catch (e) {
    return e.toString();
  }
}
