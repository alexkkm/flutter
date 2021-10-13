import 'package:firebase_auth/firebase_auth.dart';

//Define AuthenticationService for Firebase Authentication functions
class AuthenticationService {
  static final instance = AuthenticationService._();
  AuthenticationService._();

  bool get isSignedIn => FirebaseAuth.instance.currentUser != null;

  Stream<User?> authStateChange() => FirebaseAuth.instance.authStateChanges();

  Future<void> signIn({required String email, required String password}) =>
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

  Future<void> signOut() => FirebaseAuth.instance.signOut();
}
