class NameResponseModel {
  final String status;
  final NameResponseData? data;
  final Map<String, dynamic>? messages; // Added messages field

  NameResponseModel({required this.status, this.data, this.messages});

  // Factory constructor to create the model from JSON
  factory NameResponseModel.fromJson(Map<String, dynamic> json) {
    return NameResponseModel(
      status: json['status'] as String,
      data:
          json['data'] != null ? NameResponseData.fromJson(json['data']) : null,
      messages: json['messages'] != null
          ? json['messages'] as Map<String, dynamic>
          : null, // Parse messages
    );
  }
}

class NameResponseData {
  final int step;
  final int id;

  NameResponseData({required this.step, required this.id});

  // Factory constructor to create the model from JSON
  factory NameResponseData.fromJson(Map<String, dynamic> json) {
    return NameResponseData(
      step: json['step'] as int,
      id: json['id'] as int,
    );
  }
}
