import 'dart:io';
import 'package:contact_app/pages/android/contact/model/contact_model.dart';
import 'package:contact_app/pages/android/contact/provier/contact_provier.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  int currentStep = 0;
  String? imagePath;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xff384e78).withOpacity(0.5),
      appBar: AppBar(
        backgroundColor: const Color(0xff384e78),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Add Contact'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {
              String name = nameController.text;
              String phone = phoneController.text;
              String email = emailController.text;
              String? image = imagePath.toString();
              ContactModel contact = ContactModel(
                name: name,
                phone: phone,
                email: email,
                image: image,
              );
              context.read<ContactProvider>().addContact(contact);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.green,
                  content: Text("Save Successfully..."),
                ),
              );
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.check,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Center(
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
                const Text(
                  "Name",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: const Icon(Icons.person),
                    hintText: "Enter Name",
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Phone",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  maxLength: 10,
                  controller: phoneController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: const Icon(Icons.phone),
                    hintText: "Enter Phone",
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: const Icon(Icons.email),
                    hintText: "Enter Email",
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
