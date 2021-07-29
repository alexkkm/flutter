import 'package:flutter/material.dart';
import 'package:flutter_learning/common/introduction_plugin/main.dart';
import 'package:flutter_learning/common/searching/main.dart';
import 'package:flutter_learning/common/shimmer/main.dart';
import 'package:flutter_learning/common/switch_page/switchPage.dart';
import 'package:flutter_learning/common/tutorial_documents/tutorial.dart';

void main() => runApp(CommonManu());

class CommonManu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          switchPageButton(context, "Tutorial Documents", TutorialDocument()),
          switchPageButton(context, "Switch Page", SwitchPageTutorial()),
          switchPageButton(context, "Shimmer", ShimmerPlugin()),
          switchPageButton(
              context, "Introduction Plugin", IntroductionPlugin()),
          switchPageButton(context, "Searching", SearchingPlugin()),
          switchPageButton(context, "Shimmer", ShimmerPlugin()),
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