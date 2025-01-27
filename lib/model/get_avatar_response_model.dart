class GetAvatarResponseModel {
  final String status;
  final Data data;

  GetAvatarResponseModel({
    required this.status,
    required this.data,
  });

  factory GetAvatarResponseModel.fromJson(Map<String, dynamic> json) {
    return GetAvatarResponseModel(
      status: json['status'],
      data: Data.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.toJson(),
    };
  }
}

class Data {
  final String id;
  final Primary primary;
  final Secondary secondary;

  Data({
    required this.id,
    required this.primary,
    required this.secondary,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      primary: Primary.fromJson(json['primary']),
      secondary: Secondary.fromJson(json['secondary']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'primary': primary.toJson(),
      'secondary': secondary.toJson(),
    };
  }
}

class Primary {
  final String avatar0;
  final String avatar1;
  final String avatar2;
  final String avatar3;
  final String avatar4;

  Primary({
    required this.avatar0,
    required this.avatar1,
    required this.avatar2,
    required this.avatar3,
    required this.avatar4,
  });

  factory Primary.fromJson(Map<String, dynamic> json) {
    return Primary(
      avatar0: json['avatar0'],
      avatar1: json['avatar1'],
      avatar2: json['avatar2'],
      avatar3: json['avatar3'],
      avatar4: json['avatar4'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'avatar0': avatar0,
      'avatar1': avatar1,
      'avatar2': avatar2,
      'avatar3': avatar3,
      'avatar4': avatar4,
    };
  }
}

class Secondary {
  final String avatar5;
  final String avatar6;
  final String avatar7;
  final String avatar8;
  final String avatar9;

  Secondary({
    required this.avatar5,
    required this.avatar6,
    required this.avatar7,
    required this.avatar8,
    required this.avatar9,
  });

  factory Secondary.fromJson(Map<String, dynamic> json) {
    return Secondary(
      avatar5: json['avatar5'],
      avatar6: json['avatar6'],
      avatar7: json['avatar7'],
      avatar8: json['avatar8'],
      avatar9: json['avatar9'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'avatar5': avatar5,
      'avatar6': avatar6,
      'avatar7': avatar7,
      'avatar8': avatar8,
      'avatar9': avatar9,
    };
  }
}
