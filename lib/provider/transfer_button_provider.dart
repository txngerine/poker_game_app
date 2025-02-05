import 'package:flutter/widgets.dart';

class TransferButtonProvider extends ChangeNotifier {
  bool _isClicked = false;
  bool get isClicked => _isClicked;
  void setClick(bool value) {
    _isClicked = value;
    notifyListeners();
  }
}
