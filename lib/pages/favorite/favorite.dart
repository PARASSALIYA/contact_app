import 'dart:io';

import 'package:contact_app/pages/contact/provier/contact_provier.dart';
import 'package:contact_app/pages/favorite/provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  FavoriteProvider favoriteW = FavoriteProvider();
  FavoriteProvider favoriteR = FavoriteProvider();

  @override
  Widget build(BuildContext context) {
    favoriteW = context.watch<FavoriteProvider>();
    favoriteR = context.read<FavoriteProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff384e78),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Favorite'),
      ),
      body: ListView.builder(
        itemCount: favoriteW.favoriteContacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              context.read<ContactProvider>().setSelectedIndex(index);

              Navigator.pushNamed(context, '/contactDetail',
                  arguments: favoriteR.favoriteContacts[index]);
            },
            leading: CircleAvatar(
              radius: 30,
              foregroundImage: FileImage(
                File(
                  favoriteW.favoriteContacts[index].image.toString(),
                ),
              ),
            ),
            title: Text(
                "${context.watch<FavoriteProvider>().favoriteContacts[index].name}"),
            trailing: IconButton(
              onPressed: () {
                context.read<FavoriteProvider>().fRemoveContact(index);
              },
              icon: const Icon(Icons.delete),
            ),
          );
        },
      ),
    );
  }
}
