import 'package:contact_app/pages/contact/provier/contact_provier.dart';
import 'package:contact_app/pages/contact/views/ios_contact.dart';
import 'package:contact_app/pages/home/provider/home_provider.dart';
import 'package:contact_app/pages/profile/provider/profile_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:contact_app/pages/ios/ios_favorite/ios_favorite.dart';

class IosHomePage extends StatefulWidget {
  const IosHomePage({super.key});

  @override
  State<IosHomePage> createState() => _IosHomePageState();
}

class _IosHomePageState extends State<IosHomePage> {
  late HomeProvider homeProviderW = HomeProvider();
  late HomeProvider homeProviderR = HomeProvider();
  List pages = [
    const IosHomePage(),
    const IosFavorite(),
    const IosAddContact(),
  ];
  @override
  Widget build(BuildContext context) {
    homeProviderW = context.watch<HomeProvider>();
    homeProviderR = context.read<HomeProvider>();
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: const Color(0xff384e78),
        trailing: CupertinoSwitch(
          value: context.watch<ProfileProvider>().isAndroid,
          onChanged: (value) {
            context.read<ProfileProvider>().platformChange(val: value);
          },
        ),
        middle: const Text(
          "Paras",
          style: TextStyle(fontSize: 20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // children: [
            //   CupertinoButton(
            //     onPressed: () {
            //       showCupertinoModalPopup(
            //         context: context,
            //         builder: (context) {
            //           return CupertinoActionSheet(
            //             actions: [
            //               CupertinoActionSheetAction(
            //                 onPressed: () {},
            //                 child: const Text("Paras"),
            //               ),
            //               CupertinoActionSheetAction(
            //                 onPressed: () {},
            //                 child: const Text("Saliya"),
            //               ),
            //               CupertinoActionSheetAction(
            //                 onPressed: () {},
            //                 child: const Text("Paras Saliya"),
            //               ),
            //             ],
            //           );
            //         },
            //       );
            //     },
            //     child: const Text("Paras"),
            //   ),
            //   CupertinoContextMenu(
            //     actions: [
            //       CupertinoContextMenuAction(
            //         onPressed: () {},
            //         child: const Text("Paras"),
            //       ),
            //       CupertinoContextMenuAction(
            //         onPressed: () {},
            //         child: const Text("Saliya"),
            //       ),
            //       CupertinoContextMenuAction(
            //         onPressed: () {},
            //         child: const Text("Paras Saliya"),
            //       ),
            //     ],
            //     child: const Text("Paras Saliya"),
            //   ),
            CupertinoButton(
              child: Text(
                  "${homeProviderW.dateTime.day} - ${homeProviderW.dateTime.month} - ${homeProviderW.dateTime.year}"),
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) => Container(
                    height: 300,
                    child: CupertinoDatePicker(
                      onDateTimeChanged: (DateTime value) {
                        homeProviderR.dateTimeChange(value);
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
