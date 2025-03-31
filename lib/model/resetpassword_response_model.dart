class ResetPasswordResponseModel {
  final String? status;
  final Map<String, dynamic>? data;
  final String? message; // Change from 'messages' to 'message'

  ResetPasswordResponseModel({
    this.status,
    this.data,
    this.message,
  });

  factory ResetPasswordResponseModel.fromJson(Map<String, dynamic> json) {
    return ResetPasswordResponseModel(
      status: json['status'],
      data: json['data'], // Ensure data exists
      message:
          json['messages'] ?? json['data']?['message'], // Handle both cases
    );
  }
}
