
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_11/services/analytics_service.dart';
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

      // adding the data to firebase-analytics
      await AnalyticsService.setUserId(user!.uid);
      await AnalyticsService.setAuthMethod("email_password");
      await AnalyticsService.logSignUp(method: "email_password");

      return user;
    } catch (e) {
      throw Exception("Sign Up Failed: $e");
    }
  }

  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      

      // after successful login keeping the track of users
      await AnalyticsService.setUserId(result.user!.uid);
      await AnalyticsService.setAuthMethod("email_password");
      await AnalyticsService.logLogin(method: "email_password");

      return result.user;
    } catch (e) {
      throw Exception("Login Failed: $e");
    }
  }


  Future<void> signOut() async {
    await _auth.signOut();

    // clearing the user data from firebase-analytics
    await AnalyticsService.clearUserId();
    await AnalyticsService.logLogout();
  }

  Stream<User?> get userChanges => _auth.authStateChanges();
}
