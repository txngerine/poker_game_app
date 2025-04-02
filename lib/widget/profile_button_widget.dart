// import 'package:flutter/material.dart';

// import 'build_sub_heading_text.dart';
// import 'build_text_widget.dart';

// class ProfileButtonWidget extends StatefulWidget {
//   const ProfileButtonWidget({super.key});

//   @override
//   State<ProfileButtonWidget> createState() => _ProfileButtonWidgetState();
// }

// class _ProfileButtonWidgetState extends State<ProfileButtonWidget> {
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.sizeOf(context).width;
//     final height = MediaQuery.sizeOf(context).height;
//     return Dialog(
//       child: Container(
//         height: height / 2.3,
//         width: width,
//         decoration: BoxDecoration(
//           color: Colors.black,
//           borderRadius: BorderRadius.circular(20),
//           border: Border.all(color: Colors.white),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(
//                 height: 10,
//               ),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   BuildSubHeadingText(
//                     text: "WhatEverMan",
//                     color: Colors.white,
//                     fontSize: 20,
//                   ),
//                   Spacer(),
//                   BuildSubHeadingText(
//                     text: "ID:",
//                     color: Colors.white,
//                     fontSize: 20,
//                   ),
//                   SizedBox(
//                     width: 20,
//                   )
//                 ],
//               ),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Icon(
//                     Icons.mail,
//                     color: Colors.white,
//                     size: 12,
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   BuildTextWidget(
//                     text: "whateverman@gmail.com",
//                     color: Colors.white,
//                     fontSize: 12,
//                   )
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   const Icon(
//                     Icons.phone,
//                     color: Colors.white,
//                     size: 12,
//                   ),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   const BuildTextWidget(
//                     text: "Enter your mobile number",
//                     color: Colors.white,
//                     fontSize: 12,
//                   ),
//                   const Spacer(),
//                   SizedBox(
//                     width: width / 3,
//                     child: ElevatedButton(
//                         style: const ButtonStyle(
//                             backgroundColor:
//                                 WidgetStatePropertyAll(Colors.white)),
//                         onPressed: () {},
//                         child: const BuildSubHeadingText(
//                           text: "change avatar",
//                           fontSize: 12,
//                           color: Colors.black,
//                         )),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               Row(
//                 children: [
//                   Column(
//                     children: [
//                       const BuildSubHeadingText(
//                         fontSize: 15,
//                         text: "FACIAL VERIFICATION",
//                         color: Colors.white,
//                       ),
//                       SizedBox(
//                         width: width / 3,
//                         child: ElevatedButton(
//                             style: const ButtonStyle(
//                                 backgroundColor:
//                                     WidgetStatePropertyAll(Color(0xff3C3D37))),
//                             onPressed: () {},
//                             child: const BuildSubHeadingText(
//                               text: "pending",
//                               fontSize: 12,
//                               color: Colors.white70,
//                             )),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       const BuildSubHeadingText(
//                         fontSize: 15,
//                         text: "PROOF OF IDENTITY",
//                         color: Colors.white,
//                       ),
//                       SizedBox(
//                         width: width / 3,
//                         child: ElevatedButton(
//                             style: const ButtonStyle(
//                                 backgroundColor:
//                                     WidgetStatePropertyAll(Color(0xff79D7BE))),
//                             onPressed: () {},
//                             child: const BuildSubHeadingText(
//                               text: "verified",
//                               fontSize: 12,
//                               color: Colors.white70,
//                             )),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       const BuildSubHeadingText(
//                         fontSize: 15,
//                         text: "PROOF OF ADDRESS",
//                         color: Colors.white,
//                       ),
//                       SizedBox(
//                         width: width / 3,
//                         child: ElevatedButton(
//                             style: const ButtonStyle(
//                                 backgroundColor:
//                                     WidgetStatePropertyAll(Color(0xffB43F3F))),
//                             onPressed: () {},
//                             child: const BuildSubHeadingText(
//                               text: "rejected",
//                               fontSize: 12,
//                               color: Colors.white70,
//                             )),
//                       ),
//                     ],
//                   ),
//                   const Spacer(),
//                   Column(
//                     children: [
//                       Container(
//                         height: 200,
//                         color: const Color(0xff424242),
//                         width: width / 3,
//                       ),
//                       SizedBox(
//                         width: width / 3,
//                         child: ElevatedButton(
//                             style: const ButtonStyle(
//                                 backgroundColor:
//                                     WidgetStatePropertyAll(Colors.white)),
//                             onPressed: () {},
//                             child: const BuildSubHeadingText(
//                               text: "try again",
//                               fontSize: 12,
//                               color: Colors.black,
//                             )),
//                       ),
//                     ],
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ProfileButtonWidget extends StatefulWidget {
  const ProfileButtonWidget({super.key});

  @override
  State<ProfileButtonWidget> createState() => _ProfileButtonWidgetState();
}

class _ProfileButtonWidgetState extends State<ProfileButtonWidget> {
  bool _isEditing = false;
  String kycStatus = "PENDING"; // Default status

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: const Color(0xFF3C3D37),
      child: Container(
        padding: const EdgeInsets.all(15),
        width: width * 0.9,
        decoration: BoxDecoration(
          color: const Color(0xFF2F2F2F),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildNameIDSection(),
            const SizedBox(height: 10),
            _buildEmailPhoneSection(),
            const SizedBox(height: 20),
            _buildKYCVerificationTitle(),
            const SizedBox(height: 10),
            Column(
              children: [
                _buildKYCRow("FACE CHECK"),
                const SizedBox(height: 10),
                _buildKYCRow("PROOF OF IDENTITY"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNameIDSection() {
    return Container(
      height: 45,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage("assets/images/profilebutton/name_field.png"),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            "JASPER DEN HOLLANDER",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "ID:113",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget _buildEmailPhoneSection() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 45,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage("assets/images/profilebutton/name_field.png"),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              "jasper.from.holand@gmail.com",
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 45,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage("assets/images/profilebutton/name_field.png"),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "+38651646587",
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isEditing = !_isEditing;
                    });
                  },
                  child: Image.asset(
                    _isEditing
                        ? "assets/images/profilebutton/edit_button_active.png"
                        : "assets/images/profilebutton/edit_button_passive.png",
                    width: 40,
                    height: 40,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildKYCVerificationTitle() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage("assets/images/profilebutton/name_field.png"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Center(
        child: Text(
          "KYC VERIFICATION",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildKYCRow(String leftText) {
    return Row(
      children: [
        Expanded(
          child: _buildKYCButton(leftText),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _buildStatusButton(),
        ),
      ],
    );
  }

  Widget _buildKYCButton(String text) {
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage("assets/images/profilebutton/kyc_field.png"),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildStatusButton() {
    String assetPath;

    if (kycStatus == "PENDING") {
      assetPath = "assets/images/profilebutton/pending_notification.png";
    } else if (kycStatus == "VERIFIED") {
      assetPath = "assets/images/profilebutton/verified_button.png";
    } else {
      assetPath = "assets/images/profilebutton/try_again_button.png";
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          if (kycStatus == "PENDING") {
            kycStatus = "VERIFIED";
          } else if (kycStatus == "VERIFIED") {
            kycStatus = "TRY AGAIN";
          } else {
            kycStatus = "PENDING";
          }
        });
      },
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Image.asset(
          assetPath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
