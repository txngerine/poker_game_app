import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pokerpad/view/pick_avatar_page.dart';

import '../constants/screen_size.dart';

class LoadingAvatarPage extends StatefulWidget {
  const LoadingAvatarPage({super.key});

  @override
  State<LoadingAvatarPage> createState() => _LoadingAvatarPageState();
}

class _LoadingAvatarPageState extends State<LoadingAvatarPage> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 10), () {
      Navigator.push(
          context,
          PageTransition(
              child: const PickAvatarPage(),
              type: PageTransitionType.rightToLeftWithFade));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: ScreenSize.screenHeight,
            width: ScreenSize.screenWidth,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(35.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                    "assets/images/pokerPadArt/avtaar generation title.png"),
                const SizedBox(
                  height: 100,
                ),
                Image.asset(
                  height: 250,
                  width: 250,
                  "assets/images/3d/ezgif.com-gif-maker (1).gif",
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 150,
                ),
                Image.asset(
                    "assets/images/pokerPadArt/avatar generation explanation.png")
              ],
            ),
          )
        ],
      ),
    );
  }
}
