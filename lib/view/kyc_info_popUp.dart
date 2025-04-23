import 'package:flutter/material.dart';
import 'package:pokerpad/widget/build_text_widget.dart';

class KycInfoPopup extends StatefulWidget {
  const KycInfoPopup({super.key});

  @override
  State<KycInfoPopup> createState() => _KycInfoPopupState();
}

class _KycInfoPopupState extends State<KycInfoPopup> {
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
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              BuildTextWidget(
                text: "KYC Verification",
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w900,
              ),
              SizedBox(
                height: 20,
              ),
              BuildTextWidget(
                align: TextAlign.start,
                text: "Complete KYC to help maintain a secure\n"
                    "and trustworthy gaming environment.",
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(
                height: 20,
              ),
              BuildTextWidget(
                align: TextAlign.start,
                text:
                    "  Face Check - A selfie to confirm that user's \n  face and Proof of Identity match.",
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(
                height: 20,
              ),
              BuildTextWidget(
                text:
                    " Proof of Identity - A government-issued ID \n (passport, driver's license,or natiional ID).",
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
