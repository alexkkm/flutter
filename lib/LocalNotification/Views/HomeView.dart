import 'package:flutter/material.dart';
import 'package:flutter_learning/LocalNotification/Services/NotificationService.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest.dart' as tz; //for tz.initializeTimeZones()

class NotificationHomePage extends StatefulWidget {
  @override
  _NotificationHomePageState createState() => _NotificationHomePageState();
}

class _NotificationHomePageState extends State<NotificationHomePage> {
  //initialize the Notification Service and TimeZone Plugin
  @override
  void initState() {
    Provider.of<NotificationService>(context, listen: false).initialize();
    tz.initializeTimeZones();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Flutter",
        home: Scaffold(
            appBar: AppBar(
              title: Text("Local Notification"),
            ),
            body: Container(
                child: Center(
                    child: Consumer<NotificationService>(
              builder: (context, model, _) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () => model.createNotification(
                            1,
                            "3 seconds title",
                            "3 second content",
                            DateTime.now().add(const Duration(seconds: 3))),
                        child: Text('3 sec Notification')),
                    ElevatedButton(
                        onPressed: () => model.createNotification(
                            2,
                            "6 seconds title",
                            "6 second content",
                            DateTime.now().add(const Duration(seconds: 6))),
                        child: Text('6 sec Notification')),
                    ElevatedButton(
                        onPressed: () => model.cancelAllNotification(),
                        child: Text('Cancel Notification')),
                  ]),
            )))));
  }
}
