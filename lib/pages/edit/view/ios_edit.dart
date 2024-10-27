import 'dart:io';

import 'package:contact_app/pages/contact/model/contact_model.dart';
import 'package:contact_app/pages/contact/provier/contact_provier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class IosEditPage extends StatefulWidget {
  const IosEditPage({super.key});

  @override
  State<IosEditPage> createState() => _IosEditPageState();
}

class _IosEditPageState extends State<IosEditPage> {
  String? imagePath;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ContactModel iosEditContact =
        ModalRoute.of(context)!.settings.arguments as ContactModel;

    nameController.text = iosEditContact.name!;
    phoneController.text = iosEditContact.phone!;
    emailController.text = iosEditContact.email!;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: const Color(0xff384e78),
        middle: const Text(
          'Edit Contact',
          style: TextStyle(color: CupertinoColors.white, fontSize: 20),
        ),
        trailing: CupertinoButton(
          padding: const EdgeInsets.all(10),
          onPressed: () {
            iosEditContact.name = nameController.text;
            iosEditContact.phone = phoneController.text;
            iosEditContact.email = emailController.text;

            context.read<ContactProvider>().updateContact(iosEditContact);

            Navigator.pop(context);
          },
          child: const Text('Save'),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (imagePath == null)
                ? GestureDetector(
                    onTap: () async {
                      ImagePicker imagePicker = ImagePicker();

                      XFile? xfile = await imagePicker.pickImage(
                        source: ImageSource.gallery,
                        imageQuality: 100,
                      );
                      imagePath = xfile!.path;
                      setState(() {});
                    },
                    child: const Center(
                      child: CircleAvatar(
                        radius: 80,
                        backgroundImage: NetworkImage(
                            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: () async {
                      ImagePicker imagePicker = ImagePicker();

                      XFile? xfile = await imagePicker.pickImage(
                        source: ImageSource.gallery,
                        imageQuality: 100,
                      );
                      imagePath = xfile!.path;
                      setState(() {});
                    },
                    child: Center(
                      child: CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.grey,
                        backgroundImage: FileImage(
                          File(imagePath!),
                        ),
                      ),
                    ),
                  ),
            const SizedBox(
              height: 20,
            ),
            CupertinoContextMenuAction(
              child: CupertinoTextField(
                placeholder: "Name",
                controller: nameController,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CupertinoContextMenuAction(
              child: CupertinoTextField(
                placeholder: "Phone",
                controller: phoneController,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CupertinoContextMenuAction(
              child: CupertinoTextField(
                placeholder: "Email",
                controller: emailController,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
