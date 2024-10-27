import 'package:contact_app/pages/bottomnavigationbar/provider/navigation_provider.dart';
import 'package:contact_app/pages/contact/provier/contact_provier.dart';
import 'package:contact_app/pages/detail/provider/detail_provider.dart';
import 'package:contact_app/pages/home/provider/home_provider.dart';
import 'package:contact_app/pages/home/view/home_page.dart';
import 'package:contact_app/pages/home/view/ios_home.dart';
import 'package:contact_app/pages/profile/provider/profile_provider.dart';
import 'package:contact_app/utils/routes.dart';
import 'package:contact_app/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ContactProvider()),
        ChangeNotifierProvider.value(value: HomeProvider()),
        ChangeNotifierProvider.value(value: NavigationBarProvider()),
        ChangeNotifierProvider.value(value: ProfileProvider()),
        ChangeNotifierProvider.value(value: DetailProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        brightness: context.watch<ProfileProvider>().darkMode
            ? Brightness.dark
            : Brightness.light,
      ),
      routes: IosRoutes.routes,
    );
    // return Consumer<ProfileProvider>(
    //   builder: (context, value, child) =>
    //       context.watch<ProfileProvider>().isAndroid
    //           ? MaterialApp(
    //               debugShowCheckedModeBanner: false,
    //               theme: context.watch<ProfileProvider>().darkMode
    //                   ? ThemeData.dark()
    //                   : ThemeData.light(),
    //               routes: Routes.routes,
    //             )
    //           : CupertinoApp(
    //               debugShowCheckedModeBanner: false,
    //               theme: CupertinoThemeData(
    //                 brightness: context.watch<ProfileProvider>().darkMode
    //                     ? Brightness.dark
    //                     : Brightness.light,
    //               ),
    //               routes: IosRoutes.routes,
    //             ),
    // );
  }
}
