class ChooseAvatarRequestModel {
  final String primary;
  final String secondary;

  ChooseAvatarRequestModel({
    required this.primary,
    required this.secondary,
  });

  // Convert a ChooseAvatarRequestModel into a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'primary': primary,
      'secondary': secondary,
    };
  }
}
