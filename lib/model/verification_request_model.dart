class VerificationRequestModel {
  final String email;
  final String otp;
  final String deviceId;
  final int id;

  VerificationRequestModel({
    required this.email,
    required this.otp,
    required this.deviceId,
    required this.id,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'otp': otp,
      'deviceId': deviceId,
      'id': id,
    };
  }
}
