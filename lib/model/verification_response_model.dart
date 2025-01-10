class VerificationResponseModel {
  final String status;
  final VerificationData? data;
  final Map<String, String>? messages;

  VerificationResponseModel({
    required this.status,
    this.data,
    this.messages,
  });

  factory VerificationResponseModel.fromJson(Map<String, dynamic> json) {
    return VerificationResponseModel(
      status: json['status'],
      data: json.containsKey('data')
          ? VerificationData.fromJson(json['data'])
          : null,
      messages: json.containsKey('messages')
          ? Map<String, String>.from(json['messages'])
          : null,
    );
  }
}

class VerificationData {
  final int step;
  final int id;

  VerificationData({
    required this.step,
    required this.id,
  });

  factory VerificationData.fromJson(Map<String, dynamic> json) {
    return VerificationData(
      step: json['step'],
      id: json['id'],
    );
  }
}
