import 'package:flutter/material.dart';

class CurrencyButtonProvider extends ChangeNotifier {
  int _selectedButton = 1;
  int get selectedButton => _selectedButton;
  void selectButton(int buttonId) {
    _selectedButton = buttonId;
    notifyListeners();
  }
}
