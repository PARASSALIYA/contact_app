import 'dart:io';
import 'package:contact_app/pages/contact/provier/contact_provier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HideContact extends StatefulWidget {
  const HideContact({super.key});

  @override
  State<HideContact> createState() => _HideContactState();
}

class _HideContactState extends State<HideContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hide Contact"),
        centerTitle: true,
        backgroundColor: const Color(0xff384e78),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: context.watch<ContactProvider>().hideContacts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      context.read<ContactProvider>().setSelectedIndex(index);

                      Navigator.pushNamed(context, '/contactDetail',
                          arguments: context
                              .read<ContactProvider>()
                              .hideContacts[index]);
                    },
                    leading: CircleAvatar(
                      radius: 30,
                      foregroundImage: FileImage(
                        File(
                          context
                              .watch<ContactProvider>()
                              .hideContacts[index]
                              .image
                              .toString(),
                        ),
                      ),
                    ),
                    title: Text(
                        "${context.watch<ContactProvider>().hideContacts[index].name}"),
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
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
