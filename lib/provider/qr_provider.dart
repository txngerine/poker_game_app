import 'package:flutter/material.dart';

class QrProvider extends ChangeNotifier {
  String _scannedCode = "";
  String get scannedCode => _scannedCode;
  void setScannedCode(String code) {
    _scannedCode = code;
    notifyListeners();
  }
}
