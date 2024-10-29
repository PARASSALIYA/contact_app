import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:contact_app/pages/favorite/provider/favorite_provider.dart';

class IosFavoritePage extends StatefulWidget {
  const IosFavoritePage({super.key});

  @override
  State<IosFavoritePage> createState() => _IosFavoritePageState();
}

class _IosFavoritePageState extends State<IosFavoritePage> {
  late FavoriteProvider favoriteProviderW = FavoriteProvider();
  late FavoriteProvider favoriteProviderR = FavoriteProvider();

  @override
  Widget build(BuildContext context) {
    favoriteProviderW = context.watch<FavoriteProvider>();
    favoriteProviderR = context.read<FavoriteProvider>();
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: Color(0xff384e78),
        middle: Text(
          "Favorite",
          style: TextStyle(fontSize: 20, color: CupertinoColors.white),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ...favoriteProviderW.favoriteContacts.map(
              (e) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/ios_detail', arguments: e);
                },
                child: CupertinoListTile(
                  trailing: CupertinoButton(
                      padding: const EdgeInsets.all(10),
                      child: const Icon(CupertinoIcons.delete_solid),
                      onPressed: () {
                        favoriteProviderR.unFavoriteContact(e);
                      }),
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
