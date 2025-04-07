// To parse this JSON data, do
//
//     final affiliateModelResponse = affiliateModelResponseFromJson(jsonString);

import 'dart:convert';

AffiliateModelResponse affiliateModelResponseFromJson(String str) => AffiliateModelResponse.fromJson(json.decode(str));

String affiliateModelResponseToJson(AffiliateModelResponse data) => json.encode(data.toJson());

class AffiliateModelResponse {
    String? status;
    Data? data;

    AffiliateModelResponse({
        this.status,
        this.data,
    });

    factory AffiliateModelResponse.fromJson(Map<String, dynamic> json) => AffiliateModelResponse(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
    };
}

class Data {
    String? name;
    String? email;
    double? balance;
    double? netProfit;
    double? averageNetProfit;
    double? totalCommission;
    int? playersCount;
    List<Player>? players;

    Data({
        this.name,
        this.email,
        this.balance,
        this.netProfit,
        this.averageNetProfit,
        this.totalCommission,
        this.playersCount,
        this.players,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        email: json["email"],
        balance: json["balance"]?.toDouble(),
        netProfit: json["net_profit"]?.toDouble(),
        averageNetProfit: json["average_net_profit"]?.toDouble(),
        totalCommission: json["total_commission"]?.toDouble(),
        playersCount: json["players_count"],
        players: json["players"] == null ? [] : List<Player>.from(json["players"]!.map((x) => Player.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "balance": balance,
        "net_profit": netProfit,
        "average_net_profit": averageNetProfit,
        "total_commission": totalCommission,
        "players_count": playersCount,
        "players": players == null ? [] : List<dynamic>.from(players!.map((x) => x.toJson())),
    };
}

class Player {
    int? id;
    String? nickname;
    String? email;
    DateTime? regDate;
    double? balance;
    String? lastLogin;
    double? commission;
    Club? club;
    double? profit;

    Player({
        this.id,
        this.nickname,
        this.email,
        this.regDate,
        this.balance,
        this.lastLogin,
        this.commission,
        this.club,
        this.profit,
    });

    factory Player.fromJson(Map<String, dynamic> json) => Player(
        id: json["id"],
        nickname: json["nickname"],
        email: json["email"],
        regDate: json["reg_date"] == null ? null : DateTime.parse(json["reg_date"]),
        balance: json["balance"]?.toDouble(),
        lastLogin: json["last_login"],
        commission: json["commission"]?.toDouble(),
        club: clubValues.map[json["club"]]!,
        profit: json["profit"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nickname": nickname,
        "email": email,
        "reg_date": "${regDate!.year.toString().padLeft(4, '0')}-${regDate!.month.toString().padLeft(2, '0')}-${regDate!.day.toString().padLeft(2, '0')}",
        "balance": balance,
        "last_login": lastLogin,
        "commission": commission,
        "club": clubValues.reverse[club],
        "profit": profit,
    };
}

enum Club {
    VIP_CLUB
}

final clubValues = EnumValues({
    "VIP Club": Club.VIP_CLUB
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
