import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pokerpad/view/lobby_page.dart';
import 'package:pokerpad/view/pick_secondary_avatar.dart';

class ViewSecondaryAvatar extends StatefulWidget {
  final String selectedImageUrl;

  const ViewSecondaryAvatar({super.key, required this.selectedImageUrl});

  @override
  State<ViewSecondaryAvatar> createState() => _ViewSecondaryAvatarState();
}

class _ViewSecondaryAvatarState extends State<ViewSecondaryAvatar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                      width: 400,
                      "assets/images/pokerPadArt/pick your secondary avatar title.png"),
                  const SizedBox(
                    height: 50,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Frame Image
                      Image.asset(
                        "assets/images/pokerPadArt/golden selection frame.png",
                        height: 470,
                        // width: 280,
                      ),
                      // Avatar Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                            9), // Ensure image fits within the frame's radius
                        child: Image.network(
                          widget.selectedImageUrl,
                          height: 452,
                          width: 360,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: PickSecondaryAvatar(),
                              type: PageTransitionType.leftToRightWithFade));
                    },
                    child: Image.asset(
                        width: MediaQuery.of(context).size.width / 1.3,
                        "assets/images/pokerPadArt/change avatar button.png"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: PickSecondaryAvatar(),
                              type: PageTransitionType.leftToRightWithFade));
                    },
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: LobbyPage(),
                                type: PageTransitionType.leftToRightWithFade));
                      },
                      child: Image.asset(
                          width: MediaQuery.of(context).size.width / 1.3,
                          "assets/images/pokerPadArt/enter the pokerpad button.png"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    "assets/images/pokerPadArt/retake selfie.png",
                    height: 15,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
