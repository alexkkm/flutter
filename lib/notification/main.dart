import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

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

//function for initialize Android and IOS setting for Notification Plugin
void initializeSetting() async {
  var initializeAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
  var initializeSetting = InitializationSettings(android: initializeAndroid);
  await notificationsPlugin.initialize(initializeSetting);
}

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
            createNotification("1", "1 sec notification", "1 sec content",
                DateTime.now().add(const Duration(seconds: 1)));
          },
          child: Text("DateTime"),
        ),
        TextButton(
          onPressed: () {
            createNotification("1", "Title", "Content",
                DateTime.now().add(const Duration(seconds: 5)));
          },
          child: Text("5 Seconds"),
        ),
        TextButton(
            onPressed: () {
              cancelAllNotifications();
            },
            child: Text("Cancel All"))
      ],
    );
  }

  //Creating Notification with specific
  //channel ID, notification title, notification content, notification trigger time
  Future<void> createNotification(
      String channelID, String title, String content, DateTime dateTime) async {
    notificationsPlugin.zonedSchedule(
        0,
        title,
        content,
        tz.TZDateTime.from(dateTime, tz.local),
        NotificationDetails(
          android: AndroidNotificationDetails(
              channelID, 'channel name', 'channel description'),
        ),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true);
  }

  //Cancel all Notification
  Future<void> cancelAllNotifications() async {
    await notificationsPlugin.cancelAll();
  }
}
