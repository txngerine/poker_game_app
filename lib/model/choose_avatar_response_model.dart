class ChooseAvatarResponseModel {
  final String status;

  ChooseAvatarResponseModel({required this.status});

  // Convert a JSON map into a ChooseAvatarResponseModel.
  factory ChooseAvatarResponseModel.fromJson(Map<String, dynamic> json) {
    return ChooseAvatarResponseModel(status: json['status']);
  }
}
