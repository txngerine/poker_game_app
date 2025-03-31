import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pokerpad/view/p_y_i_camera_page.dart';
import 'package:pokerpad/widget/build_text_widget.dart';

import '../widget/build_heading_widget.dart';

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
            decoration: const BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage("assets/images/phone&country/log-reg frame.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  BuildHeadingWidget(text: "Prove your Identity"),
                  SizedBox(
                    height: 40,
                  ),
                  Image.asset(
                      width: width / 5, "assets/images/identity_icon.png"),
                  SizedBox(
                    height: 25,
                  ),
                  BuildTextWidget(
                      fontSize: 20,
                      align: TextAlign.start,
                      text: "Provide a document that\nverifies your identity."),
                  SizedBox(
                    height: 25,
                  ),
                  BuildTextWidget(
                      fontSize: 20,
                      align: TextAlign.start,
                      text:
                          "Examples:\n• Government-Issued ID\n• Passport\n• National ID Card\n• Driver's License"),
                  SizedBox(
                    height: 25,
                  ),
                  BuildTextWidget(
                      fontSize: 20,
                      align: TextAlign.start,
                      text:
                          "ID picture and information\n must be clearly visible"),
                  SizedBox(
                    height: 10,
                  ),
                ],
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
