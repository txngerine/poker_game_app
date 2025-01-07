// To parse this JSON data, do
//
//     final playerSignupResponseModel = playerSignupResponseModelFromJson(jsonString);

import 'dart:convert';

PlayerSignupResponseModel playerSignupResponseModelFromJson(String str) =>
    PlayerSignupResponseModel.fromJson(json.decode(str));

String playerSignupResponseModelToJson(PlayerSignupResponseModel data) =>
    json.encode(data.toJson());

class PlayerSignupResponseModel {
  final String? status;
  final Data? data;

  PlayerSignupResponseModel({
    this.status,
    this.data,
  });

  factory PlayerSignupResponseModel.fromJson(Map<String, dynamic> json) =>
      PlayerSignupResponseModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  final int? step;
  final int? id;

  Data({
    this.step,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        step: json["step"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "step": step,
        "id": id,
      };
}
