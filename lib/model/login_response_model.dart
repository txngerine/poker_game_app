// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
    String? status;
    Data? data;

    LoginResponseModel({
        this.status,
        this.data,
    });

    factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
    };
}

class Data {
    int? id;
    String? nickname;
    String? email;
    String? phone;
    int? isActive;
    int? isVerified;
    String? balance;
    int? step;
    int? clubId;
    String? clubName;
    bool? vip;
    String? avatar;
    String? lobbyAvatar;
    String? detailAvatar;
    DateTime? lastLogin;
    int? rakePendingRate;
    String? usertype;
    String? addressStatus;
    String? walletAddress;
    int? timeLeft;
    String? appVersion;
    String? appUrl;
    String? holemGameVersion;
    String? holdemGameUrl;
    dynamic selfAffiliateId;
    String? message;
    String? type;
    String? title;
    Kyc? kyc;

    Data({
        this.id,
        this.nickname,
        this.email,
        this.phone,
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
        this.usertype,
        this.addressStatus,
        this.walletAddress,
        this.timeLeft,
        this.appVersion,
        this.appUrl,
        this.holemGameVersion,
        this.holdemGameUrl,
        this.selfAffiliateId,
        this.message,
        this.type,
        this.title,
        this.kyc,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        nickname: json["nickname"],
        email: json["email"],
        phone: json["phone"],
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
        lastLogin: json["last_login"] == null ? null : DateTime.parse(json["last_login"]),
        rakePendingRate: json["rake_pending_rate"],
        usertype: json["usertype"],
        addressStatus: json["address_status"],
        walletAddress: json["wallet_address"],
        timeLeft: json["time_left"],
        appVersion: json["app_version"],
        appUrl: json["app_url"],
        holemGameVersion: json["holem_game_version"],
        holdemGameUrl: json["holdem_game_url"],
        selfAffiliateId: json["self_affiliate_id"],
        message: json["message"],
        type: json["type"],
        title: json["title"],
        kyc: json["kyc"] == null ? null : Kyc.fromJson(json["kyc"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nickname": nickname,
        "email": email,
        "phone": phone,
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
        "usertype": usertype,
        "address_status": addressStatus,
        "wallet_address": walletAddress,
        "time_left": timeLeft,
        "app_version": appVersion,
        "app_url": appUrl,
        "holem_game_version": holemGameVersion,
        "holdem_game_url": holdemGameUrl,
        "self_affiliate_id": selfAffiliateId,
        "message": message,
        "type": type,
        "title": title,
        "kyc": kyc?.toJson(),
    };
}

class Kyc {
    String? idStatus;
    String? faceStatus;

    Kyc({
        this.idStatus,
        this.faceStatus,
    });

    factory Kyc.fromJson(Map<String, dynamic> json) => Kyc(
        idStatus: json["id_status"],
        faceStatus: json["face_status"],
    );

    Map<String, dynamic> toJson() => {
        "id_status": idStatus,
        "face_status": faceStatus,
    };
}
