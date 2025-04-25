// lib/providers/avatar_provider.dart
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AvatarProvider extends ChangeNotifier {
  final List<String> _avatarImageUrls = [];
  List<String> get avatarImageUrls => _avatarImageUrls;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  Future<void> fetchAvatarData(int userId, BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    final url =
        "http://3.6.170.253:1080/server.php/api/v1/avatar-list/$userId?XDEBUG_SESSION_START=netbeans-xdebug";

    try {
      final response = await Dio().get(
        url,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200 && response.data["status"] == "OK") {
        final data = response.data;
        final primaryAvatars = data["data"]["primary"];

        List<String> tempAvatars = [
          primaryAvatars["avatar0"],
          primaryAvatars["avatar1"],
          primaryAvatars["avatar2"],
          primaryAvatars["avatar3"],
          primaryAvatars["avatar4"],
        ];

        await Future.wait(tempAvatars.map((imageUrl) {
          final ImageProvider imageProvider = NetworkImage(imageUrl);
          return precacheImage(imageProvider, context);
        }));

        _avatarImageUrls.clear();
        _avatarImageUrls.addAll(tempAvatars);
      }
    } catch (e) {
      print("Error fetching avatar data: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
