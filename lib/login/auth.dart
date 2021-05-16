import 'package:firebase_auth/firebase_auth.dart';
import 'package:projekt_prj/database.dart';
import 'package:projekt_prj/login/models/user.dart';

String errorMessage = "Přihlášení";

class AuthenticationService{


  //firebase Authentication reference
  final FirebaseAuth _auth = FirebaseAuth.instance;


  //a way of getting user id
  GetUser _userFromFirebaseUser(User user) {
    return user != null ? GetUser(uid: user.uid) : null;
  }


  //streams
  Stream<User> get authStateChange => _auth.authStateChanges();

  Stream<GetUser> get user {
    return _auth.authStateChanges()
        .map(_userFromFirebaseUser);
  }


  //sign out
  Future<void> signOut() async {
    try{

      return await _auth.signOut();

    }catch(e){
      print(e.toString());
      return null;
    }

  }


  //sign in
  Future signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;

      DatabaseService(uid: user.uid);

      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }


  //sign up / registration
  Future signUp(String email, String password, String name, String surname) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;

      await DatabaseService(uid: user.uid).addUser(name, surname);

      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

}