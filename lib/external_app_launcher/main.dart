import 'package:flutter/material.dart';
import 'package:app_launcher/app_launcher.dart';

void main() {
  runApp(ExternalAppLauncher());
}

class ExternalAppLauncher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter",
      home: Scaffold(
        appBar: AppBar(
          title: const Text('External App Launcher'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              openAppButton("com.whatsapp", "Open Whatsapp"),
              SizedBox(height: 16),
              openAppButton("com.facebook.katana", "Open Facebook"),
              SizedBox(height: 16),
              openAppButton("com.instagram.android", "Open Instagram"),
              SizedBox(height: 16),
              openAppButton("com.google.android.youtube", "Open Youtube"),
              SizedBox(height: 16),
              openAppButton("com.github.android", "Open Github"),
              SizedBox(height: 16),
              openAppButton("com.gitlab.terrakok.gitfox", "Open Gitlab"),
              SizedBox(height: 16),
              openAppButton(
                  "com.google.android.googlequicksearchbox", "Open Google"),
              SizedBox(height: 16),
              openAppButton("com.chrome.dev", "Open Chrome"),
              SizedBox(height: 16),
              openAppButton("org.mozilla.firefox", "Open Firefox"),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

//Modelize the ElevatedButton
ElevatedButton openAppButton(String androidApplicationId, String buttonText) {
  return ElevatedButton(
    onPressed: () async {
      //function for External App Launcher
      await AppLauncher.openApp(
        androidApplicationId: androidApplicationId,
      );
    },
    child: Text(buttonText),
  );
}
