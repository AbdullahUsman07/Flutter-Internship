
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Signup
  Future<User?> signUp(String username,String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User? user = result.user;
      if (user != null){
        await _firestore.collection("users").doc(user.uid).set({
          "username": username,
          "email": email,
          "createdAt": DateTime.now(),
        });
      }
      return user;
    } catch (e) {
      throw Exception("Sign Up Failed: $e");
    }
  }

  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (e) {
      throw Exception("Login Failed: $e");
    }
  }


  Future<void> signOut() async {
    await _auth.signOut();
  }

  Stream<User?> get userChanges => _auth.authStateChanges();
}
