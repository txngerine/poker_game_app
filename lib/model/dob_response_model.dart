class DobResponseModel {
  final String status;
  final DobData? data;

  DobResponseModel({
    required this.status,
    this.data,
  });

  // Convert JSON to DobResponseModel
  factory DobResponseModel.fromJson(Map<String, dynamic> json) {
    return DobResponseModel(
      status: json['status'],
      data: DobData.fromJson(json['data']),
    );
  }

  // Convert DobResponseModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data?.toJson(),
    };
  }
}

class DobData {
  final int step;
  final int id;

  DobData({
    required this.step,
    required this.id,
  });

  // Convert JSON to DobData
  factory DobData.fromJson(Map<String, dynamic> json) {
    return DobData(
      step: json['step'],
      id: json['id'],
    );
  }

  // Convert DobData to JSON
  Map<String, dynamic> toJson() {
    return {
      'step': step,
      'id': id,
    };
  }
}
