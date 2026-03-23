import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  /// sign up
  static Future<String> signUp({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "Signup successful";
    } on FirebaseAuthException catch (e) {
      return _handleAuthError(e);
    } catch (e) {
      return "Something went wrong";
    }
  }

  /// login
  static Future<String> login({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "Login successful";
    } on FirebaseAuthException catch (e) {
      return _handleAuthError(e);
    } catch (e) {
      return "Something went wrong";
    }
  }

  /// log out
  static Future<void> logout() async {
    await _auth.signOut();
  }

  /// current user
  static User? getCurrentUser() {
    return _auth.currentUser;
  }

  /// error handler
  static String _handleAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return "Email already in use";
      case 'invalid-email':
        return "Invalid email";
      case 'weak-password':
        return "Password is too weak";
      case 'user-not-found':
        return "User not found";
      case 'wrong-password':
        return "Incorrect password";
      default:
        return "Authentication error";
    }
  }
}
