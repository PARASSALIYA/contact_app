import 'package:contact_app/pages/home/view/ios_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:contact_app/pages/ios/ios_favorite/ios_favorite.dart';

class IosNavigationBarPage extends StatefulWidget {
  const IosNavigationBarPage({super.key});

  @override
  State<IosNavigationBarPage> createState() => _IosNavigationBarPageState();
}

class _IosNavigationBarPageState extends State<IosNavigationBarPage> {
  List pages = [
    const IosHomePage(),
    const IosFavorite(),
    // const IosAddContact(),
  ];
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
      child: CupertinoTabScaffold(
        backgroundColor: Colors.white,
        tabBar: CupertinoTabBar(
          backgroundColor: const Color(0xff384e78),
          activeColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
              label: 'Profile',
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            builder: (context) {
              return pages[index];
            },
          );
        },
      ),
    );
  }
}
