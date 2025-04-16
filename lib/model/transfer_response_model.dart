import 'dart:convert';

TransferResponseModel transferResponseModelFromJson(String str) =>
    TransferResponseModel.fromJson(json.decode(str));

String transferResponseModelToJson(TransferResponseModel data) =>
    json.encode(data.toJson());

class TransferResponseModel {
  final String? status;
  final Data? data;
  final Map<String, String>? messages;

  TransferResponseModel({
    this.status,
    this.data,
    this.messages,
  });

  factory TransferResponseModel.fromJson(Map<String, dynamic> json) =>
      TransferResponseModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        messages: json["messages"] == null
            ? null
            : Map<String, String>.from(json["messages"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
        "messages": messages,
      };
}

class Data {
  final double? balance;

  Data({
    this.balance,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        balance: json["balance"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "balance": balance,
      };
}
