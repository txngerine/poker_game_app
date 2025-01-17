class SkipIdRequestModel {
  final int skip;
  final int deviceId;
  final int id;

  SkipIdRequestModel({
    required this.skip,
    required this.deviceId,
    required this.id,
  });

  Map<String, dynamic> toJson() {
    return {
      "skip": skip,
      "deviceId": deviceId,
      "id": id,
    };
  }
}
