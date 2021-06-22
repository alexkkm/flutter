import 'package:flutter/material.dart';
import 'local_notification_demo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Local Notification'),
        ),
        body: LocalNotificationDemo(),
      ),
    );
  }
}
