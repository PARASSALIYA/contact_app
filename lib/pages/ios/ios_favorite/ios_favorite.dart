import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IosFavorite extends StatefulWidget {
  const IosFavorite({super.key});

  @override
  State<IosFavorite> createState() => _IosFavoriteState();
}

class _IosFavoriteState extends State<IosFavorite> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: const Color(0xff384e78),
        middle: const Text(
          "Favorite",
          style: TextStyle(fontSize: 20),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            CupertinoIcons.add,
            color: Colors.white,
          ),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              color: Color(0xff384e78),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text("Favorite Page"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
