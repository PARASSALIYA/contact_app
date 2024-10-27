import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:contact_app/pages/profile/provider/profile_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? imagePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff384e78),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
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
                      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            TextField(
              // controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: "Enter Name",
                hintStyle: const TextStyle(color: Colors.grey),
              ),
            ),
            ListTile(
              title: const Text("Dark Mode"),
              trailing: Consumer<ProfileProvider>(
                builder: (BuildContext context, ProfileProvider value,
                        Widget? child) =>
                    Switch(
                  value: context.watch<ProfileProvider>().darkMode,
                  onChanged: (val) {
                    context.read<ProfileProvider>().isDark(val);
                  },
                ),
              ),
            ),
            ListTile(
              title: const Text("Platform"),
              trailing: Consumer<ProfileProvider>(
                builder: (BuildContext context, ProfileProvider value,
                        Widget? child) =>
                    Switch(
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
