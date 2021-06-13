import 'package:firebase_auth/firebase_auth.dart';
import 'package:green_pedals/models/userdetails.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object
  UserDetails _userFromFireBase(User firebaseuser) {
    return firebaseuser != null ? UserDetails(uid: firebaseuser.uid) : null;
  }

  //auth change user stream
  Stream<UserDetails> get user {
    return _auth
        .authStateChanges()
        //.map((User user) => _userFromFireBase(user));
        .map(_userFromFireBase);
  }

  //signin anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User firebaseuser = result.user;
      return _userFromFireBase(firebaseuser);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //signin with email
  Future signInwithemail(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User firebaseuser = result.user;
      return _userFromFireBase(firebaseuser);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email
  Future signUpwithemail(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User firebaseuser = result.user;
      return _userFromFireBase(firebaseuser);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //signout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
