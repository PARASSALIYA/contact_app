import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IosAddContact extends StatefulWidget {
  const IosAddContact({super.key});

  @override
  State<IosAddContact> createState() => _IosAddContactState();
}

class _IosAddContactState extends State<IosAddContact> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.white),
            )),
        backgroundColor: const Color(0xff384e78),
        middle: const Text("Add Contact"),
        trailing: TextButton(
          onPressed: () {},
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
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const CircleAvatar(
              radius: 70,
              backgroundColor: Color(0xff384e78),
              child: Icon(
                CupertinoIcons.person_fill,
                size: 60,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CupertinoTextField(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(1.5, 1.5),
                  ),
                  BoxShadow(
                    color: Colors.white.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(-1.5, -1.5),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              placeholder: "Name",
              placeholderStyle: const TextStyle(
                color: Colors.white,
              ),
              style: const TextStyle(
                color: Colors.white,
              ),
              prefix: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(CupertinoIcons.person),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CupertinoTextField(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(1.5, 1.5),
                  ),
                  BoxShadow(
                    color: Colors.white.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(-1.5, -1.5),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              placeholder: "Phone Number",
              placeholderStyle: const TextStyle(
                color: Colors.white,
              ),
              prefix: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(CupertinoIcons.phone),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CupertinoTextField(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(1.5, 1.5),
                  ),
                  BoxShadow(
                    color: Colors.white.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(-1.5, -1.5),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              placeholder: "Email",
              placeholderStyle: const TextStyle(
                color: Colors.white,
              ),
              prefix: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(CupertinoIcons.mail),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
