// To parse this JSON data, do
//
//     final getAffiliatePlayerModel = getAffiliatePlayerModelFromJson(jsonString);

import 'dart:convert';

GetAffiliatePlayerModel getAffiliatePlayerModelFromJson(String str) =>
    GetAffiliatePlayerModel.fromJson(json.decode(str));

String getAffiliatePlayerModelToJson(GetAffiliatePlayerModel data) =>
    json.encode(data.toJson());

class GetAffiliatePlayerModel {
  final String? status;
  final Data? data;

  GetAffiliatePlayerModel({
    this.status,
    this.data,
  });

  factory GetAffiliatePlayerModel.fromJson(Map<String, dynamic> json) =>
      GetAffiliatePlayerModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  final String? about;
  final int? id;
  final dynamic phone;
  final String? email;
  final String? name;
  final String? balance;
  final String? avatar;

  Data({
    this.about,
    this.id,
    this.phone,
    this.email,
    this.name,
    this.balance,
    this.avatar,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        about: json["about"],
        id: json["id"],
        phone: json["phone"],
        email: json["email"],
        name: json["name"],
        balance: json["balance"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "about": about,
        "id": id,
        "phone": phone,
        "email": email,
        "name": name,
        "balance": balance,
        "avatar": avatar,
      };
}
