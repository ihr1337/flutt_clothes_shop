import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  bool _userLoggedIn = false;

  bool get userLoggedIn => _userLoggedIn;

  void isUserLoggedIn(bool userLoggedIn) {
    _userLoggedIn = userLoggedIn;
    notifyListeners();
  }
}
