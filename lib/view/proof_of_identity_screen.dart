import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pokerpad/view/p_y_i_camera_page.dart';

class ProofOfIdentityScreen extends StatefulWidget {
  const ProofOfIdentityScreen({super.key});

  @override
  State<ProofOfIdentityScreen> createState() => _ProofOfIdentityScreenState();
}

class _ProofOfIdentityScreenState extends State<ProofOfIdentityScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
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
          Container(
            width: width,
            height: height / 1.4,
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage("assets/images/phone&country/log-reg frame.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 50,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: const PYICameraPage(),
                          type: PageTransitionType.rightToLeftWithFade));
                },
                child: Image.asset(
                    width: width / 1.2,
                    "assets/images/lets_take_photo_button.png"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
