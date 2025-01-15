class PlayerNameResponseModel {
  String? status;
  PlayerData? data;

  PlayerNameResponseModel({this.status, this.data});

  factory PlayerNameResponseModel.fromJson(Map<String, dynamic> json) {
    return PlayerNameResponseModel(
      status: json['status'],
      data: json['data'] != null ? PlayerData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data?.toJson(),
    };
  }
}

class PlayerData {
  int? id;
  String? nickname;
  String? email;
  String? gender;
  String? avatar;
  String? balance;
  int? step;

  PlayerData({
    this.id,
    this.nickname,
    this.email,
    this.gender,
    this.avatar,
    this.balance,
    this.step,
  });

  factory PlayerData.fromJson(Map<String, dynamic> json) {
    return PlayerData(
      id: json['id'],
      nickname: json['nickname'],
      email: json['email'],
      gender: json['gender'],
      avatar: json['avatar'],
      balance: json['balance'],
      step: json['step'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nickname': nickname,
      'email': email,
      'gender': gender,
      'avatar': avatar,
      'balance': balance,
      'step': step,
    };
  }
}
