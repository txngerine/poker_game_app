import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:pokerpad/view/login_page.dart';

import '../widget/build_sub_heading_text.dart';

class DeviceInfoPage extends StatefulWidget {
  const DeviceInfoPage({super.key});

  @override
  State<DeviceInfoPage> createState() => _DeviceInfoPageState();
}

class _DeviceInfoPageState extends State<DeviceInfoPage> {
  String _deviceDetails = "Device information";

  Future<void> _getDeviceInfo() async {
    final device = DeviceInfoPlugin();
    String deviceDetails = "";
    if (Platform.isAndroid) {
      var androidInfo = await device.androidInfo;
      deviceDetails =
          "Device Name: ${androidInfo.brand}\nDevice Model: ${androidInfo.model}\nDevice ID: ${androidInfo.id}";
    } else if (Platform.isIOS) {
      var iosInfo = await device.iosInfo;
      deviceDetails =
          "Device Name: ${iosInfo.name}\nDevice ID: ${iosInfo.identifierForVendor}";
    } else {
      deviceDetails = "Unsupported Platform";
    }

    setState(() {
      _deviceDetails = deviceDetails;
    });
    _showDeviceInfoDialog(deviceDetails);
  }

  void _showDeviceInfoDialog(String details) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const BuildSubHeadingText(text: "Device Information"),
        content: Text(details),
        actions: [
          TextButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.black)),
              // onPressed: () => Navigator.of(context).pop(),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ));
              },
              child: const Text(
                "OK",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
              ))
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getDeviceInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/background.jpg",
      fit: BoxFit.cover,
    );
  }
}
