import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class NoCodeDevGroupFirebaseUser {
  NoCodeDevGroupFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

NoCodeDevGroupFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<NoCodeDevGroupFirebaseUser> noCodeDevGroupFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<NoCodeDevGroupFirebaseUser>(
            (user) => currentUser = NoCodeDevGroupFirebaseUser(user));
