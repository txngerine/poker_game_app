// To parse this JSON data, do
//
//     final phoneNumberResponseModel = phoneNumberResponseModelFromJson(jsonString);

import 'dart:convert';

PhoneNumberResponseModel phoneNumberResponseModelFromJson(String str) =>
    PhoneNumberResponseModel.fromJson(json.decode(str));

String phoneNumberResponseModelToJson(PhoneNumberResponseModel data) =>
    json.encode(data.toJson());

class PhoneNumberResponseModel {
  final String? phone;
  final String? phCountryCode;
  final String? deviceId;

  PhoneNumberResponseModel({
    this.phone,
    this.phCountryCode,
    this.deviceId,
  });

  factory PhoneNumberResponseModel.fromJson(Map<String, dynamic> json) =>
      PhoneNumberResponseModel(
        phone: json["phone"],
        phCountryCode: json["ph_country_code"],
        deviceId: json["deviceId"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "ph_country_code": phCountryCode,
        "deviceId": deviceId,
      };
}
