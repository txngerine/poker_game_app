import 'package:flutter/material.dart';

class AffiliatedButtonProvider extends ChangeNotifier {
  bool _isClicked = false;
  bool get isClicked => _isClicked;
  void setClicked(bool value) {
    _isClicked = value;
    notifyListeners();
  }
}
