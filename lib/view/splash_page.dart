import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pokerpad/constants/screen_size.dart';
import 'package:pokerpad/view/device_info_page.dart';
import 'package:pokerpad/widget/build_sub_heading_text.dart';

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
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const DeviceInfoPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: ScreenSize.screenWidth,
          child: Image.asset(
            "assets/images/background.jpg",
            fit: BoxFit.cover,
          ),
        ),
        const Center(
          child: Card(
              color: Colors.transparent,
              elevation: 19,
              child: BuildSubHeadingText(text: "Poker Game..")),
        )
      ],
    );
  }
}
