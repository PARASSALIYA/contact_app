import 'package:contact_app/pages/bottomnavigationbar/ios_navigationbar.dart';
import 'package:contact_app/pages/bottomnavigationbar/navigationbar.dart';
import 'package:contact_app/pages/contact/views/contact_page.dart';
import 'package:contact_app/pages/contact/views/ios_contact.dart';
import 'package:contact_app/pages/detail/view/detail_page.dart';
import 'package:contact_app/pages/detail/view/ios_detail.dart';
import 'package:contact_app/pages/edit/view/edit_page.dart';
import 'package:contact_app/pages/edit/view/ios_edit.dart';
import 'package:contact_app/pages/hide/view/hide_contact.dart';
import 'package:contact_app/pages/home/view/home_page.dart';
import 'package:contact_app/pages/home/view/ios_home.dart';
import 'package:contact_app/pages/intro/view/intro_screen.dart';
import 'package:contact_app/pages/profile/views/profile.dart';
import 'package:contact_app/pages/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const SplashScreen(),
    '/navigation_bar': (context) => const NavigationBarPage(),
    '/home': (context) => const HomePage(),
    '/intro': (context) => const IntroScreen(),
    '/contact': (context) => const ContactPage(),
    '/profile': (context) => const ProfilePage(),
    '/contactDetail': (context) => const DetailPage(),
    '/edit': (context) => const EditPage(),
    // '/favorite': (context) => const FavoritePage(),
    '/hide': (context) => const HideContact(),
  };
}

class IosRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const IosNavigationBarPage(),
    '/ios_home': (context) => const IosHomePage(),
    '/ios_contact': (context) => const IosAddContact(),
    '/ios_detail': (context) => const IosDetailPage(),
    '/ios_edit': (context) => const IosEditPage(),
    // '/ios_favorite' :(context)=> const FavoritePage(),
    '/ios_hide': (context) => const HideContact(),
  };
}
