import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/main.dart';
import 'package:introduction_screen/introduction_screen.dart';

void main() => IntroductionApp();

// ignore: non_constant_identifier_names
void IntroductionPlugin() => runApp(IntroductionApp());

class IntroductionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      home: IntroductionPage(),
    );
  }
}

class IntroductionPage extends StatefulWidget {
  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  //Function for switching page at the end of Introduction
  void _atTheEndOfIntroduction(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => HomePage()),
    );
  }

  //Widget of building full screenimage in pages
  Widget _buildFullscreenImage() {
    return Image.asset(
      'images/fullscreen.jpg',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  //Widget of building image in pages
  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    //Widget of building Introduction Plugin Screens
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: _buildImage('rightHandCorner.jpg', 100),
          ),
        ),
      ),

      //Global footer shows on every screens,
      //which has a button for skip the introduction
      globalFooter: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          child: const Text(
            "Global footer button",
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          onPressed: () => _atTheEndOfIntroduction(context),
        ),
      ),
      pages: [
        //Normal Tempate Page of Introduction
        PageViewModel(
          title: "Introduction Plugin Title",
          body: "Introduction Plugin Content",
          image: _buildImage('img1.jpg'),
          decoration: pageDecoration,
        ),

        //Full Screen Page of Introduction
        PageViewModel(
          title: "Full Screen Page",
          body: "Pages can be full screen as well.\n",
          image: _buildFullscreenImage(),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            fullScreen: true,
            bodyFlex: 2,
            imageFlex: 3,
          ),
        ),

        //Jumping to another pages in the page of Introduction
        PageViewModel(
          title: "Useful Button",
          body: "Here are the buttons for introduction plugin",
          image: _buildImage('img2.jpg'),
          footer:
              //Button for jumping into 1st page
              ElevatedButton(
            onPressed: () {
              //Function for jumping to 1st page
              introKey.currentState?.animateScroll(0);
            },
            child: Text(
              'Button for jumping to 1st page',
              style: TextStyle(color: Colors.white),
            ),
          ),
          decoration: pageDecoration,
        ),

        //Last Page
        PageViewModel(
          title: "Title of last page",
          bodyWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Click on ", style: bodyStyle),
              Icon(Icons.edit),
              Text(" to edit a post", style: bodyStyle),
            ],
          ),
          decoration: pageDecoration.copyWith(
            bodyFlex: 2,
            imageFlex: 4,
            bodyAlignment: Alignment.bottomCenter,
            imageAlignment: Alignment.topCenter,
          ),
          image: _buildImage('img1.jpg'),
          reverse: true,
        ),
      ],

      //Function running after the users read the introduction (Done Button)
      done: const Text('Done'),
      onDone: () => _atTheEndOfIntroduction(context),

      //Function running after the users skipped the introduction (Skip Button)
      showSkipButton: true,
      skip: const Text('Skip'),
      onSkip: () => _atTheEndOfIntroduction(context),

      skipFlex: 0,
      nextFlex: 0,
      //rtl: true, // Display as right-to-left

      next: const Icon(Icons.arrow_forward),

      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),

      //Decoration of Dots
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),

      //Decoration of Dots Container
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.yellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomePage')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //Content of Home Page
          Text("This is the screen after Introduction"),

          //Button for moving back to Home Page
          ElevatedButton(
              onPressed: () => {runApp(MainApp())},
              child: Text("Back to Home Page"))
        ],
      )),
    );
  }
}
