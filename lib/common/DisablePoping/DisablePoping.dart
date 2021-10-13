import 'package:flutter/material.dart';

void main() => runApp(DisablePopingPlugin());

class DisablePopingPlugin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter',
        home: Scaffold(
          appBar: AppBar(
            title: Text("Disable Poping"),
          ),
          body: MyHomePage(),
        ));
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  bool disableBackPage = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => DisablePage()),
              (route) => disableBackPage);
        },
        child: Text("text"));
  }
}

class DisablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("DisablePage"),
        ),
        body: Column(children: <Widget>[
          Text("2nd Page"),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Back Page")),
        ]));
  }
}

class EnablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("EnablePage"),
        ),
        body: Column(children: <Widget>[
          Text("2nd Page"),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Back Page")),
        ]));
  }
}
