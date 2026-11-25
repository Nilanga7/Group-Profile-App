import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  Stream<User?> authStateChanges() => _auth.authStateChanges();

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}

String authErrorMessage(FirebaseAuthException e) {
  switch (e.code) {
    case 'invalid-email':
      return 'The email address is not valid.';
    case 'user-disabled':
      return 'This account has been disabled. Contact the administrator.';
    case 'invalid-credential':
    case 'user-not-found':
    case 'wrong-password':
      return 'Incorrect email or password.';
    case 'operation-not-allowed':
      return 'Email/Password sign-in is not enabled in Firebase.';
    case 'too-many-requests':
      return 'Too many attempts. Please wait a moment and try again.';
    case 'network-request-failed':
      return 'No internet connection. Check your network and try again.';
    default:
      return 'Something went wrong (${e.code}). Please try again.';
  }
}
