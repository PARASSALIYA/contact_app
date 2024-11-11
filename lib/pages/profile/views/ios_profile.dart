import 'package:contact_app/pages/profile/provider/profile_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class IosProfilePage extends StatefulWidget {
  const IosProfilePage({super.key});

  @override
  State<IosProfilePage> createState() => _IosProfilePageState();
}

class _IosProfilePageState extends State<IosProfilePage> {
  String? imagePath;

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: const Color(0xff384e78),
        middle: const Text(
          "Profile",
          style: TextStyle(color: CupertinoColors.white),
        ),
        trailing: CupertinoButton(
          padding: const EdgeInsets.all(10),
          child: const Text("Save"),
          onPressed: () {},
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
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
                    "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png",
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              nameController.text.isEmpty ? "" : "UserName",
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
            CupertinoListTile(
              title: const Text("Dark Mode"),
              trailing: Consumer<ProfileProvider>(
                builder: (BuildContext context, ProfileProvider value,
                        Widget? child) =>
                    CupertinoSwitch(
                  value: context.watch<ProfileProvider>().darkMode,
                  onChanged: (val) {
                    context.read<ProfileProvider>().isDark(val);
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CupertinoListTile(
              title: const Text("Platform"),
              trailing: Consumer<ProfileProvider>(
                builder: (BuildContext context, ProfileProvider value,
                        Widget? child) =>
                    CupertinoSwitch(
                  value: context.watch<ProfileProvider>().isAndroid,
                  onChanged: (val) {
                    context.read<ProfileProvider>().platformChange(val: val);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
