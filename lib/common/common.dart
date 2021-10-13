import 'package:flutter/material.dart';
import 'package:flutter_learning/Common/Introduction/Introduction.dart';
import 'package:flutter_learning/Common/Padding/Padding.dart';
import 'package:flutter_learning/Common/Searching/Searching.dart';
import 'package:flutter_learning/Common/Shimmer/Shimmer.dart';
import 'package:flutter_learning/Common/SwitchPage/SwitchPage.dart';
import 'package:flutter_learning/Common/TutorialDocuments/tutorial.dart';
import 'package:flutter_learning/Common/Background/Background.dart';

void main() => runApp(CommonManu());

class CommonManu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Common"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            switchPageButton(context, "Tutorial Documents", TutorialDocument()),
            switchPageButton(context, "Switch Page", SwitchPageTutorial()),
            switchPageButton(context, "Padding", PaddingPlugin()),
            switchPageButton(context, "Shimmer", ShimmerPlugin()),
            switchPageButton(
                context, "Introduction Plugin", IntroductionPlugin()),
            switchPageButton(context, "Searching", SearchingPlugin()),
            switchPageButton(context, "Background", BackgroundPlugin()),
          ],
        ),
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
