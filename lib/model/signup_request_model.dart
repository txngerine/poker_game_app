// signup_request_model.dart
class SignupRequestModel {
  final String email;
  final String password;
  final String deviceId;
  final String accountNo;

  SignupRequestModel({
    required this.email,
    required this.password,
    required this.deviceId,
    required this.accountNo,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "deviceId": deviceId,
      "account_no": accountNo,
    };
  }
}
