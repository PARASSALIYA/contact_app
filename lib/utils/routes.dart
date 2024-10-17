import 'package:contact_app/pages/contact/contact_page.dart';
import 'package:contact_app/pages/detail/view/detail_page.dart';
import 'package:contact_app/pages/edit/view/edit_page.dart';
import 'package:contact_app/pages/favirote/view/favorite_screen.dart';
import 'package:contact_app/pages/hide/view/hide_contact.dart';
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
    '/contactDetail': (context) => const DetailPage(),
    '/edit': (context) => const EditPage(),
    '/hide': (context) => const HideContact(),
    '/favorite': (context) => const FavoriteScreen(),
  };
}
