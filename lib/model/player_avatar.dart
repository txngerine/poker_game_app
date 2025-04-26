class PlayerAvatar {
  final String? avatar;
  final String? lobbyAvatar;
  final int? playerId;

  PlayerAvatar({this.avatar, this.lobbyAvatar, this.playerId});

  factory PlayerAvatar.fromJson(Map<String, dynamic> json) {
    return PlayerAvatar(
      avatar: json["avatar"] as String?,
      lobbyAvatar: json["lobby_avatar"] as String?, // <- note the key
      playerId: json["playerId"] as int?,
    );
  }
}
