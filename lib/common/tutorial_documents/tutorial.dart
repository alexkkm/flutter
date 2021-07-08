import 'package:flutter/material.dart';

class TutorialDocument extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            child: const Center(
              child: Text("Changing App Icon:"),
            ),
          ),
          Container(
            child: Text("Changing App Icon:" +
                "\n" +
                "path for app icon:\nAndroid:android/app/src/main/res/mipmap\n" +
                "IOS:    IOS/Runner/Assets.xcassets/AppIcon.appiconset\n" +
                "Web:    web/icons\n" +
                "place need to change after renaming new icon:android\app\src\main\AndroidManifest.xml:\n" +
                "line 12     android:icon=\"@mipmap/ic_launcher\" change ic_launcher into new name" +
                "\n" +
                "\n"),
          ),
          Container(
            child: const Center(
              child: Text("Renaming flutter application:"),
            ),
          ),
          Container(
            child: Text("name of the project:\n" +
                "D:/vscode/flutter/pubspec.yaml\n" +
                "D:/vscode/flutter/README.md\n" +
                "D:/vscode/flutter/android/app/src/main/AndroidManifest.xml:\n" +
                "	4,24:         android:label=\"flutter_learning\"\n"),
          ),
          Container(
            child: const Center(
              child: Text("name of the package: com.example.flutter_learning\n" +
                  "D:/vscode/flutter/android/app/build.gradle\n" +
                  "	37,24:         applicationId \"com.example.flutter_learning\"\n" +
                  "D:/vscode/flutter/android/app/src/debug/AndroidManifest.xml\n" +
                  "	2,14:     package=\"com.example.flutter_learning\">\n" +
                  "D:/vscode/flutter/android/app/src/main/AndroidManifest.xml:\n" +
                  "	2,14:     package=\"com.example.flutter_learning\">\n" +
                  "D:/vscode/flutter/android/app/src/main/kotlin/com/example/flutter_learning/MainActivity.kt\n" +
                  "	1,9: package com.example.flutter_learning\n" +
                  "D:/vscode/flutter/android/app/src/profile/AndroidManifest.xml\n" +
                  "	2,14:     package=\"com.example.flutter_learning\">\n" +
                  "D:/vscode/flutter/ios/Runner.xcodeproj/project.pbxproj\n" +
                  "	294,33: 				PRODUCT_BUNDLE_IDENTIFIER = com.example.flutterLearning;\n" +
                  "	418,33: 				PRODUCT_BUNDLE_IDENTIFIER = com.example.flutterLearning;\n" +
                  "	437,33: 				PRODUCT_BUNDLE_IDENTIFIER = com.example.flutterLearning;\n"),
            ),
          ),
          Container(
            child: const Center(
                child: Text("name of the app:\n" +
                    "D:/vscode/flutter/ios/Runner/Info.plist\n" +
                    "	14,10: 	<string>flutter_learning</string>\n" +
                    "D:/vscode/flutter/web/index.html\n" +
                    "  	23,52:   <meta name=\"apple-mobile-web-app-title\" content=\"flutter_learning\">\n" +
                    "  	26,10:   <title>flutter_learning</title>\n" +
                    "D:/vscode/flutter/web/manifest.json\n" +
                    "	2,14:     \"name\": \"flutter_learning\",\n" +
                    "	3,20:     \"short_name\": \"flutter_learning\",\n")),
          ),
        ],
      ),
    );
  }
}
