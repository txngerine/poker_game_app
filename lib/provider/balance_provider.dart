// import 'package:flutter/material.dart';
//
// import '../model/login_response_model.dart';
//
// class BalanceProvider with ChangeNotifier {
//   LoginResponseModel? _playerDetails;
//   int _balance = 0;
//
//   int get balance => _balance;
//   LoginResponseModel? get playerDetails => _playerDetails;
//
//   void setPlayerDetails(LoginResponseModel details) {
//     _playerDetails = details;
//     _balance = int.tryParse(details.data?.balance?.toString() ?? '0') ?? 0;
//     notifyListeners();
//   }
//
//   void updateBalance(int newBalance) {
//     _balance = newBalance;
//     notifyListeners();
//   }
// }
