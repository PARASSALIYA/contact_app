import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:contact_app/pages/intro/helper/intro_helper.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Container(
            height: double.infinity,
            width: 400,
            padding: const EdgeInsets.all(10),
            child: IntroductionScreen(
              onDone: () {
                ShrHelper prefs = ShrHelper();
                prefs.shareIntro();
                Navigator.pushReplacementNamed(context, "/navigation_bar");
              },
              pages: [
                PageViewModel(
                  title: "Welcome",
                  body: "Welcome to our app",
                  image: Image.asset(
                    "assets/images/1.png",
                    height: 350,
                  ),
                ),
                PageViewModel(
                  title: "Get Started",
                  body: "Start using our app",
                  image: Image.asset(
                    "assets/images/2.png",
                    height: 350,
                  ),
                ),
                PageViewModel(
                  title: "Enjoy",
                  body: "Enjoy using our app",
                  image: Image.asset(
                    "assets/images/3.png",
                    height: 350,
                  ),
                ),
              ],
              // You can override onSkip callback
              showSkipButton: true,
              skipOrBackFlex: 0,
              nextFlex: 0,
              showBackButton: false,
              back: const Icon(Icons.arrow_back),
              skip: const Text(
                'Skip',
                style: TextStyle(
                  color: Color(0xff384e78),
                  fontWeight: FontWeight.w600,
                ),
              ),
              next: const Text(
                "Next",
                style: TextStyle(
                  color: Color(0xff384e78),
                  fontWeight: FontWeight.w600,
                ),
              ),
              done: const Text(
                'Done',
                style: TextStyle(
                  color: Color(0xff384e78),
                  fontWeight: FontWeight.w600,
                ),
              ),
              curve: Curves.fastLinearToSlowEaseIn,
              controlsMargin: const EdgeInsets.all(16),
              controlsPadding: kIsWeb
                  ? const EdgeInsets.all(12.0)
                  : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
            ),
          ),
        ),
      ),
    );
  }
}
