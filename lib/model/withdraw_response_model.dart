import 'dart:convert';

WithdrawResponseModel withdrawResponseModelFromJson(String str) =>
    WithdrawResponseModel.fromJson(json.decode(str));

String withdrawResponseModelToJson(WithdrawResponseModel data) =>
    json.encode(data.toJson());

class WithdrawResponseModel {
  final String? status;
  final String? messages;
  final Data? data;

  WithdrawResponseModel({
    this.status,
    this.messages,
    this.data,
  });

  factory WithdrawResponseModel.fromJson(Map<String, dynamic> json) =>
      WithdrawResponseModel(
        status: json["status"],
        messages: json["status"] == "FAIL" ? json["messages"] : null,
        data: json["status"] == "SUCCESS" && json["data"] != null
            ? Data.fromJson(json["data"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        if (status == "FAIL") "messages": messages,
        if (status == "SUCCESS") "data": data?.toJson(),
      };
}

class Data {
  final int? id;
  final String? playerId;
  final int? chips;
  final int? coin;
  final String? toAc;

  Data({
    this.id,
    this.playerId,
    this.chips,
    this.coin,
    this.toAc,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        playerId: json["playerId"],
        chips: json["chips"],
        coin: json["coin"],
        toAc: json["to_ac"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "playerId": playerId,
        "chips": chips,
        "coin": coin,
        "to_ac": toAc,
      };
}
