// To parse this JSON data, do
//
//     final playerSignupRequestModel = playerSignupRequestModelFromJson(jsonString);

import 'dart:convert';

PlayerSignupRequestModel playerSignupRequestModelFromJson(String str) =>
    PlayerSignupRequestModel.fromJson(json.decode(str));

String playerSignupRequestModelToJson(PlayerSignupRequestModel data) =>
    json.encode(data.toJson());

class PlayerSignupRequestModel {
  final String? email;
  final String? password;
  final int? deviceId;
  final String? accountNo;

  PlayerSignupRequestModel({
    this.email,
    this.password,
    this.deviceId,
    this.accountNo,
  });

  factory PlayerSignupRequestModel.fromJson(Map<String, dynamic> json) =>
      PlayerSignupRequestModel(
        email: json["email"],
        password: json["password"],
        deviceId: json["deviceId"],
        accountNo: json["account_no"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "deviceId": deviceId,
        "account_no": accountNo,
      };
}
