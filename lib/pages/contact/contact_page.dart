import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
      appBar: AppBar(
        backgroundColor: const Color(0xff384e78),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Contact'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Theme(
                data: ThemeData(
                  colorSchemeSeed: const Color(0xff384e78),
                ),
                child: Stepper(
                  connectorColor: const WidgetStatePropertyAll(
                    Color(0xff384e78),
                  ),
                  stepIconMargin: const EdgeInsets.only(bottom: 10),
                  currentStep: currentStep,
                  onStepContinue: () {
                    setState(() {
                      if (currentStep < 4) {
                        currentStep++;
                      }
                    });
                  },
                  onStepCancel: () {
                    setState(() {
                      if (currentStep > 0) {
                        currentStep--;
                      }
                    });
                  },
                  steps: [
                    // Image
                    Step(
                      title: const Text("Personal Info"),
                      content: Column(
                        children: [
                          (imagePath == null)
                              ? const CircleAvatar(radius: 80)
                              : CircleAvatar(
                                  radius: 80,
                                  backgroundImage: FileImage(
                                    File(imagePath!),
                                  ),
                                ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () async {
                              ImagePicker imagePicker = ImagePicker();

                              XFile? xfile = await imagePicker.pickImage(
                                source: ImageSource.gallery,
                                imageQuality: 100,
                              );
                              imagePath = xfile!.path;
                              setState(() {});
                            },
                            style: const ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Color(0xff384e78),
                              ),
                            ),
                            child: const Text(
                              "Get Image",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Name
                    Step(
                      title: const Text("Name"),
                      content: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: const Icon(Icons.person),
                          hintText: "Enter Name",
                          hintStyle: const TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    // Phone
                    Step(
                      title: const Text("Phone"),
                      content: TextField(
                        maxLength: 10,
                        controller: phoneController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: const Icon(Icons.phone),
                          hintText: "Enter Phone",
                          hintStyle: const TextStyle(color: Colors.grey),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    //Email
                    Step(
                      title: const Text("Email"),
                      content: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: const Icon(Icons.email),
                          hintText: "Enter Email",
                          hintStyle: const TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    // save
                    Step(
                      title: const Text("Save"),
                      content: Column(
                        children: [
                          ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Color(0xff384e78),
                              ),
                              foregroundColor: WidgetStatePropertyAll(
                                Colors.white,
                              ),
                            ),
                            onPressed: () {
                              String name = nameController.text;
                              String phone = phoneController.text;
                              String email = emailController.text;
                              String? image = imagePath;

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.green,
                                  content: Text("Save Successfully..."),
                                ),
                              );
                            },
                            child: const Text("Save"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
