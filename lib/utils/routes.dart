import 'package:contact_app/pages/bottomnavigationbar/ios_navigationbar.dart';
import 'package:contact_app/pages/bottomnavigationbar/navigationbar.dart';
import 'package:contact_app/pages/contact/views/contact_page.dart';
import 'package:contact_app/pages/contact/views/ios_contact.dart';
import 'package:contact_app/pages/detail/view/detail_page.dart';
import 'package:contact_app/pages/edit/view/edit_page.dart';
import 'package:contact_app/pages/favorite/favorite.dart';
import 'package:contact_app/pages/hide/view/hide_contact.dart';
import 'package:contact_app/pages/home/view/home_page.dart';
import 'package:contact_app/pages/home/view/ios_home.dart';
import 'package:contact_app/pages/intro/view/intro_screen.dart';
import 'package:contact_app/pages/ios/ios_favorite/ios_favorite.dart';
import 'package:contact_app/pages/profile/profile.dart';
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
    '/favorite': (context) => const FavoritePage(),
    '/hide': (context) => const HideContact(),
  };
}

// class IosRoutes {
//   static Map<String, Widget Function(BuildContext)> routes = {
//     '/ios_home': (context) => const IosHomePage(),
//     '/ios_contact': (context) => const IosAddContact(),
//     // '/ios_contactDetail': (context) => const IosDetailPage(),
//     '/ios_edit': (context) => const EditPage(),
//     // '/ios_favorite' :(context)=> const FavoritePage(),
//     '/ios_hide': (context) => const HideContact(),
//   };
// }
