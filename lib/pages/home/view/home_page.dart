import 'dart:io';
import 'package:alphabet_slider/alphabet_slider.dart';
import 'package:contact_app/pages/contact/provier/contact_provier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              bool islock = await context.read<ContactProvider>().isLock();

              if (islock) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Please authenticate to continue"),
                  ),
                );
              } else {
                Navigator.pushNamed(context, '/hide');
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
        leading: const Icon(Icons.menu),
        centerTitle: true,
        title: const Text('Contact App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount:
                    context.watch<ContactProvider>().favoriteContacts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      context.read<ContactProvider>().setSelectedIndex(index);

                      Navigator.pushNamed(context, '/contactDetail',
                          arguments: context
                              .read<ContactProvider>()
                              .favoriteContacts[index]);
                    },
                    leading: CircleAvatar(
                      radius: 30,
                      foregroundImage: FileImage(
                        File(
                          context
                              .watch<ContactProvider>()
                              .favoriteContacts[index]
                              .image
                              .toString(),
                        ),
                      ),
                    ),
                    title: Text(
                        "${context.watch<ContactProvider>().favoriteContacts[index].name}"),
                    trailing: IconButton(
                      onPressed: () {
                        context.read<ContactProvider>().fRemoveContact(index);
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  );
                },
              ),
            ),
            const Divider(),
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
                      icon: const Icon(Icons.delete),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xff384e78),
        onPressed: () {
          Navigator.pushNamed(context, "/contact");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
