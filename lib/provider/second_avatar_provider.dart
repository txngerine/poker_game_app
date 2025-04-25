import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SecondAvatarProvider extends ChangeNotifier {
  final List<String> _avatarImageUrls = [];
  List<String> get avatarImageUrls => _avatarImageUrls;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  Future<void> fetchSecondaryAvatarData(
      int userId, BuildContext context) async {
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
        final secondaryAvatars =
            response.data["data"]["secondary"] as Map<String, dynamic>;

        List<String> tempAvatars = [];
        for (int i = 5; i <= 9; i++) {
          final key = "avatar$i";
          final url = secondaryAvatars[key];
          if (url != null && url is String && url.isNotEmpty) {
            debugPrint("Loaded avatar $i: $url");
            tempAvatars.add(url);
          } else {
            debugPrint("Missing avatar: $key");
          }
        }

        await Future.wait(tempAvatars.map((imageUrl) {
          final imageProvider = NetworkImage(imageUrl);
          return precacheImage(imageProvider, context);
        }));

        _avatarImageUrls
          ..clear()
          ..addAll(tempAvatars);
      }
    } catch (e) {
      debugPrint("Error fetching avatar data: $e");
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
