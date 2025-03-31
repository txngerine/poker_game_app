// To parse this JSON data, do
//
//     final graphModel = graphModelFromJson(jsonString);

import 'dart:convert';

GraphModel graphModelFromJson(String str) => GraphModel.fromJson(json.decode(str));

String graphModelToJson(GraphModel data) => json.encode(data.toJson());

class GraphModel {
    String? status;
    Data? data;

    GraphModel({
        this.status,
        this.data,
    });

    factory GraphModel.fromJson(Map<String, dynamic> json) => GraphModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
    };
}

class Data {
    Player? player;
    List<History>? history;

    Data({
        this.player,
        this.history,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        player: json["player"] == null ? null : Player.fromJson(json["player"]),
        history: json["history"] == null ? [] : List<History>.from(json["history"]!.map((x) => History.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "player": player?.toJson(),
        "history": history == null ? [] : List<dynamic>.from(history!.map((x) => x.toJson())),
    };
}

class History {
    int? id;
    String? win;
    DateTime? createdAt;

    History({
        this.id,
        this.win,
        this.createdAt,
    });

    factory History.fromJson(Map<String, dynamic> json) => History(
        id: json["id"],
        win: json["win"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "win": win,
        "created_at": createdAt?.toIso8601String(),
    };
}

class Player {
    String? nickname;
    DateTime? regDate;
    String? photo;
    int? handsPlayed;
    String? winnings;
    String? countryFlag;

    Player({
        this.nickname,
        this.regDate,
        this.photo,
        this.handsPlayed,
        this.winnings,
        this.countryFlag,
    });

    factory Player.fromJson(Map<String, dynamic> json) => Player(
        nickname: json["nickname"],
        regDate: json["reg_date"] == null ? null : DateTime.parse(json["reg_date"]),
        photo: json["photo"],
        handsPlayed: json["hands_played"],
        winnings: json["winnings"],
        countryFlag: json["country_flag"],
    );

    Map<String, dynamic> toJson() => {
        "nickname": nickname,
        "reg_date": regDate?.toIso8601String(),
        "photo": photo,
        "hands_played": handsPlayed,
        "winnings": winnings,
        "country_flag": countryFlag,
    };
}
