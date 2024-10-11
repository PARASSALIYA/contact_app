import 'package:contact_app/pages/contact/contact_page.dart';
import 'package:contact_app/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const HomePage(),
    '/contact': (context) => const ContactPage(),
  };
}
