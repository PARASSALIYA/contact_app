import 'package:flutter/cupertino.dart';

class IosProfilePage extends StatefulWidget {
  const IosProfilePage({super.key});

  @override
  State<IosProfilePage> createState() => _IosProfilePageState();
}

class _IosProfilePageState extends State<IosProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: Center(
        child: Text("Profile"),
      ),
    );
  }
}
