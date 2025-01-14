class PlayersGenderResponseModel {
  final String status;
  final Data? data;
  final String? message;

  PlayersGenderResponseModel({
    required this.status,
    this.data,
    this.message,
  });

  factory PlayersGenderResponseModel.fromJson(Map<String, dynamic> json) {
    return PlayersGenderResponseModel(
      status: json['status'],
      data: json['status'] == 'OK' && json['data'] != null
          ? Data.fromJson(json['data'])
          : null,
      message: json['status'] == 'FAIL' ? json['messages']['common'] : null,
    );
  }
}

class Data {
  final int step;
  final int id;

  Data({required this.step, required this.id});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      step: json['step'],
      id: json['id'],
    );
  }
}
