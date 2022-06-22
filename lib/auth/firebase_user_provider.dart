import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class FlutterFlowKoreaDevCommunityFirebaseUser {
  FlutterFlowKoreaDevCommunityFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

FlutterFlowKoreaDevCommunityFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<FlutterFlowKoreaDevCommunityFirebaseUser>
    flutterFlowKoreaDevCommunityFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<FlutterFlowKoreaDevCommunityFirebaseUser>((user) =>
            currentUser = FlutterFlowKoreaDevCommunityFirebaseUser(user));
