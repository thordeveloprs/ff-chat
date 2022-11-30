import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class CustomChatFirebaseUser {
  CustomChatFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

CustomChatFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<CustomChatFirebaseUser> customChatFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<CustomChatFirebaseUser>(
      (user) {
        currentUser = CustomChatFirebaseUser(user);
        return currentUser!;
      },
    );
