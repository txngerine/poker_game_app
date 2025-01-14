class TermsResponseModel {
  String status;
  Data? data;

  TermsResponseModel({
    required this.status,
    this.data,
  });

  // Convert JSON to TermsResponseModel
  factory TermsResponseModel.fromJson(Map<String, dynamic> json) {
    return TermsResponseModel(
      status: json['status'],
      data: Data.fromJson(json['data']),
    );
  }

  // Convert TermsResponseModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data?.toJson(),
    };
  }
}

class Data {
  int step;
  int id;

  Data({
    required this.step,
    required this.id,
  });

  // Convert JSON to Data
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      step: json['step'],
      id: json['id'],
    );
  }

  // Convert Data to JSON
  Map<String, dynamic> toJson() {
    return {
      'step': step,
      'id': id,
    };
  }
}
