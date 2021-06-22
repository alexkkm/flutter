import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

FlutterLocalNotificationsPlugin notificationsPlugin =
    FlutterLocalNotificationsPlugin();

class LocalNotificationDemo extends StatefulWidget {
  @override
  _LocalNotificationDemoState createState() => _LocalNotificationDemoState();
}

class _LocalNotificationDemoState extends State<LocalNotificationDemo> {
  @override
  void initState() {
    initializeSetting();
    tz.initializeTimeZones();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextButton(
          onPressed: () {
            displayNotification(
                "1", "Seconds", DateTime.now().add(const Duration(seconds: 1)));
          },
          child: Text("DateTime"),
        ),
        TextButton(
          onPressed: () {
            displayNotification("Title", "Content",
                DateTime.now().add(const Duration(seconds: 5)));
          },
          child: Text("5 Seconds"),
        ),
      ],
    );
  }

  Future<void> displayNotification(
      String title, String content, DateTime dateTime) async {
    notificationsPlugin.zonedSchedule(
        0,
        title,
        content,
        tz.TZDateTime.from(dateTime, tz.local),
        NotificationDetails(
          android: AndroidNotificationDetails(
              'channel id', 'channel name', 'channel description'),
        ),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true);
  }
}

void initializeSetting() async {
  var initializeAndroid = AndroidInitializationSettings('my_logo');
  var initializeSetting = InitializationSettings(android: initializeAndroid);
  await notificationsPlugin.initialize(initializeSetting);
}
