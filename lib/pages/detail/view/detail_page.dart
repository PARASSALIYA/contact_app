import 'dart:io';
import 'package:contact_app/pages/contact/provier/contact_provier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:contact_app/pages/contact/model/contact_model.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ContactModel contactModel =
        ModalRoute.of(context)!.settings.arguments as ContactModel;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Details"),
        centerTitle: true,
        backgroundColor: const Color(0xff384e78),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              context.read<ContactProvider>().hideContact(contactModel);
            },
            icon: const Icon(Icons.lock),
          ),
          PopupMenuButton(onSelected: (value) {
            if (value == 1) {
              context.read<ContactProvider>().hideContact(contactModel);
            }
            if (value == 2) {
              context.read<ContactProvider>().unHideContact(contactModel);
            }
            if (value == 3) {
              context.read<ContactProvider>().unHideContact(contactModel);
            }
          }, itemBuilder: (context) {
            return [
              const PopupMenuItem(
                value: 1,
                child: Text("Hide"),
              ),
              const PopupMenuItem(
                value: 2,
                child: Text("UnHide"),
              ),
              PopupMenuItem(
                onTap: () {
                  Share.share("${contactModel.name} \n ${contactModel.phone}");
                },
                value: 2,
                child: const Text("Share"),
              ),
              const PopupMenuItem(
                value: 2,
                child: Text("Delete Contact"),
              ),
            ];
          }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.grey,
                  backgroundImage: FileImage(
                    File(contactModel.image!),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "${contactModel.name}",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ListTile(
                onTap: () async {
                  Uri phone = Uri.parse("tel:${contactModel.phone}");
                  await launchUrl(phone);
                },
                title: const Text(
                  "Phone",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "${contactModel.phone}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: const Icon(
                  Icons.call,
                  color: Color(0xff384e78),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                onTap: () {
                  Uri email = Uri.parse("mailto:${contactModel.email}");
                  launchUrl(email);
                },
                title: const Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "${contactModel.email}",
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                trailing: const Icon(
                  Icons.email,
                  color: Color(0xff384e78),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      (context.read<ContactProvider>().favoriteContacts)
                              .contains(contactModel)
                          ? context
                              .read<ContactProvider>()
                              .unFavoriteContact(contactModel)
                          : context
                              .read<ContactProvider>()
                              .favoriteContact(contactModel);
                      (context.read<ContactProvider>().favoriteContacts)
                              .contains(contactModel)
                          ? context
                              .read<ContactProvider>()
                              .contacts
                              .remove(contactModel)
                          : context
                              .read<ContactProvider>()
                              .contacts
                              .add(contactModel);

                      Navigator.pop(context);
                    },
                    icon: (context.read<ContactProvider>().favoriteContacts)
                            .contains(contactModel)
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(Icons.favorite_border),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/edit',
                          arguments: contactModel);
                    },
                    icon: const Icon(Icons.edit),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
