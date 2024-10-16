import 'dart:io';
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
        backgroundColor: const Color(0xff384e78),
        foregroundColor: Colors.white,
        leading: const Icon(Icons.menu),
        centerTitle: true,
        title: const Text('Contact App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: context.watch<ContactProvider>().contacts.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {},
              onLongPress: () {
                Navigator.pushNamed(context, '/contact', arguments: index);
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
              subtitle: Text(
                  "${context.watch<ContactProvider>().contacts[index].phone}"),
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
