class ResetPasswordResponseModel {
  final String status;
  final String message;

  ResetPasswordResponseModel({required this.status, required this.message});

  factory ResetPasswordResponseModel.fromJson(Map<String, dynamic> json) {
    return ResetPasswordResponseModel(
      status: json["status"],
      message: json["data"]["message"],
    );
  }
}
