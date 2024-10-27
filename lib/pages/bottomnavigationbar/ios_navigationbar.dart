import 'package:contact_app/pages/contact/views/ios_contact.dart';
import 'package:contact_app/pages/home/view/ios_home.dart';
import 'package:contact_app/pages/profile/views/ios_profile.dart';
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
    const IosFavorite(),
    const IosAddContact(),
    const IosHomePage(),
    const IosProfilePage(),
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
              icon: Icon(
                CupertinoIcons.star_fill,
                color: CupertinoColors.systemYellow,
              ),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_add_solid),
              label: 'Add Contact',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_2_fill),
              label: 'All Contacts',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled),
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
