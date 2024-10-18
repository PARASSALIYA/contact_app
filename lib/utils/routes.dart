import 'package:contact_app/pages/android/contact/contact_page.dart';
import 'package:contact_app/pages/android/detail/view/detail_page.dart';
import 'package:contact_app/pages/android/edit/view/edit_page.dart';
import 'package:contact_app/pages/android/hide/view/hide_contact.dart';
import 'package:contact_app/pages/android/home/view/home_page.dart';
import 'package:contact_app/pages/intro/view/intro_screen.dart';
import 'package:contact_app/pages/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const SplashScreen(),
    '/home': (context) => const HomePage(),
    '/intro': (context) => const IntroScreen(),
    '/contact': (context) => const ContactPage(),
    '/contactDetail': (context) => const DetailPage(),
    '/edit': (context) => const EditPage(),
    '/hide': (context) => const HideContact(),
  };
}
