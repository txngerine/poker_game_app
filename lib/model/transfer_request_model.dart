// To parse this JSON data, do
//
//     final transferRequestModel = transferRequestModelFromJson(jsonString);

import 'dart:convert';

TransferRequestModel transferRequestModelFromJson(String str) =>
    TransferRequestModel.fromJson(json.decode(str));

String transferRequestModelToJson(TransferRequestModel data) =>
    json.encode(data.toJson());

class TransferRequestModel {
  final String? password;
  final String? chips;
  final String? from;
  final String? to;

  TransferRequestModel({
    this.password,
    this.chips,
    this.from,
    this.to,
  });

  factory TransferRequestModel.fromJson(Map<String, dynamic> json) =>
      TransferRequestModel(
        password: json["password"],
        chips: json["chips"],
        from: json["from"],
        to: json["to"],
      );

  Map<String, dynamic> toJson() => {
        "password": password,
        "chips": chips,
        "from": from,
        "to": to,
      };
}
