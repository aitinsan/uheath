import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class Uhealth2FirebaseUser {
  Uhealth2FirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

Uhealth2FirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<Uhealth2FirebaseUser> uhealth2FirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<Uhealth2FirebaseUser>(
            (user) => currentUser = Uhealth2FirebaseUser(user));
