import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pokerpad/view/lobby_page.dart';
import 'package:pokerpad/widget/build_heading_text.dart';
import 'package:pokerpad/widget/build_text_widget.dart';

import '../constants/screen_size.dart';

class UserViewPage extends StatefulWidget {
  const UserViewPage({super.key});

  @override
  State<UserViewPage> createState() => _UserViewPageState();
}

class _UserViewPageState extends State<UserViewPage> {
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
          Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const BuildHeadingText(text: "CONGRATULATIONS"),
                const BuildHeadingText(text: "Charlie"),
                const BuildTextWidget(text: "Your are now ready to play"),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey),
                  height: 650,
                  width: 490,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        "assets/images/user_img.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const BuildTextWidget(
                    text: "The above picture is just a temporary Avatar."),
                const BuildTextWidget(
                    text:
                        "A premium Avatar will be created for you within 24 hours"),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: LobbyPage(),
                              type: PageTransitionType.rightToLeftWithFade));
                    },
                    child: Image.asset("assets/images/pokerpad_nt_button.png")),
              ],
            ),
          )
        ],
      ),
    );
  }
}
