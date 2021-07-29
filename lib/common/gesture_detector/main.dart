import 'package:flutter/material.dart';

void main() => runApp(GestureDetectorPlugin());

class GestureDetectorPlugin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter',
        home: Scaffold(
          appBar: AppBar(
            title: Text("Gesture Detector"),
          ),
          body: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String action = "無動作";

//  Function for updating the Text when action is taken
  dynamic _changeText(String input) {
    setState(() {
      action = input;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () => _changeText("点击"),
            onDoubleTap: () => _changeText("双击"),
            onLongPress: () => _changeText("长按"),
            onTapCancel: () => _changeText("取消"),
            onTapUp: (e) => _changeText("松开"),
            onTapDown: (e) => _changeText("按下"),
            child: Container(
              decoration: BoxDecoration(color: Colors.redAccent),
              width: 100,
              height: 100,
              child: Text("Gesture Detector"),
            ),
          ),
          Container(
            width: 200,
            height: 100,
            child: Text(action),
          )
        ],
      ),
    );
  }
}
