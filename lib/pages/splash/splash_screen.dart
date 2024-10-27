import 'dart:async';
import 'package:flutter/material.dart';
import 'package:contact_app/pages/intro/helper/intro_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    ShrHelper shr = ShrHelper();
    shr.introStatus().then(
      (value) {
        if (value == true) {
          Timer(
            const Duration(seconds: 3),
            () => Navigator.pushReplacementNamed(context, "/navigation_bar"),
          );
        } else {
          Timer(
            const Duration(seconds: 3),
            () => Navigator.pushReplacementNamed(context, "/intro"),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/logo.png",
          height: 400,
        ),
      ),
    );
  }
}
