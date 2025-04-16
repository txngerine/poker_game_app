import 'dart:convert';

// To parse this JSON data, do:
// final withdrawRequestModel = withdrawRequestModelFromJson(jsonString);

WithdrawRequestModel withdrawRequestModelFromJson(String str) =>
    WithdrawRequestModel.fromJson(json.decode(str));

String withdrawRequestModelToJson(WithdrawRequestModel data) =>
    json.encode(data.toJson());

class WithdrawRequestModel {
  final String? playerId;
  final String? password;
  final String? currency;
  final String? network;
  final int? chips;
  final String? toAc; // New field

  WithdrawRequestModel({
    this.playerId,
    this.password,
    this.currency,
    this.network,
    this.chips,
    this.toAc,
  });

  factory WithdrawRequestModel.fromJson(Map<String, dynamic> json) =>
      WithdrawRequestModel(
        playerId: json["playerId"],
        password: json["password"],
        currency: json["currency"],
        network: json["network"],
        chips: json["chips"],
        toAc: json["to_ac"], // Parsing new field
      );

  Map<String, dynamic> toJson() => {
        "playerId": playerId,
        "password": password,
        "currency": currency,
        "network": network,
        "chips": chips,
        "to_ac": toAc, // Serializing new field
      };
}
