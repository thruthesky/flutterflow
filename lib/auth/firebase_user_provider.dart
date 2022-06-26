import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class NoCodeStudyFirebaseUser {
  NoCodeStudyFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

NoCodeStudyFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<NoCodeStudyFirebaseUser> noCodeStudyFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<NoCodeStudyFirebaseUser>(
        (user) => currentUser = NoCodeStudyFirebaseUser(user));
