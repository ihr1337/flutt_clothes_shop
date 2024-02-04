import 'package:flutter/material.dart';

class LoaderProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void enableLoader() {
    _isLoading = true;
    notifyListeners();
  }

  void disableLoader() {
    _isLoading = false;
    notifyListeners();
  }
}
