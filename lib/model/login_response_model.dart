class LoginResponseModel {
  final String status;
  final Data? data;
  final Messages? messages;

  LoginResponseModel({
    required this.status,
    this.data,
    this.messages,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      status: json['status'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      messages:
          json['messages'] != null ? Messages.fromJson(json['messages']) : null,
    );
  }
}

class Data {
  final int id;
  final String? nickname;
  final String email;
  final bool? isActive;
  final bool? isVerified;
  final String balance;
  final int step;
  final int clubId;
  final String clubName;
  final bool vip;
  final String avatar;
  final String lobbyAvatar;
  final String detailAvatar;
  final String? lastLogin;
  final double rakePendingRate;
  final String message;
  final String type;
  final String title;

  Data({
    required this.id,
    this.nickname,
    required this.email,
    this.isActive,
    this.isVerified,
    required this.balance,
    required this.step,
    required this.clubId,
    required this.clubName,
    required this.vip,
    required this.avatar,
    required this.lobbyAvatar,
    required this.detailAvatar,
    this.lastLogin,
    required this.rakePendingRate,
    required this.message,
    required this.type,
    required this.title,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      nickname: json['nickname'],
      email: json['email'],
      isActive: json['is_active'],
      isVerified: json['is_verified'],
      balance: json['balance'],
      step: json['step'],
      clubId: json['club_id'],
      clubName: json['club_name'],
      vip: json['vip'],
      avatar: json['avatar'],
      lobbyAvatar: json['lobby_avatar'],
      detailAvatar: json['detail_avatar'],
      lastLogin: json['last_login'],
      rakePendingRate: (json['rake_pending_rate'] as num).toDouble(),
      message: json['message'],
      type: json['type'],
      title: json['title'],
    );
  }
}

class Messages {
  final String common;

  Messages({required this.common});

  factory Messages.fromJson(Map<String, dynamic> json) {
    return Messages(
      common: json['common'],
    );
  }
}
