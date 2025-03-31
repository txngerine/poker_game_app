// To parse this JSON data, do
//
//     final leaderboardMonthly = leaderboardMonthlyFromJson(jsonString);

import 'dart:convert';

LeaderboardMonthly leaderboardMonthlyFromJson(String str) => LeaderboardMonthly.fromJson(json.decode(str));

String leaderboardMonthlyToJson(LeaderboardMonthly data) => json.encode(data.toJson());

class LeaderboardMonthly {
    String? status;
    Data? data;

    LeaderboardMonthly({
        this.status,
        this.data,
    });

    factory LeaderboardMonthly.fromJson(Map<String, dynamic> json) => LeaderboardMonthly(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
    };
}

class Data {
    List<Player>? report;
    Player? player;

    Data({
        this.report,
        this.player,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        report: json["report"] == null ? [] : List<Player>.from(json["report"]!.map((x) => Player.fromJson(x))),
        player: json["player"] == null ? null : Player.fromJson(json["player"]),
    );

    Map<String, dynamic> toJson() => {
        "report": report == null ? [] : List<dynamic>.from(report!.map((x) => x.toJson())),
        "player": player?.toJson(),
    };
}

class Player {
    int? playerId;
    String? nickname;
    String? totalWin;
    int? hourlyWin;
    int? rank;
    String? photo;

    Player({
        this.playerId,
        this.nickname,
        this.totalWin,
        this.hourlyWin,
        this.rank,
        this.photo,
    });

    factory Player.fromJson(Map<String, dynamic> json) => Player(
        playerId: json["player_id"],
        nickname: json["nickname"],
        totalWin: json["total_win"],
        hourlyWin: json["hourly_win"],
        rank: json["rank"],
        photo: json["photo"],
    );

    Map<String, dynamic> toJson() => {
        "player_id": playerId,
        "nickname": nickname,
        "total_win": totalWin,
        "hourly_win": hourlyWin,
        "rank": rank,
        "photo": photo,
    };
}
