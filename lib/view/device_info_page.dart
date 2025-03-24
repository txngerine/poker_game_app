import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokerpad/constants/screen_size.dart';
import 'package:pokerpad/widget/elevated_button_custom.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widget/build_sub_heading_text.dart';
import 'login_page.dart';

class DeviceInfoPage extends StatefulWidget {
  const DeviceInfoPage({super.key});

  @override
  State<DeviceInfoPage> createState() => _DeviceInfoPageState();
}

class _DeviceInfoPageState extends State<DeviceInfoPage> {
  final TextEditingController passwordController = TextEditingController();
  String _deviceDetails = "Device information";
  //PP1PPS4FMS68
  String _deviceId = "";

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    _checkStoredDevice();
  }

  Future<void> _checkStoredDevice() async {
    // Adding delay to simulate the check process
    await Future.delayed(const Duration(seconds: 2));

    SharedPreferences pref = await SharedPreferences.getInstance();
    String? storedDeviceId = pref.getString("device_id");

    debugPrint("Stored Device ID: $storedDeviceId");

    // This check should happen after device ID is registered/stored
    if (storedDeviceId != null && storedDeviceId.isNotEmpty) {
      setState(() {
        _deviceId = storedDeviceId;
      });

      // Navigate after the delay to show the body widget first
      Future.delayed(Duration.zero, () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      });
    } else {
      // Only fetch the device info if no ID is found
      await _getDeviceInfo();
    }
  }

  Future<void> _registerDevice() async {
    if (passwordController.text.isEmpty) {
      _showErrorDialog("Password cannot be empty.");
      return;
    }

    if (_deviceId.isEmpty) {
      debugPrint("Device ID is empty, fetching device info again.");
      await _getDeviceInfo();
    }

    setState(() {
      isLoading = true;
    });

    const String url =
        "http://3.6.170.253:1080/server.php/api/v1/device-register";

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "deviceId": _deviceId,
          "password": passwordController.text,
        }),
      );

      debugPrint("API Response: ${response.body}");

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        if (responseData["status"] == "OK") {
          // Store device ID only on successful registration
          SharedPreferences pref = await SharedPreferences.getInstance();
          await pref.setString("device_id", _deviceId);
          debugPrint("Saved Device ID: $_deviceId");

          // Navigate to login page
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        } else {
          _showErrorDialog("Incorrect Password! Try again.");
        }
      } else {
        _showErrorDialog("Registration Failed! Try again.");
      }
    } catch (e) {
      _showErrorDialog("Network Error! Check your connection.");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _getDeviceInfo() async {
    final device = DeviceInfoPlugin();
    String deviceID = "";
    String deviceDetails = "";

    if (Platform.isAndroid) {
      var androidInfo = await device.androidInfo;
      deviceID = androidInfo.id;
      deviceDetails =
          "Device Name: ${androidInfo.brand}\nDevice Model: ${androidInfo.model}\nDevice ID: ${androidInfo.id}";
    } else if (Platform.isIOS) {
      var iosInfo = await device.iosInfo;
      deviceID = iosInfo.identifierForVendor ?? "Unknown";
      deviceDetails =
          "Device Name: ${iosInfo.name}\nDevice ID: ${iosInfo.identifierForVendor}";
    } else {
      deviceDetails = "Unsupported Platform";
    }
    // Generate custom ID
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    int randomNumber = Random().nextInt(1000); // Random number between 0-999
    int numericId = int.parse("$timestamp$randomNumber");

    // Convert to base 36
    String base36Id = numericId.toRadixString(36).toUpperCase();
    String customDeviceId = base36Id;

    setState(() {
      _deviceId = customDeviceId;
      _deviceDetails = deviceDetails;
      isLoading = false;
    });

    debugPrint("Retrieved Device ID: $_deviceId");
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        elevation: 10,
        title: const BuildSubHeadingText(
          text: "Error Message",
          color: Colors.black,
        ),
        content: Text(message),
        actions: [
          TextButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Color(0xff3D3D3D))),
              onPressed: () => Navigator.of(context).pop(),
              child: const BuildSubHeadingText(
                text: "OK",
                fontSize: 12,
                color: Colors.white,
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset(
            width: ScreenSize.screenWidth,
            height: ScreenSize.screenHeight,
            "assets/images/background.jpg",
            fit: BoxFit.cover,
          ),
          Center(
            child: isLoading // Only show the body when loading is false
                ? const CircularProgressIndicator(
                    color: Color(0xff3D3D3D),
                  )
                : SizedBox(
                    width: ScreenSize.screenWidth / 2,
                    height: ScreenSize.screenHeight / 3.5,
                    child: Card(
                      elevation: 10,
                      color: const Color(0xffF5F5F5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 10),
                          const BuildSubHeadingText(
                            text: "Register Device",
                            fontSize: 25,
                          ),
                          const SizedBox(height: 20),
                          BuildSubHeadingText(
                            text: "Device id : $_deviceId",
                            fontSize: 14,
                          ),
                          Padding(
                              padding: const EdgeInsets.all(28.0),
                              child: TextField(
                                  textAlign: TextAlign.center,
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                      hintStyle:
                                          const TextStyle(color: Colors.grey),
                                      hintText: "Enter Password",
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      focusColor: Colors.grey,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))))),
                          const SizedBox(height: 30),
                          SizedBox(
                            width: ScreenSize.screenWidth / 5,
                            child: ElevatedButtonCustom(
                              color: const Color(0xff3D3D3D),
                              text: "submit",
                              textColor: Colors.white,
                              onPress: () async {
                                await _registerDevice();
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
