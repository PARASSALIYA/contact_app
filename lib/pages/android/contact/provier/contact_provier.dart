import 'package:contact_app/pages/android/contact/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class ContactProvider with ChangeNotifier {
  List<ContactModel> contacts = [];
  List<ContactModel> hideContacts = [];
  List<ContactModel> favoriteContacts = [];
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

  void favoriteContact(ContactModel model) {
    favoriteContacts.add(model);
    notifyListeners();
  }

  void unFavoriteContact(ContactModel model) {
    favoriteContacts.remove(model);
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

  void fRemoveContact(int index) {
    favoriteContacts.removeAt(index);
    notifyListeners();
  }

  void updateContact(ContactModel model) {
    contacts[selectedIndex] = model;
  }

  Future<bool> isLock() async {
    LocalAuthentication auth = LocalAuthentication();
    bool isBiometrics = await auth.canCheckBiometrics;
    bool isDevice = await auth.isDeviceSupported();
    if (isBiometrics && isDevice) {
      List<BiometricType> types = await auth.getAvailableBiometrics();
      if (types.isEmpty) {
        return false;
      } else {
        return auth.authenticate(
            localizedReason: " Please authenticate to continue...");
      }
    } else {
      return false;
    }
    return false;
  }

  bool isAndroid = true;
  void platformChange({required bool val}) {
    isAndroid = val;
    notifyListeners();
  }
}
