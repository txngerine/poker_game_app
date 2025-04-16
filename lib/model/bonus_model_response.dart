// To parse this JSON data, do
//
//     final bonusModelResp = bonusModelRespFromJson(jsonString);

import 'dart:convert';

BonusModelResp bonusModelRespFromJson(String str) => BonusModelResp.fromJson(json.decode(str));

String bonusModelRespToJson(BonusModelResp data) => json.encode(data.toJson());

class BonusModelResp {
    String? status;
    int? count;
    List<Datum>? data;

    BonusModelResp({
        this.status,
        this.count,
        this.data,
    });

    factory BonusModelResp.fromJson(Map<String, dynamic> json) => BonusModelResp(
        status: json["status"],
        count: json["count"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "count": count,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    int? id;
    int? affiliateId;
    int? refAffiliateId;
    String? totalBonus;
    DateTime? createdAt;
    DateTime? modifiedAt;
    String? avatar2;
    String? nickname;

    Datum({
        this.id,
        this.affiliateId,
        this.refAffiliateId,
        this.totalBonus,
        this.createdAt,
        this.modifiedAt,
        this.avatar2,
        this.nickname,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        affiliateId: json["affiliate_id"],
        refAffiliateId: json["ref_affiliate_id"],
        totalBonus: json["total_bonus"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        modifiedAt: json["modified_at"] == null ? null : DateTime.parse(json["modified_at"]),
        avatar2: json["avatar2"],
        nickname: json["nickname"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "affiliate_id": affiliateId,
        "ref_affiliate_id": refAffiliateId,
        "total_bonus": totalBonus,
        "created_at": createdAt?.toIso8601String(),
        "modified_at": modifiedAt?.toIso8601String(),
        "avatar2": avatar2,
        "nickname": nickname,
    };
}
