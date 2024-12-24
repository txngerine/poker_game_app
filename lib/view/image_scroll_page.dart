import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pokerpad/view/front_camera_page.dart';
import 'package:pokerpad/widget/build_heading_text.dart';

import '../constants/screen_size.dart';

class ImageScrollPage extends StatefulWidget {
  const ImageScrollPage({super.key});

  @override
  State<ImageScrollPage> createState() => _ImageScrollPageState();
}

class _ImageScrollPageState extends State<ImageScrollPage> {
  final PageController _pageController = PageController();
  bool _showButton = false;

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
            child: SizedBox(
              width: double.infinity,
              height: double.maxFinite,
              // color: Colors.blueGrey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const BuildHeadingText(text: "Instructions"),
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _showButton = (index == 4);
                        });
                      },
                      children: [
                        Image.asset(
                          'assets/images/9. Instruction - light copy.png',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/images/10. instruction - accessories copy.png',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/images/11. instruction - hair copy.png',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/images/12. instrucions - focus copy.png',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/images/13. instruction - posture copy.png',
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                  if (_showButton)
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: const FrontCameraPage(),
                                  type:
                                      PageTransitionType.rightToLeftWithFade));
                        },
                        child: Image.asset("assets/images/take a selfie.png")),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
