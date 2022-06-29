import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    setState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.white,
          child: Center(
            child: Builder(
              builder: (context) => Image.asset(
                'assets/images/AppIcon4.png',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'EntryScreen': (data) async => EntryScreenWidget(),
  'SignInScreen': (data) async => SignInScreenWidget(),
  'SmsCodeSendScreen': (data) async => SmsCodeSendScreenWidget(
        phoneNumber: getParameter(data, 'phoneNumber'),
      ),
  'SmsCodeScreen': (data) async => SmsCodeScreenWidget(),
  'PostListScreen': (data) async => PostListScreenWidget(
        category: getParameter(data, 'category'),
      ),
  'PostCreateScreen': (data) async => PostCreateScreenWidget(
        category: getParameter(data, 'category'),
      ),
  'PostEditScreen': (data) async => PostEditScreenWidget(
        postReference: getParameter(data, 'postReference'),
      ),
  'PostViewScreen': (data) async => PostViewScreenWidget(
        postReference: getParameter(data, 'postReference'),
      ),
  'MyPostListScreen': (data) async => MyPostListScreenWidget(),
  'ForumSearchScreen': (data) async => ForumSearchScreenWidget(
        word: getParameter(data, 'word'),
      ),
  'OtherUserProfileScreen': (data) async => OtherUserProfileScreenWidget(
        userDocumentReference: getParameter(data, 'userDocumentReference'),
      ),
  'UserBlockListScreen': (data) async => UserBlockListScreenWidget(),
  'ProfileScreen': (data) async => ProfileScreenWidget(),
  'UserLicenseAgreementScreen': (data) async =>
      UserLicenseAgreementScreenWidget(),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
