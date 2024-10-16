import 'package:contact_app/pages/contact/model/contact_model.dart';
import 'package:flutter/material.dart';

class ContactProvider with ChangeNotifier {
  List<ContactModel> contacts = [];

  void addContact(ContactModel contact) {
    contacts.add(contact);
    notifyListeners();
  }

  void removeContact(int index) {
    contacts.removeAt(index);
    notifyListeners();
  }

  void updateContact(int index, ContactModel model) {
    contacts[index] = model;
  }
}
