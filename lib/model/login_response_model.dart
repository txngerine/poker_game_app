// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  final String? status;
  final Data? data;

  LoginResponseModel({
    this.status,
    this.data,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  final int? id;
  final String? nickname;
  final String? email;
  final int? isActive;
  final int? isVerified;
  final String? balance;
  final int? step;
  final int? clubId;
  final String? clubName;
  final bool? vip;
  final String? avatar;
  final String? lobbyAvatar;
  final String? detailAvatar;
  final DateTime? lastLogin;
  final int? rakePendingRate;
  final String? appVersion;
  final String? appUrl;
  final String? holemGameVersion;
  final String? holdemGameUrl;
  final int? selfAffiliateId;
  final String? message;
  final String? type;
  final String? title;

  Data({
    this.id,
    this.nickname,
    this.email,
    this.isActive,
    this.isVerified,
    this.balance,
    this.step,
    this.clubId,
    this.clubName,
    this.vip,
    this.avatar,
    this.lobbyAvatar,
    this.detailAvatar,
    this.lastLogin,
    this.rakePendingRate,
    this.appVersion,
    this.appUrl,
    this.holemGameVersion,
    this.holdemGameUrl,
    this.selfAffiliateId,
    this.message,
    this.type,
    this.title,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        nickname: json["nickname"],
        email: json["email"],
        isActive: json["is_active"],
        isVerified: json["is_verified"],
        balance: json["balance"],
        step: json["step"],
        clubId: json["club_id"],
        clubName: json["club_name"],
        vip: json["vip"],
        avatar: json["avatar"],
        lobbyAvatar: json["lobby_avatar"],
        detailAvatar: json["detail_avatar"],
        lastLogin: json["last_login"] == null
            ? null
            : DateTime.parse(json["last_login"]),
        rakePendingRate: json["rake_pending_rate"],
        appVersion: json["app_version"],
        appUrl: json["app_url"],
        holemGameVersion: json["holem_game_version"],
        holdemGameUrl: json["holdem_game_url"],
        selfAffiliateId: json["self_affiliate_id"],
        message: json["message"],
        type: json["type"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nickname": nickname,
        "email": email,
        "is_active": isActive,
        "is_verified": isVerified,
        "balance": balance,
        "step": step,
        "club_id": clubId,
        "club_name": clubName,
        "vip": vip,
        "avatar": avatar,
        "lobby_avatar": lobbyAvatar,
        "detail_avatar": detailAvatar,
        "last_login": lastLogin?.toIso8601String(),
        "rake_pending_rate": rakePendingRate,
        "app_version": appVersion,
        "app_url": appUrl,
        "holem_game_version": holemGameVersion,
        "holdem_game_url": holdemGameUrl,
        "self_affiliate_id": selfAffiliateId,
        "message": message,
        "type": type,
        "title": title,
      };
}
