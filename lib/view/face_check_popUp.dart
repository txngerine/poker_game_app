import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../model/login_response_model.dart';
import '../popups/faceidentity_dark.dart';
import '../widget/build_text_widget.dart';

class FaceCheckPopup extends StatefulWidget {
  final LoginResponseModel? playerResponse;

  const FaceCheckPopup({super.key, this.playerResponse});

  @override
  State<FaceCheckPopup> createState() => _FaceCheckPopupState();
}

class _FaceCheckPopupState extends State<FaceCheckPopup> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.only(top: 115),
      child: Dialog(
        alignment: Alignment.topCenter,
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      "assets/images/new_lobby/KYC_info_field.png"))),
          height: height / 3,
          width: width / 2,
          child: Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                const BuildTextWidget(
                  text: "Face Check",
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                ),
                const SizedBox(
                  height: 20,
                ),
                const BuildTextWidget(
                  align: TextAlign.start,
                  text: "instructions",
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(
                  height: 10,
                ),
                const BuildTextWidget(
                  text: "⦁ Face clearly visible",
                  align: TextAlign.start,
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                const BuildTextWidget(
                  text: "⦁ Bright environment",
                  align: TextAlign.start,
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                const BuildTextWidget(
                  text: "⦁ No accessories",
                  align: TextAlign.start,
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                const BuildTextWidget(
                  text: "⦁ Upright posture",
                  align: TextAlign.start,
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                const SizedBox(
                  height: 20,
                ),
                const BuildTextWidget(
                  text: "Face must match Proof of Identity",
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: FaceIdentityPage(
                              playerResponse: widget.playerResponse,
                            ),
                            type: PageTransitionType.rightToLeftWithFade));
                  },
                  child: Container(
                    width: 220,
                    height: 60,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(
                          "assets/images/phonenumbpopupassets/confirmco.png",
                        ),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        'LET’S TAKE A PHOTO',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
