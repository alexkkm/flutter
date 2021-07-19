import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_learning/authentication/service.dart';

void main() async {
  //initialize the Firebase Setting
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //If already signed in, route to HomePage directly
  //If not, route to Authentication Page
  runApp(
    MaterialApp(
      title: "Flutter",
      home: StreamBuilder<User?>(
        stream: AuthenticationService.instance.authStateChange(),
        builder: (_, snapshot) {
          final isSignedIn = snapshot.data != null;
          return isSignedIn ? HomePage() : AuthenticationPage();
        },
      ),
    ),
  );
}

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AuthenticationPage')),
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
                obscureText: true, //Blur the inputing password
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
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomePage')),
      body: Center(
          child: Column(
        children: <Widget>[
          Text("Logged In Sucessfully!"),
          ElevatedButton(
            onPressed: () => AuthenticationService.instance.signOut(),
            child: Text('Sign out'),
          ),
        ],
      )),
    );
  }
}
