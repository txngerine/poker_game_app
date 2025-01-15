class NameRequestModel {
  final String nickname;
  final int deviceId;

  NameRequestModel({required this.nickname, required this.deviceId});

  // Convert the model to JSON for API request
  Map<String, dynamic> toJson() {
    return {
      "nickname": nickname,
      "deviceId": deviceId,
    };
  }
}
