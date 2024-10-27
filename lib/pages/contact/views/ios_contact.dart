import 'dart:io';

import 'package:contact_app/pages/contact/model/contact_model.dart';
import 'package:contact_app/pages/contact/provier/contact_provier.dart';
import 'package:contact_app/pages/profile/provider/profile_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class IosAddContact extends StatefulWidget {
  const IosAddContact({super.key});

  @override
  State<IosAddContact> createState() => _IosAddContactState();
}

class _IosAddContactState extends State<IosAddContact> {
  String? imagePath;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  late ContactProvider contactProviderW;
  late ContactProvider contactProviderR;

  @override
  Widget build(BuildContext context) {
    contactProviderW = context.watch<ContactProvider>();
    contactProviderR = context.read<ContactProvider>();
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: const Color(0xff384e78),
        middle: const Text(
          "Add Contact",
          style: TextStyle(
            color: CupertinoColors.white,
          ),
        ),
        trailing: CupertinoButton(
          padding: const EdgeInsets.all(10),
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
            contactProviderR.addContact(contact);

            nameController.clear();
            phoneController.clear();
            emailController.clear();
          },
          child: const Text(
            "Done",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
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
                          backgroundImage: FileImage(
                            File(imagePath!),
                          ),
                        ),
                      ),
                    ),
              const SizedBox(
                height: 20,
              ),
              CupertinoTextField(
                controller: nameController,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: context.watch<ProfileProvider>().darkMode
                        ? CupertinoColors.white
                        : CupertinoColors.black,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(16),
                placeholder: "Name",
                prefix: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(CupertinoIcons.person),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CupertinoTextField(
                maxLength: 10,
                keyboardType: TextInputType.phone,
                controller: phoneController,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: context.watch<ProfileProvider>().darkMode
                        ? CupertinoColors.white
                        : CupertinoColors.black,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(16),
                placeholder: "Phone Number",
                prefix: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(CupertinoIcons.phone),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CupertinoTextField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: context.watch<ProfileProvider>().darkMode
                        ? CupertinoColors.white
                        : CupertinoColors.black,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(16),
                placeholder: "Email",
                prefix: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(CupertinoIcons.mail),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CupertinoListTile(
                onTap: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) => Container(
                      height: 300,
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (DateTime value) {
                          contactProviderW.dateTimeChange(value);
                        },
                      ),
                    ),
                  );
                },
                leading: const Icon(CupertinoIcons.calendar),
                title: const Text("Date"),
                trailing: Text(
                    "${contactProviderW.dateTime.day} - ${contactProviderW.dateTime.month} - ${contactProviderW.dateTime.year}"),
              ),
              CupertinoListTile(
                onTap: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) => Container(
                      height: 300,
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.time,
                        onDateTimeChanged: (DateTime value) {
                          contactProviderR.timeChange(
                            TimeOfDay(hour: value.hour, minute: value.minute),
                          );
                        },
                      ),
                    ),
                  );
                },
                leading: const Icon(CupertinoIcons.clock),
                title: const Text("Time"),
                trailing: Text(
                    "${(contactProviderW.timeOfDay.hour % 12).toString().padLeft(2, "0")} : ${contactProviderW.timeOfDay.minute.toString().padLeft(2, "0")} : ${contactProviderW.timeOfDay.hour < 12 ? "AM" : "PM"}"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
