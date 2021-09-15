import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() => runApp(SlidableBarPlugin());

class SlidableBarPlugin extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Slidable Bar Plugin'),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Slidable(
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            width: 200,
            height: 150,
            child: Center(
                child: Text(
              "Slidable bar",
              style: TextStyle(fontSize: 14),
            )),
          ),
          actionPane: SlidableScrollActionPane(),
          actionExtentRatio: 0.2,
          secondaryActions: <Widget>[
            IconSlideAction(
                icon: Icons.check_circle_rounded,
                onTap: () {},
                color: Colors.greenAccent),
            IconSlideAction(
                icon: Icons.calendar_today_rounded,
                onTap: () async {},
                color: Colors.red),
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
              child: IconSlideAction(
                  icon: Icons.delete_outlined,
                  onTap: () {},
                  color: Colors.redAccent),
            ),
          ],
        ),
      ),
    );
  }
}
