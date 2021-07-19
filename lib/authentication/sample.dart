import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      home: StreamBuilder<User?>(
        stream: Auth.instance.authStateChange(),
        builder: (_, snapshot) {
          final isSignedIn = snapshot.data != null;
          return isSignedIn ? HomePage() : LoginPage();
        },
      ),
    ),
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomePage')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Auth.instance.signOut(),
          child: Text('Sign out'),
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LoginPage')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Auth.instance
              .signIn(email: 'test@test.com', password: 'test1234'),
          child: Text('Sign in'),
        ),
      ),
    );
  }
}

class Auth {
  static final instance = Auth._();
  Auth._();

  bool get isSignedIn => FirebaseAuth.instance.currentUser != null;

  Stream<User?> authStateChange() => FirebaseAuth.instance.authStateChanges();

  Future<void> signIn({required String email, required String password}) =>
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

  Future<void> signOut() => FirebaseAuth.instance.signOut();
}
