import 'package:contact_app/pages/contact/model/contact_model.dart';
import 'package:flutter/cupertino.dart';

class IosDetailPage extends StatefulWidget {
  const IosDetailPage({super.key});

  @override
  State<IosDetailPage> createState() => _IosDetailPageState();
}

class _IosDetailPageState extends State<IosDetailPage> {
  @override
  Widget build(BuildContext context) {
    ContactModel contactModel =
        ModalRoute.of(context)!.settings.arguments as ContactModel;
    return CupertinoPageScaffold(
      child: Column(
        children: [
          Text(contactModel.name!),
          Text(contactModel.phone!),
          Text(contactModel.email!),
        ],
      ),
    );
  }
}
