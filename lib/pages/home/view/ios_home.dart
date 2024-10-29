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
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: Color(0xff384e78),
        middle: Text(
          "All Contacts",
          style: TextStyle(fontSize: 20, color: CupertinoColors.white),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: context.watch<ContactProvider>().contacts.length,
                itemBuilder: (context, index) {
                  return CupertinoListTile(
                    onTap: () {
                      context.read<ContactProvider>().setSelectedIndex(index);

                      Navigator.pushNamed(context, '/ios_detail',
                          arguments:
                              context.read<ContactProvider>().contacts[index]);
                    },
                    leading: CircleAvatar(
                      radius: 30,
                      foregroundImage: FileImage(
                        File(
                          context
                              .watch<ContactProvider>()
                              .contacts[index]
                              .image
                              .toString(),
                        ),
                      ),
                    ),
                    title: Text(
                        "${context.watch<ContactProvider>().contacts[index].name}"),
                    trailing: IconButton(
                      onPressed: () {
                        context.read<ContactProvider>().removeContact(index);
                      },
                      icon: const Icon(CupertinoIcons.delete_solid),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
