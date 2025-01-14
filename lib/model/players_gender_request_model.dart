class PlayersGenderRequestModel {
  final String gender;
  final int deviceId;
  final int id;

  PlayersGenderRequestModel({
    required this.gender,
    required this.deviceId,
    required this.id,
  });

  Map<String, dynamic> toJson() {
    return {
      'gender': gender,
      'deviceId': deviceId,
      'id': id,
    };
  }
}
