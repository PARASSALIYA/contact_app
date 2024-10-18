import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:contact_app/pages/ios/ios_contact/ios_contact.dart';
import 'package:contact_app/pages/ios/ios_home/ios_home.dart';
import 'package:contact_app/pages/ios/ios_favorite/ios_favorite.dart';
import 'package:contact_app/pages/android/contact/provier/contact_provier.dart';

void main() {
  runApp(
    const MyApp(),
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ContactProvider(),
        ),
      ],
      child:
          // MaterialApp(
          //    debugShowCheckedModeBanner: false,
          //    routes: Routes.routes,
          //  )
          CupertinoApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const IosHomePage(),
          '/add_contact': (context) => const IosAddContact(),
          '/favorite': (context) => const IosFavorite(),
        },
      ),
    );
  }
}
