import 'package:flutter/material.dart';

class AffiliatedButtonProvider extends ChangeNotifier {
  bool _isClicked = false;
  bool _isBonusClicked = false;
  bool get isBonusClicked => _isBonusClicked;
  bool get isClicked => _isClicked;
  void setClicked(bool value) {
    _isClicked = value;
    notifyListeners();
  }

  void toggleBonusClicked(bool value) {
    _isBonusClicked = value;
    notifyListeners();
  }

  // void setAffiliateStatus(bool value) {
  //   _isAffiliate = value;
  //   notifyListeners();
  // }
}
