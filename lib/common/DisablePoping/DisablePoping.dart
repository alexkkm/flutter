import 'package:flutter/material.dart';

void main() {
  disablePopingPlugin();
}

void disablePopingPlugin() {
  runApp(MaterialApp(
      title: 'Flutter',
      home: Scaffold(
        body: PageDisabled(),
      )));
}

/// This is the main application widget.
class PageDisabled extends StatelessWidget {
  const PageDisabled({Key? key}) : super(key: key);

  static const String _title = 'Flutter';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disable Poping Plugin Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('Push'),
              onPressed: () {
                Navigator.of(context).push<void>(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return DisablePopingPage();
                    },
                  ),
                );
              },
            ),
            const Text(
                'This is the Home Page, please push to next page to continue'),
          ],
        ),
      ),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class DisablePopingPage extends StatefulWidget {
  const DisablePopingPage({Key? key}) : super(key: key);

  @override
  State<DisablePopingPage> createState() => _DisablePopingPageState();
}

/// This is the private State class that goes with DisablePopingPage.
class _DisablePopingPageState extends State<DisablePopingPage> {
  bool shouldPop = true;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return shouldPop;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Disabling Poping Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: const Text('Back to Home Page'
                    "(Won't be disabled by the WillPopScope)"),
                onPressed: () {
                  Navigator.of(context).push<void>(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return HomePage();
                      },
                    ),
                  );
                },
              ),
              ElevatedButton(
                child: Text('shouldPop: $shouldPop'),
                onPressed: () {
                  setState(
                    () {
                      shouldPop = !shouldPop;
                    },
                  );
                },
              ),
              const Text(
                  'Tap on shouldPop button to toggle its value. Press the back '
                  'button in the appBar to check its behaviour '
                  'for different values of shouldPop'),
              Container(
                height: 25,
              ),
              const Text(
                  "WillPopScope will only enable the action of tapping back button in the appBar"
                  "or the back button on the phone screen for Android Phone")
            ],
          ),
        ),
      ),
    );
  }
}
