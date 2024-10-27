// import 'dart:io';
//
// import 'package:contact_app/pages/contact/provier/contact_provier.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class FavoritePage extends StatefulWidget {
//   const FavoritePage({super.key});
//
//   @override
//   State<FavoritePage> createState() => _FavoritePageState();
// }
//
// class _FavoritePageState extends State<FavoritePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xff384e78),
//         foregroundColor: Colors.white,
//         centerTitle: true,
//         title: const Text('Favorite'),
//       ),
//       body: ListView.builder(
//         itemCount: context.watch<ContactProvider>().favoriteContacts.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             onTap: () {
//               context.read<ContactProvider>().setSelectedIndex(index);
//
//               Navigator.pushNamed(context, '/contactDetail',
//                   arguments:
//                       context.read<ContactProvider>().favoriteContacts[index]);
//             },
//             leading: CircleAvatar(
//               radius: 30,
//               foregroundImage: FileImage(
//                 File(
//                   context
//                       .watch<ContactProvider>()
//                       .favoriteContacts[index]
//                       .image
//                       .toString(),
//                 ),
//               ),
//             ),
//             title: Text(
//                 "${context.watch<ContactProvider>().favoriteContacts[index].name}"),
//             trailing: IconButton(
//               onPressed: () {
//                 context.read<ContactProvider>().fRemoveContact(index);
//               },
//               icon: const Icon(Icons.delete),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
