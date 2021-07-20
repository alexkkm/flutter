import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_learning/authentication/service.dart';
import 'package:flutter_learning/main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

void main() => GoogleSigninPlugin();

// ignore: non_constant_identifier_names
void GoogleSigninPlugin() async {
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
          return isSignedIn ? HomePage() : GoogleSigninPage();
        },
      ),
    ),
  );
}

class GoogleSigninPage extends StatefulWidget {
  const GoogleSigninPage({Key? key}) : super(key: key);

  @override
  _GoogleSigninPageState createState() => _GoogleSigninPageState();
}

class _GoogleSigninPageState extends State<GoogleSigninPage> {
  bool isSigningIn = false;
  final googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Google Sign Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //Button for signning in with Google account
                SignInButton(
                  Buttons.Google,
                  onPressed: () async {
                    //function for sign in with Google account
                    isSigningIn = true;
                    try {
                      final user = await googleSignIn.signIn();
                      if (user == null) {
                        isSigningIn = false;
                        return;
                      } else {
                        final googleAuth = await user.authentication;
                        final credential = GoogleAuthProvider.credential(
                          accessToken: googleAuth.accessToken,
                          idToken: googleAuth.idToken,
                        );
                        await FirebaseAuth.instance
                            .signInWithCredential(credential);
                        isSigningIn = false;
                      }
                    } catch (e) {
                      debugPrint("Signin with Google failed");
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
  final googleSignIn = GoogleSignIn();
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

          //Button for Signning Out
          ElevatedButton(
            onPressed: () async {
              await googleSignIn.disconnect();
              FirebaseAuth.instance.signOut();
            },
            child: Text('Sign out Google Account'),
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
