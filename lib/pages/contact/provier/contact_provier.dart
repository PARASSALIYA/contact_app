import 'package:contact_app/pages/contact/model/contact_model.dart';
import 'package:flutter/material.dart';

class ContactProvider with ChangeNotifier {
  List<ContactModel> contacts = [];
  List<ContactModel> hideContacts = [];
  int selectedIndex = 0;
  String? imagePath;
  void setSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void hideContact(ContactModel model) {
    hideContacts.add(model);
    contacts.removeAt(selectedIndex);
    notifyListeners();
  }

  void unHideContact(ContactModel model) {
    hideContacts.remove(model);
    contacts.insert(selectedIndex, model);
    notifyListeners();
  }

  void addContact(ContactModel contact) {
    contacts.add(contact);
    notifyListeners();
  }

  void removeContact(int index) {
    contacts.removeAt(index);
    notifyListeners();
  }

  void updateContact(ContactModel model) {
    contacts[selectedIndex] = model;
  }
}
