import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(AuthenticationPlugin());
}

class AuthenticationPlugin extends StatefulWidget {
  const AuthenticationPlugin({Key? key}) : super(key: key);

  @override
  _AuthenticationPluginState createState() => _AuthenticationPluginState();
}

class _AuthenticationPluginState extends State<AuthenticationPlugin> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return MaterialApp(
      title: "Flutter",
      home: Scaffold(
        appBar: AppBar(
          title:
              Text('Auth User (Logged ' + (user == null ? 'out' : 'in') + ')'),
        ),
        body: Center(
          child: Column(
            children: [
              //TextField for inputting email address
              TextField(
                  decoration: InputDecoration(hintText: "Email"),
                  controller: emailController),
              //TextField for inputting password
              TextField(
                  decoration: InputDecoration(hintText: "Password"),
                  //Blur the inputing password
                  obscureText: true,
                  controller: passwordController),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //Button for Signning Up
                  ElevatedButton(
                      child: Text('Sign Up'),
                      onPressed: () async {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        setState(() {});
                      }),
                  //Button for Signning In
                  ElevatedButton(
                    child: Text('Sign In'),
                    onPressed: () async {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                      setState(() {});
                    },
                  ),
                  //Button for Signning Out
                  ElevatedButton(
                    child: Text('Log Out'),
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      setState(() {});
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
