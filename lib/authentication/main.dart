import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_learning/authentication/service.dart';
import 'package:flutter_learning/main.dart';

void main() => AuthenticationPlugin();

// ignore: non_constant_identifier_names
void AuthenticationPlugin() async {
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
      appBar: AppBar(title: Text('Authentication Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
                      try {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        setState(() {});
                      } catch (e) {
                        debugPrint("Sign up failed");
                      }
                    }),

                //Button for Signning In
                ElevatedButton(
                  child: Text('Sign In'),
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                      setState(() {});
                    } catch (e) {
                      debugPrint("Sign in failed");
                    }
                  },
                ),

                //Button for moving back to Home Page
                ElevatedButton(
                    onPressed: () => {runApp(MainApp())},
                    child: Text("Back to Home Page"))
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //Content of Home Page
          Text("Logged In Sucessfully!"),

          //Button for signning out
          ElevatedButton(
            onPressed: () async {
              try {
                await AuthenticationService.instance.signOut();
              } catch (e) {
                debugPrint("Sign out failed");
              }
            },
            child: Text('Sign out'),
          ),

          //Button for moving back to Home Page
          ElevatedButton(
              onPressed: () => {runApp(MainApp())},
              child: Text("Back to Home Page"))
        ],
      )),
    );
  }
}
