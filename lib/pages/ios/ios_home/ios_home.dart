import 'package:contact_app/pages/ios/ios_contact/ios_contact.dart';
import 'package:contact_app/pages/ios/ios_favorite/ios_favorite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IosHomePage extends StatefulWidget {
  const IosHomePage({super.key});

  @override
  State<IosHomePage> createState() => _IosHomePageState();
}

class _IosHomePageState extends State<IosHomePage> {
  List pages = [
    const IosHomePage(),
    const IosFavorite(),
    const IosAddContact(),
  ];
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: const Color(0xff384e78),
        trailing: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/add_contact');
          },
          icon: const Icon(
            CupertinoIcons.add,
            color: Colors.white,
          ),
        ),
        middle: const Text(
          "Paras",
          style: TextStyle(fontSize: 20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text("paras"),
        // CupertinoTabScaffold(
        //   backgroundColor: Colors.white,
        //   tabBar: CupertinoTabBar(
        //     backgroundColor: const Color(0xff384e78),
        //     activeColor: Colors.white,
        //     items: const [
        //       BottomNavigationBarItem(
        //         icon: Icon(CupertinoIcons.home),
        //         label: 'Home',
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(CupertinoIcons.heart),
        //         label: 'Favorite',
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(CupertinoIcons.person),
        //         label: 'Profile',
        //       ),
        //     ],
        //   ),
        //   tabBuilder: (BuildContext context, int index) {
        //     return CupertinoTabView(
        //       builder: (context) {
        //         return pages[index];
        //       },
        //     );
        //   },
        // ),
      ),
    );
  }
}
