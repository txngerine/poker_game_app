// To parse this JSON data, do
//
//     final getTransferHistoryModel = getTransferHistoryModelFromJson(jsonString);

import 'dart:convert';

GetTransferHistoryModel getTransferHistoryModelFromJson(String str) =>
    GetTransferHistoryModel.fromJson(json.decode(str));

String getTransferHistoryModelToJson(GetTransferHistoryModel data) =>
    json.encode(data.toJson());

class GetTransferHistoryModel {
  final String? status;
  final Data? data;

  GetTransferHistoryModel({
    this.status,
    this.data,
  });

  factory GetTransferHistoryModel.fromJson(Map<String, dynamic> json) =>
      GetTransferHistoryModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  final int? draw;
  final int? recordsTotal;
  final int? recordsFiltered;
  final List<Datum>? data;

  Data({
    this.draw,
    this.recordsTotal,
    this.recordsFiltered,
    this.data,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        draw: json["draw"],
        recordsTotal: json["recordsTotal"],
        recordsFiltered: json["recordsFiltered"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "draw": draw,
        "recordsTotal": recordsTotal,
        "recordsFiltered": recordsFiltered,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  final String? nickname;
  final String? avatar;
  final String? avatarThumb;
  final int? playerIdRef;
  final String? chip;
  final String? type;
  final DateTime? createdAt;

  Datum({
    this.nickname,
    this.avatar,
    this.avatarThumb,
    this.playerIdRef,
    this.chip,
    this.type,
    this.createdAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        nickname: json["nickname"],
        avatar: json["avatar"],
        avatarThumb: json["avatar_thumb"],
        playerIdRef: json["player_id_ref"],
        chip: json["chip"],
        type: json["type"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "nickname": nickname,
        "avatar": avatar,
        "avatar_thumb": avatarThumb,
        "player_id_ref": playerIdRef,
        "chip": chip,
        "type": type,
        "created_at": createdAt?.toIso8601String(),
      };
}
