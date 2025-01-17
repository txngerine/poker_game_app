class SkipAddressResponseModel {
  final String status;
  final SkipAddressData data;

  SkipAddressResponseModel({
    required this.status,
    required this.data,
  });

  factory SkipAddressResponseModel.fromJson(Map<String, dynamic> json) {
    return SkipAddressResponseModel(
      status: json['status'],
      data: SkipAddressData.fromJson(json['data']),
    );
  }
}

class SkipAddressData {
  final String message;
  final int step;

  SkipAddressData({
    required this.message,
    required this.step,
  });

  factory SkipAddressData.fromJson(Map<String, dynamic> json) {
    return SkipAddressData(
      message: json['message'],
      step: json['step'],
    );
  }
}
