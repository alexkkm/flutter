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
          switchPageButton(context, "Tutorial Documents", TutorialDocument()),
          switchPageButton(
              context, "External App launcher", ExternalAppLauncher()),
          switchPageButton(context, "Local Notification", LocalNotification()),
          switchPageButton(context, "Share Inward", ShareInward()),
          switchPageButton(context, "Share Outward", SimpleShareOutward()),
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
      debugPrint("Clicked" + buttonText + "Button");
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    },
  );
}
