import 'package:contact_app/pages/bottomnavigationbar/provider/navigation_provider.dart';
import 'package:contact_app/pages/contact/views/contact_page.dart';
import 'package:contact_app/pages/home/view/home_page.dart';
import 'package:contact_app/pages/profile/views/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationBarPage extends StatefulWidget {
  const NavigationBarPage({super.key});

  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  List<Widget> pages = [
    const ContactPage(),
    const HomePage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[context.watch<NavigationBarProvider>().currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff384e78),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        currentIndex: context.watch<NavigationBarProvider>().currentIndex,
        onTap: (val) {
          context.read<NavigationBarProvider>().setCurrentIndex(val);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Add Contact',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2),
            label: 'All Contact',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
