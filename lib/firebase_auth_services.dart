import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign up method using email and password
  Future<User?> signUpWithEmailAndPassword(String email, String password) async {
    try {
      // Create the user with email and password
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user; // Return the user if successful
    } catch (e) {
      print("Error during signup: $e");
      return null; // Return null if there's an error
    }
  }

  // Sign in method using email and password
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      // Sign in the user with email and password
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user; // Return the user if successful
    } catch (e) {
      print("Error during sign-in: $e");
      return null; // Return null if there's an error
    }
  }

  // Sign out method
  Future<void> signOut() async {
    try {
      await _auth.signOut(); // Sign out the currently logged-in user
      print("User successfully signed out.");
    } catch (e) {
      print("Error during sign-out: $e");
    }
  }
}
