import 'package:flutter/material.dart';

import '../model/login_response_model.dart';
import '../popups/kyc_identity_camera_page_dark.dart';
import '../widget/build_text_widget.dart';

class ProofOfIdentityPopup extends StatefulWidget {
  final LoginResponseModel? playerResponse;

  const ProofOfIdentityPopup({super.key, this.playerResponse});

  @override
  State<ProofOfIdentityPopup> createState() => _ProofOfIdentityPopupState();
}

class _ProofOfIdentityPopupState extends State<ProofOfIdentityPopup> {
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
                  text: "Proof of Identity",
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                ),
                const SizedBox(
                  height: 10,
                ),
                const BuildTextWidget(
                  align: TextAlign.start,
                  text: "Examples:",
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(
                  height: 10,
                ),
                const BuildTextWidget(
                  text: "⦁ Government-Issued ID",
                  align: TextAlign.start,
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                const BuildTextWidget(
                  text: "⦁ Passport",
                  align: TextAlign.start,
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                const BuildTextWidget(
                  text: "⦁ National ID Card",
                  align: TextAlign.start,
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                const BuildTextWidget(
                  text: "⦁ Driver's License",
                  align: TextAlign.start,
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                const SizedBox(
                  height: 10,
                ),
                const BuildTextWidget(
                  text: "ID picture and Information\n must be clearly visible",
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
                      MaterialPageRoute(
                        builder: (context) => KycVerifyCameraPageDark(
                          playerResponse: widget.playerResponse,
                        ),
                      ),
                    );
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
