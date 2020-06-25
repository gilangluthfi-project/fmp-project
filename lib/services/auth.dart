import 'package:firebase_auth/firebase_auth.dart';
import 'package:inline/models/user.dart';

class AuthService {
  //firebase instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebase(FirebaseUser user) {
    return user != null ? User(userId: user.uid) : null;
  }

  //User SignIn
  Future userSignIn(String email, String password) async {
    try {
      AuthResult authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser firebaseUser = authResult.user;
      return _userFromFirebase(firebaseUser);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //User SignUp
  Future userSignUp(String email, String password) async {
    try {
      AuthResult authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser firebaseUser = authResult.user;
      return _userFromFirebase(firebaseUser);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //User reset password
  Future resetPassword(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //User SignOut
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //User SignAnon
  Future signAnon() async {
    try {
      AuthResult authResult = await _auth.signInAnonymously();
      FirebaseUser user = authResult.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map((FirebaseUser user) => _userFromFirebase(user));
  }

  // Future currentUser() {
  //   try {
  //     AuthResult authResult = await _auth.currentUser();
  //     FirebaseUser user = authResult.user;
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  // }
}
