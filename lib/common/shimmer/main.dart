import 'package:flutter/material.dart';
import 'package:flutter_learning/common/shimmer/theme.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_learning/common/shimmer/shimmerBox.dart';

void main() => runApp(ShimmerPlugin());

class ShimmerPlugin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shimmer',
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
                        child:
                            // Change widget below shown when the event list is not ready
                            ListView(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      children: <Widget>[
                        // Rectangle 4
                        normalBox(),
                        normalBox(),
                        normalBox(),
                        normalBox()
                      ],
                    )

                        // Change widget above shown when the event list is not ready

                        ))),
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
