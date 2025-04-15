import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokerpad/constants/screen_size.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widget/build_text_field_widget.dart';
import 'login_page.dart';

class DeviceInfoPage extends StatefulWidget {
  const DeviceInfoPage({super.key});

  @override
  State<DeviceInfoPage> createState() => _DeviceInfoPageState();
}

class _DeviceInfoPageState extends State<DeviceInfoPage> {
  final TextEditingController passwordController = TextEditingController();
  bool passwordVisible = false;
  String? _errorText;
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
      setState(() {
        _errorText = "Password cannot be empty.";
      });
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
          setState(() {
            _errorText = "Access code invalid. Please try again..";
          });
        }
      } else {
        setState(() {
          _errorText = "Access code invalid. Please try again.";
        });
      }
    } catch (e) {
      setState(() {
        _errorText = "Network Error! Check your connection.";
      });
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

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Image.asset(
            width: ScreenSize.screenWidth,
            height: ScreenSize.screenHeight,
            "assets/images/invitation screen/invitation bg.png",
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 160, left: 37),
                child: SizedBox(
                  width: width / 1.14,
                  child: BuildTextFieldWidget(
                    filledColor: Colors.white,
                    labelText: "access code",
                    hintText: "access code",
                    controller: passwordController,
                    obscureText: passwordVisible,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      }
                      return null;
                    },
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                      child: passwordVisible
                          ? Image.asset(
                              "assets/images/Artboard 28.png",
                              width: 47,
                            )
                          : Image.asset(
                              "assets/images/Artboard 29.png",
                              width: 47,
                            ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 125, left: 35),
                child: SizedBox(
                  width: width / 1.27,
                  height: 50, // Ensuring consistent height
                  child: _errorText != null
                      ? Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/verifyemail/alert frame.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              _errorText!,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        )
                      : const SizedBox(), // Empty SizedBox maintains the height
                ),
              ),
              SizedBox(
                height: height / 6,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: GestureDetector(
                  onTap: () async {
                    await _registerDevice();
                  },
                  child: Image.asset(
                      "assets/images/invitation screen/invitation_proceed.png",
                      width: width / 1.27),
                ),
              )
            ],
          ),
          if (isLoading)
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(color: Color(0xff3D3D3D)),
              ),
            ),
        ],
      ),
    );
  }
}
