import 'package:flutter/material.dart';
import 'package:flutter_learning/LocalNotification/Services/NotificationService.dart';
import 'package:flutter_learning/LocalNotification/Views/HomeView.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(LocalNotification());
}

class LocalNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        child: MaterialApp(
          title: "Flutter",
          home: NotificationHomePage(),
          debugShowCheckedModeBanner: false,
        ),
        providers: [
          ChangeNotifierProvider(create: (_) => NotificationService())
        ]);
  }
}
