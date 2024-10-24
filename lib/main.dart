import 'package:contact_app/pages/android/home/provider/home_provider.dart';
import 'package:contact_app/pages/android/home/view/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contact_app/pages/android/home/view/ios_home.dart';
import 'package:contact_app/pages/android/contact/provier/contact_provier.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ContactProvider(),
        ),
        ChangeNotifierProvider.value(
          value: HomeProvider(),
        ),
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
    return Consumer<ContactProvider>(
      builder: (context, value, child) =>
          context.watch<ContactProvider>().isAndroid
              ? const MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: HomePage(),
                )
              : const CupertinoApp(
                  debugShowCheckedModeBanner: false,
                  theme: CupertinoThemeData(
                    brightness: Brightness.dark,
                  ),
                  home: IosHomePage(),
                ),
    );
  }
}
