import 'dart:convert';

RatHoleResponseModel ratHoleResponseModelFromJson(String str) =>
    RatHoleResponseModel.fromJson(json.decode(str));

String ratHoleResponseModelToJson(RatHoleResponseModel data) =>
    json.encode(data.toJson());

class RatHoleResponseModel {
  final String? status;
  final Map<String, String>? messages;

  RatHoleResponseModel({
    this.status,
    this.messages,
  });

  factory RatHoleResponseModel.fromJson(Map<String, dynamic> json) =>
      RatHoleResponseModel(
        status: json["status"],
        messages: json["messages"] != null
            ? Map<String, String>.from(json["messages"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "messages": messages,
      };
}
