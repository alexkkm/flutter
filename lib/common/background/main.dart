import 'package:flutter/material.dart';

void main() {
  runApp(BackgroundPlugin());
}

class BackgroundPlugin extends StatelessWidget {
  const BackgroundPlugin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Background"),
      ),
      body: Stack(
        children: <Widget>[
          //Bottom level: Background
          Container(child: Image.asset("images/flutterbird.png")),

          //Top level: Body Content Example
          Column(
            children: <Widget>[
              //建築背景
              Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: Divider.createBorderSide(context,
                              color: Color(0XFFc06c30), width: 1))),
                  width: 500,
                  height: 90,
                  child: GestureDetector(
                      onTap: () => {},
                      child: Row(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.only(left: 21.0)),
                          Text(
                            "建築背景",
                            style: TextStyle(
                                fontSize: 25, color: Color(0XFFc06c30)),
                          ),
                        ],
                      ))),

              //新亞四大活動
              Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: Divider.createBorderSide(context,
                              color: Color(0XFFc06c30), width: 1))),
                  width: 500,
                  height: 90,
                  child: GestureDetector(
                      onTap: () => {},
                      child: Row(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.only(left: 21.0)),
                          Text(
                            "新亞四大活動",
                            style: TextStyle(
                                fontSize: 25, color: Color(0XFFc06c30)),
                          ),
                        ],
                      ))),

              //簡史
              Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: Divider.createBorderSide(context,
                              color: Color(0XFFc06c30), width: 1))),
                  width: 500,
                  height: 90,
                  child: GestureDetector(
                      onTap: () => {},
                      child: Row(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.only(left: 21.0)),
                          Text(
                            "簡史",
                            style: TextStyle(
                                fontSize: 25, color: Color(0XFFc06c30)),
                          ),
                        ],
                      ))),
            ],
          ),
        ],
      ),
    );
  }
}
