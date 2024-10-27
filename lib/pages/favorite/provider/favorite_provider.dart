import 'package:contact_app/pages/contact/model/contact_model.dart';
import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  List<ContactModel> favoriteContacts = [];
  void favoriteContact(ContactModel model) {
    favoriteContacts.add(model);
    notifyListeners();
  }

  void unFavoriteContact(ContactModel model) {
    favoriteContacts.remove(model);
    notifyListeners();
  }

  void fRemoveContact(int index) {
    favoriteContacts.removeAt(index);
    notifyListeners();
  }
}
