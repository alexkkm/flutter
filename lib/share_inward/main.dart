import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(ShareInward());
}

class ShareInward extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      home: SaveByExtension(title: 'Shared Text'),
    );
  }
}

class SaveByExtension extends StatefulWidget {
  SaveByExtension({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _SaveByExtensionState createState() => _SaveByExtensionState();
}

class _SaveByExtensionState extends State<SaveByExtension> {
  String _sharedText = "";

  @override
  void initState() {
    super.initState();

    // Create the share service
    ShareService()
      // Register a callback so that we handle shared data if it arrives while the
      // app is running
      ..onDataReceived = _handleSharedData

      // Check to see if there is any shared data already, meaning that the app
      // was launched via sharing.
      ..getSharedData().then(_handleSharedData);
  }

  /// Handles any shared data we may receive.
  void _handleSharedData(String sharedData) {
    setState(() {
      _sharedText = sharedData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Flutter",
        home: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'The shared text that you received is:',
                ),
                Text(
                  _sharedText,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ));
  }
}

/// This service is responsible for talking with the OS to see if anything was
/// shared with the application.
class ShareService {
  void Function(String)? onDataReceived;

  ShareService() {
    // If sharing causes the app to be resumed, we'll check to see if we got any
    // shared data
    SystemChannels.lifecycle.setMessageHandler((msg) async {
      if (msg?.contains("resumed") ?? false) {
        getSharedData().then((String data) {
          // Nothing was shared with us :(
          if (data.isEmpty) {
            return;
          }

          // We got something! Inform our listener.
          onDataReceived?.call(data);
        });
      }
      return;
    });
  }

  /// Invoke a method on our platform, telling it to give us any shared data
  /// it has
  Future<String> getSharedData() async {
    return await MethodChannel('com.example.flutter_learning')
            .invokeMethod("getSharedData") ??
        "";
  }
}
