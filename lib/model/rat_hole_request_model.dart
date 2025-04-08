// To parse this JSON data, do
//
//     final ratHoleRequestModel = ratHoleRequestModelFromJson(jsonString);

import 'dart:convert';

RatHoleRequestModel ratHoleRequestModelFromJson(String str) =>
    RatHoleRequestModel.fromJson(json.decode(str));

String ratHoleRequestModelToJson(RatHoleRequestModel data) =>
    json.encode(data.toJson());

class RatHoleRequestModel {
  final String? roomId;
  final int? playerId;
  final String? buyIn;

  RatHoleRequestModel({
    this.roomId,
    this.playerId,
    this.buyIn,
  });

  factory RatHoleRequestModel.fromJson(Map<String, dynamic> json) =>
      RatHoleRequestModel(
        roomId: json["room_id"],
        playerId: json["player_id"],
        buyIn: json["buy_in"],
      );

  Map<String, dynamic> toJson() => {
        "room_id": roomId,
        "player_id": playerId,
        "buy_in": buyIn,
      };
}
