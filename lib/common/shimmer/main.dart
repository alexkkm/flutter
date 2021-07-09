import 'package:flutter/material.dart';
import 'package:flutter_learning/common/shimmer/color.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_learning/common/shimmer/decoration.dart';

void main() => runApp(ShimmerPlugin());

class ShimmerPlugin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      routes: <String, WidgetBuilder>{
        'loading': (_) => LoadingListPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shimmer'),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: const Text('Loading List'),
            onTap: () => Navigator.of(context).pushNamed('loading'),
          ),
        ],
      ),
    );
  }
}

class LoadingListPage extends StatefulWidget {
  @override
  _LoadingListPageState createState() => _LoadingListPageState();
}

class _LoadingListPageState extends State<LoadingListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loading List'),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Shimmer.fromColors(
                baseColor: Color(0xfff7f7fb),
                direction: ShimmerDirection.ltr,
                highlightColor: CustomizedColors.background1,
                child: Center(
                  child: ListView(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    children: <Widget>[
                      //The below 2 boxes are the same
                      shimmerBox(),
                      rectangleBox(),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Back to Shimmer")),
            )
          ],
        ),
      ),
    );
  }
}
