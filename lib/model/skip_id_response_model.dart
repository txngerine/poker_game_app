class SkipIdResponseModel {
  final String status;
  final Data? data;

  SkipIdResponseModel({
    required this.status,
    this.data,
  });

  factory SkipIdResponseModel.fromJson(Map<String, dynamic> json) {
    return SkipIdResponseModel(
      status: json['status'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }
}

class Data {
  final String message;
  final int step;

  Data({
    required this.message,
    required this.step,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      message: json['message'],
      step: json['step'],
    );
  }
}
