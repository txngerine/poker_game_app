import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../model/login_response_model.dart';
import '../view/lobby_page.dart';

class LoginProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  WebSocketChannel? _channel;
  bool isLoading = false;
  LoginResponseModel? playerDetails;
  String _deviceId = "Fetching..";
  double downloadProgress = 0.0;
  int? playerBalance;
  LoginProvider() {
    _getStoredDeviceId();
  }
  String get deviceId => _deviceId;

  Future<void> _getStoredDeviceId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? storedDeviceId = pref.getString("device_id");

    _deviceId = storedDeviceId ?? "No Device ID Found";
    notifyListeners(); // Update UI
    print("Updated Device ID: $_deviceId");
  }

  Future<void> login(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    _channel = WebSocketChannel.connect(
      Uri.parse("ws://3.6.170.253:48001/game?playerId=1"),
    );
    print("WebSocket connected...");

    _channel?.sink.add(jsonEncode({
      "code": "LOGIN_REQUEST",
      "data": {
        "username": emailController.text,
        "password": passwordController.text,
        "deviceId": _deviceId,
      }
    }));

    _channel?.stream.listen(
      (message) async {
        print("Message received: $message");
        final response = jsonDecode(message);

        switch (response["code"]) {
          case "LOGIN_REQUEST":
            _handleLoginResponse(response, context);
            break;

          case "NOTIFY_PLAYER_BALANCE":
            _updatePlayerBalance(response);
            break;

          default:
            print("Unhandled WebSocket message: $response");
            break;
        }
      },
      onError: (error) {
        isLoading = false;
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: $error")),
        );
      },
      onDone: () {
        isLoading = false;
        notifyListeners();
        print("WebSocket connection closed.");
      },
    );
  }

  void _handleLoginResponse(
      Map<String, dynamic> response, BuildContext context) async {
    if (response["data"]["status"] == "OK") {
      playerDetails = LoginResponseModel.fromJson(response["data"]);
      playerBalance =
          double.tryParse(playerDetails?.data?.balance.toString() ?? '0')
                  ?.toInt() ??
              0;

      isLoading = false;
      notifyListeners();

      final appVersionStr = playerDetails?.data?.appVersion ?? "0";
      final appVersion = int.tryParse(appVersionStr) ?? 0;
      final appUrl = playerDetails?.data?.appUrl ?? "";

      if (appVersion > 2 && appUrl.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.orange,
            content:
                const Text("A new update is available. Please update the app."),
          ),
        );
        await downloadAndInstallApk(appUrl, context);
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.green,
          content: const Text("Login Successful",
              style: TextStyle(color: Colors.white)),
        ),
      );
      Navigator.pushReplacement(
        context,
        PageTransition(
          child: LobbyPage(
            playerResponse: playerDetails,
            playerBalance: playerDetails?.data?.balance.toString(),
            avatar: playerDetails!.data!.lobbyAvatar ?? "",
          ),
          type: PageTransitionType.rightToLeftWithFade,
        ),
      );
    } else {
      isLoading = false;
      notifyListeners();
      String errorMessage = response["data"]["message"] ?? "Login failed.";

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          behavior: SnackBarBehavior.floating,
          content: Text(errorMessage),
        ),
      );

      _channel?.sink.close();
    }
  }

  void _updatePlayerBalance(Map<String, dynamic> response) {
    // playerBalance = response["balance"] ?? 0;
    playerBalance = response["balance"] is String
        ? int.tryParse(response["balance"]) ?? 0
        : (response["balance"] as num?)?.toInt() ?? 0;
    notifyListeners();
    print("Player Balance Updated: $playerBalance");
  }

  Future<void> downloadAndInstallApk(
      String appUrl, BuildContext context) async {
    isLoading = true;
    notifyListeners();

    try {
      // Request necessary permissions
      if (await Permission.storage.request().isDenied ||
          await Permission.manageExternalStorage.request().isDenied ||
          await Permission.requestInstallPackages.request().isDenied) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content:
                  Text("Storage permission is required to update the app")),
        );
        isLoading = false;
        notifyListeners();
        return;
      }

      // Get app directory path
      final dir = await getApplicationDocumentsDirectory();
      final apkPath = '${dir.path}/app-release.apk';
      final dio = Dio();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("App Updating, please wait...")),
      );

      // Download APK
      await dio.download(
        appUrl,
        apkPath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            downloadProgress = received / total;
            notifyListeners();
            print("Progress: ${(downloadProgress * 100).toStringAsFixed(0)}%");
          }
        },
      );

      // Install APK
      await OpenFilex.open(apkPath);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("App update complete!")),
      );
    } catch (e) {
      print("Error Downloading or Installing APK: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to update the app")),
      );
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void disposeResources() {
    emailController.dispose();
    passwordController.dispose();
    _channel?.sink.close();
  }
}
