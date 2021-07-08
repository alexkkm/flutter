import 'package:flutter/material.dart';
import 'services/notification.dart';
import 'views/home_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(LocalNotification());
}

class LocalNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        child: MaterialApp(
          theme: ThemeData(fontFamily: 'Monteserat'),
          home: HomePage(),
          debugShowCheckedModeBanner: false,
        ),
        providers: [
          ChangeNotifierProvider(create: (_) => NotificationService())
        ]);
  }
}
