import 'dart:io';
import 'package:contact_app/pages/contact/provier/contact_provier.dart';
import 'package:contact_app/pages/profile/provider/profile_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IosHomePage extends StatefulWidget {
  const IosHomePage({super.key});

  @override
  State<IosHomePage> createState() => _IosHomePageState();
}

class _IosHomePageState extends State<IosHomePage> {
  late ContactProvider contactProviderW = ContactProvider();
  late ContactProvider contactProviderR = ContactProvider();

  @override
  Widget build(BuildContext context) {
    contactProviderW = context.watch<ContactProvider>();
    contactProviderR = context.read<ContactProvider>();
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: const Color(0xff384e78),
        trailing: CupertinoSwitch(
          value: context.watch<ProfileProvider>().isAndroid,
          onChanged: (value) {
            context.read<ProfileProvider>().platformChange(val: value);
          },
        ),
        middle: const Text(
          "Paras",
          style: TextStyle(fontSize: 20, color: CupertinoColors.white),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ...contactProviderW.contacts.map(
              (e) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/ios_detail', arguments: e);
                },
                child: CupertinoListTile(
                  leading: CircleAvatar(
                    foregroundImage: FileImage(
                      File(
                        e.image.toString(),
                      ),
                    ),
                  ),
                  title: Text("${e.name}"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
