// signup_response_model.dart
class SignupResponseModel {
  final String status;
  final String? commonMessage;
  final int? step;
  final int? id;

  SignupResponseModel({
    required this.status,
    this.commonMessage,
    this.step,
    this.id,
  });

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) {
    return SignupResponseModel(
      status: json['status'] ?? '',
      commonMessage: json['messages']?['common'],
      step: json['data']?['step'],
      id: json['data']?['id'],
    );
  }
}
