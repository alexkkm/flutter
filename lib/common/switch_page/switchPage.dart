import 'package:flutter/material.dart';

void main() => runApp(SwitchPageTutorial());

class SwitchPageTutorial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter",
      home: Scaffold(
        appBar: AppBar(
          title: Text('change-page'),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            child: Text('Switch Page'),
            onPressed: () {
              debugPrint("Clicked Switch Page Button");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SwitchPage()));
            },
          ),
        ]);
  }
}

class SwitchPage extends StatefulWidget {
  @override
  SwitchPageState createState() => SwitchPageState();
}

class SwitchPageState extends State<SwitchPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Switch Page'),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: Text('Home Page'),
                onPressed: () {
                  debugPrint("Clicked Home Page Button");
                  Navigator.pop(context);
                },
              ),
            ]),
      ),
    );
  }
}
