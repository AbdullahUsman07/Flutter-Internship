import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  static final _googleSignIn = GoogleSignIn();
  static final _auth = FirebaseAuth.instance;
  static final _firestore = FirebaseFirestore.instance;

  static Future<User?> signInWithGoogle() async {
    try {

      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null; 
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

    
      final userCredential = await _auth.signInWithCredential(credential);
      final user = userCredential.user;

     
      if (user != null) {
        final userDoc = _firestore.collection("users").doc(user.uid);
        final docSnapshot = await userDoc.get();

        if (!docSnapshot.exists) {
          await userDoc.set({
            "username": user.displayName ?? "Google User",
            "email": user.email,
            "createdAt": DateTime.now(),
          });
        }
      }

      return user;
    } catch (e) {
      print("Google Sign-In failed: $e");
      return null;
    }
  }

  static Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
