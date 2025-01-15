class DobRequestModel {
  final String dob;
  final int deviceId;

  DobRequestModel({
    required this.dob,
    required this.deviceId,
  });

  // Convert JSON to DobRequestModel
  factory DobRequestModel.fromJson(Map<String, dynamic> json) {
    return DobRequestModel(
      dob: json['dob'],
      deviceId: json['deviceId'],
    );
  }

  // Convert DobRequestModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'dob': dob,
      'deviceId': deviceId,
    };
  }
}
