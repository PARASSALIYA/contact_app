import 'package:contact_app/pages/contact/contact_page.dart';
import 'package:contact_app/pages/home/view/home_page.dart';
import 'package:contact_app/pages/intro/view/intro_screen.dart';
import 'package:contact_app/pages/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const SplashScreen(),
    '/home': (context) => const HomePage(),
    '/intro': (context) => const IntroScreen(),
    '/contact': (context) => const ContactPage(),
  };
}
