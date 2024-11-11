import 'dart:io';
import 'package:contact_app/pages/contact/provier/contact_provier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:contact_app/pages/contact/model/contact_model.dart';

class IosDetailPage extends StatefulWidget {
  const IosDetailPage({super.key});

  @override
  State<IosDetailPage> createState() => _IosDetailPageState();
}

class _IosDetailPageState extends State<IosDetailPage> {
  @override
  Widget build(BuildContext context) {
    ContactModel contactModel =
        ModalRoute.of(context)!.settings.arguments as ContactModel;
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: const Color(0xff384e78),
        middle: const Text(
          "Detail",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        trailing: CupertinoButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/ios_edit',
              arguments: contactModel,
            );
          },
          padding: const EdgeInsets.all(10),
          child: const Text(
            "Edit",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: 70,
                foregroundImage: FileImage(
                  File(
                    contactModel.image.toString(),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CupertinoContextMenuAction(
              child: CupertinoListTile(
                title: const Text(
                  "Name",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "${contactModel.name}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: const Icon(
                  CupertinoIcons.person_fill,
                ),
              ),
            ),
            CupertinoContextMenuAction(
              child: CupertinoListTile(
                onTap: () async {
                  Uri phone = Uri.parse("tel:${contactModel.phone}");
                  await launchUrl(phone);
                },
                title: const Text(
                  "phone",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "+91 ${contactModel.phone}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: const Icon(
                  CupertinoIcons.phone_fill,
                ),
              ),
            ),
            CupertinoContextMenuAction(
              child: CupertinoListTile(
                onTap: () {
                  Uri email = Uri.parse("mailto:${contactModel.email}");
                  launchUrl(email);
                },
                title: const Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "${contactModel.email}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: const Icon(
                  CupertinoIcons.mail_solid,
                ),
              ),
            ),
            CupertinoContextMenuAction(
              child: CupertinoListTile(
                onTap: () {
                  Share.share('${contactModel.name} \n ${contactModel.phone}');
                },
                title: const Text(
                  "Share Contact",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: const Icon(
                  CupertinoIcons.share_solid,
                ),
              ),
            ),
            CupertinoContextMenuAction(
              child: CupertinoListTile(
                onTap: () {
                  context.read<ContactProvider>().deleteContact(contactModel);
                },
                title: const Text(
                  "Delete Contact",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: const Icon(
                  CupertinoIcons.share_solid,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
