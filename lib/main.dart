import 'package:flutter/material.dart';
import 'package:flutter_learning/authentication/without_firebase/sample.dart';
import 'package:flutter_learning/common/common.dart';
//import 'package:flutter_learning/authentication/firebase/google_signin/main.dart';
//import 'package:flutter_learning/authentication/firebase/email/main.dart';
import 'package:flutter_learning/external_app_launcher/main.dart';
import 'package:flutter_learning/slidable/main.dart';
import 'package:flutter_learning/to_do_list/main.dart';
import 'package:flutter_learning/share_outward/simple.dart';
import 'package:flutter_learning/local_notification/main.dart';
import 'package:flutter_learning/share_inward/main.dart';
import 'package:flutter_learning/local_storage/main.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          switchPageButton(context, "Common", CommonManu()),
          switchPageButton(context, "Slidable Bar", SlidablePlugin()),
          switchPageButton(
              context, "External App launcher", ExternalAppLauncher()),
          switchPageButton(context, "Local Notification", LocalNotification()),
          switchPageButton(context, "Share Inward", ShareInward()),
          switchPageButton(context, "Share Outward", SimpleShareOutward()),
          switchPageButton(
              context, "Sign in without Firebase", SigninWithoutFirebase()),
          switchPageButton(context, "Local Storage", LocalStoragePlugin()),
          switchPageButton(context, "ToDo List Plugin", ToDoListPlugin()),

          //need to be fixed
          /*
          ElevatedButton(
              child: Text("Authentication"),
              onPressed: () =>
                  AuthenticationPlugin()), //Dont Abstract this Button
          ElevatedButton(
              child: Text("Google Signin Plugin"),
              onPressed: () => GoogleSigninPlugin()),
          */
        ],
      ),
    );
  }
}

//Template of ElevatedButton for switching pages
ElevatedButton switchPageButton(
    BuildContext context, String buttonText, Widget page) {
  return ElevatedButton(
    child: Text(buttonText),
    onPressed: () {
      debugPrint("Clicked " + buttonText + "Button");
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    },
  );
}
