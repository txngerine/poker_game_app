class SignupRequestModel {
  final String email;
  final String password;
  final String deviceId;
  final String accountNo;
  final int? affiliateId; // Nullable field

  SignupRequestModel({
    required this.email,
    required this.password,
    required this.deviceId,
    required this.accountNo,
    this.affiliateId,
  });

  Map<String, dynamic> toJson() {
    final data = {
      "email": email,
      "password": password,
      "deviceId": deviceId,
      "account_no": accountNo,
    };

    if (affiliateId != null) {
      data["affiliate_id"] = affiliateId.toString(); // ✅ Include if not null
    }

    return data;
  }
}
