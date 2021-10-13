import 'package:flutter/material.dart';
import 'package:flutter_learning/Authentication/Firebase/Email/EmailAuthentication.dart';
import 'package:flutter_learning/Authentication/Firebase/GoogleSignin/GoogleSignin.dart';
import 'package:flutter_learning/Authentication/WithoutFirebase/sample.dart';
import 'package:flutter_learning/Common/Common.dart';
import 'package:flutter_learning/ExternalAppLauncher/ExternalAppLauncher.dart';
import 'package:flutter_learning/LocalNotification/LocalNotification.dart';
import 'package:flutter_learning/LocalStorage/LocalStorage.dart';
import 'package:flutter_learning/Project/Project.dart';
import 'package:flutter_learning/Slidable/Slidable.dart';
import 'package:flutter_learning/ToDoList/ToDoList.dart';

import 'ShareInward/ShareInward.dart';
import 'ShareOutward/SimpleShareOutward.dart';

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
          switchPageButton(context, "Projects", ProjectPage()),

          ElevatedButton(
              child: Text("Authentication"),
              onPressed: () =>
                  AuthenticationPlugin()), //Dont Abstract this Button
          ElevatedButton(
              child: Text("Google Signin Plugin"),
              onPressed: () => GoogleSigninPlugin()),
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
