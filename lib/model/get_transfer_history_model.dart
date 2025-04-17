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
  final Nickname? nickname;
  final String? avatar;
  final String? avatarThumb;
  final int? playerIdRef;
  final String? chip;
  final Type? type;
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
        nickname: nicknameValues.map[json["nickname"]]!,
        avatar: json["avatar"],
        avatarThumb: json["avatar_thumb"],
        playerIdRef: json["player_id_ref"],
        chip: json["chip"],
        type: typeValues.map[json["type"]]!,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "nickname": nicknameValues.reverse[nickname],
        "avatar": avatar,
        "avatar_thumb": avatarThumb,
        "player_id_ref": playerIdRef,
        "chip": chip,
        "type": typeValues.reverse[type],
        "created_at": createdAt?.toIso8601String(),
      };
}

enum Nickname { GAMER1, HAIGAMERA }

final nicknameValues =
    EnumValues({"Gamer1": Nickname.GAMER1, "haigamera": Nickname.HAIGAMERA});

enum Type { TRANSFER }

final typeValues = EnumValues({"Transfer": Type.TRANSFER});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
