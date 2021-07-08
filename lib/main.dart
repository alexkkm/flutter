import 'package:flutter/material.dart';
import 'package:flutter_learning/common/tutorial_documents/tutorial.dart';
import 'package:flutter_learning/external_app_launcher/main.dart';
import 'package:flutter_learning/share_outward/simple.dart';
import 'package:flutter_learning/local_notification/main.dart';
import 'package:flutter_learning/share_inward/main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          switchPage(context, "Tutorial Documents", TutorialDocument()),
          switchPage(context, "External app launcher", ExternalAppLauncher()),
          switchPage(context, "Local Notification", LocalNotification()),
          switchPage(context, "Share Inward", ShareInward()),
          switchPage(context, "Share Outward", SimpleShareOutward()),
        ],
      ),
    );
  }
}

ElevatedButton switchPage(
    BuildContext context, String buttonText, Widget page) {
  return ElevatedButton(
    child: Text(buttonText),
    onPressed: () {
      debugPrint("Clicked" + buttonText + "Button");
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    },
  );
}
