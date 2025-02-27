import 'package:flutter/widgets.dart';

class TransferButtonProvider extends ChangeNotifier {
  bool _isClicked = false;
  bool _isMarked = false;

  bool get isClicked => _isClicked;
  bool get isMarked => _isMarked;

  void setClick(bool value) {
    _isClicked = value;
    notifyListeners();
  }

  void setMarker(bool value) {
    _isMarked = value; // ✅ Corrected assignment
    notifyListeners();
  }

  void toggleMarker() {
    _isMarked = !_isMarked;
    notifyListeners();
  }
}
