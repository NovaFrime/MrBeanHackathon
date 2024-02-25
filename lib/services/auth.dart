import 'package:firebase_auth/firebase_auth.dart';
import 'package:mrbeanhackathon/models/user.dart';
import 'package:mrbeanhackathon/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserModel? _userFromFireBaseUser(User? user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  Stream<UserModel?> get user {
    return _auth.authStateChanges().map(_userFromFireBaseUser);
  }

  Future<UserModel?> register(
      String email, String password, String username, String phonenum) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      // Check if user is not null before accessing uid
      if (user != null) {
        // create a new document for the user with uid
        await DatabaseService(uid: user.uid).updateUserData(username, email, phonenum, 0, 0, 0);
        // logic to update user info in Firestore
        return _userFromFireBaseUser(user);
      } else {
        print("User is null");
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<UserModel?> signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      return _userFromFireBaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
