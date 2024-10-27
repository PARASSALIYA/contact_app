import 'dart:io';
import 'package:contact_app/pages/contact/provier/contact_provier.dart';
import 'package:contact_app/pages/home/provider/home_provider.dart';
import 'package:contact_app/pages/profile/provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeProvider homeProviderW;
  late HomeProvider homeProviderR;
  @override
  Widget build(BuildContext context) {
    homeProviderW = context.watch<HomeProvider>();
    homeProviderR = context.read<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              bool isLock = await context.read<ContactProvider>().isLock();

              if (isLock) {
                Navigator.pushNamed(context, '/hide');
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Please authenticate to continue"),
                  ),
                );
              }
            },
            icon: const Icon(Icons.lock),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
        backgroundColor: const Color(0xff384e78),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Contact App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: context.watch<ContactProvider>().contacts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      context.read<ContactProvider>().setSelectedIndex(index);

                      Navigator.pushNamed(context, '/contactDetail',
                          arguments:
                              context.read<ContactProvider>().contacts[index]);
                    },
                    leading: Padding(
                      padding: const EdgeInsets.all(5),
                      child: CircleAvatar(
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
                    ),
                    title: Text(
                        "${context.watch<ContactProvider>().contacts[index].name}"),
                    trailing: IconButton(
                      onPressed: () {
                        context.read<ContactProvider>().removeContact(index);
                      },
                      icon: const Icon(Icons.delete),
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
