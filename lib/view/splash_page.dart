import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pokerpad/constants/screen_size.dart';

import 'device_info_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 8),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const DeviceInfoPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: ScreenSize.screenWidth,
          height: ScreenSize.screenHeight,
          child: Image.asset(
            "assets/images/background.jpg",
            fit: BoxFit.cover,
          ),
        ),
        Center(
            child: Image.asset(
          "assets/images/3d/ezgif.com-gif-maker (1).gif",
          width: 270,
          height: 380,
          fit: BoxFit.fill,
        ))
      ],
    );
  }
}
