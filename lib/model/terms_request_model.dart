class TermsRequestModel {
  String tos;
  int deviceId;
  int id;

  TermsRequestModel({
    required this.tos,
    required this.deviceId,
    required this.id,
  });

  // Convert JSON to TermsRequestModel
  factory TermsRequestModel.fromJson(Map<String, dynamic> json) {
    return TermsRequestModel(
      tos: json['tos'],
      deviceId: json['deviceId'],
      id: json['id'],
    );
  }

  // Convert TermsRequestModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'tos': tos,
      'deviceId': deviceId,
      'id': id,
    };
  }
}
