// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';
// import 'package:pokerpad/widget/build_sub_heading_text.dart';

// class ProfileButtonWidget extends StatefulWidget {
//   const ProfileButtonWidget({super.key});

//   @override
//   State<ProfileButtonWidget> createState() => _ProfileButtonWidgetState();
// }

// class _ProfileButtonWidgetState extends State<ProfileButtonWidget> {
//   bool _isEditing = false;
//   String kycStatus = "PENDING"; // Default status

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;

//     return Dialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       backgroundColor: const Color(0xFF3C3D37),
//       child: Container(
//         padding: const EdgeInsets.all(15),
//         width: width * 0.9,
//         decoration: BoxDecoration(
//           color: const Color(0xFF2F2F2F),
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             _buildNameIDSection(),
//             const SizedBox(height: 10),
//             _buildEmailPhoneSection(),
//             const SizedBox(height: 20),
//             _buildKYCVerificationTitle(),
//             const SizedBox(height: 10),
//             Column(
//               children: [
//                 _buildKYCRow("FACE CHECK"),
//                 const SizedBox(height: 10),
//                 _buildKYCRow("PROOF OF IDENTITY"),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildNameIDSection() {
//     return Container(
//       height: 50,
//       padding: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         image: const DecorationImage(
//           image: AssetImage("assets/images/profilebutton/name_field.png"),
//           fit: BoxFit.fill,
//         ),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: const [
//           Text(
//             "  JASPER DEN HOLLANDER",
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 15,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           Text(
//             "ID:113  ",
//             style: TextStyle(color: Colors.white, fontSize: 15),
//           ),
//         ],
//       ),
//     );
//   }

//  Widget _buildEmailSection() {
//   return Expanded(
//     child: Container(
//       height: 50,
//       padding: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         image: const DecorationImage(
//           image: AssetImage("assets/images/profilebutton/mail_phone_field.png"),
//           fit: BoxFit.cover,
//         ),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Center(
//         child: const Text(
//           "jasper.from.holand@gmail.com",
//           style: TextStyle(color: Colors.white70, fontSize: 12),
//         ),
//       ),
//     ),
//   );
// }

// Widget _buildPhoneSection() {
//   return Expanded(
//     child: Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       height: 50,
//       decoration: BoxDecoration(
//         image: const DecorationImage(
//           image: AssetImage("assets/images/profilebutton/mail_phone_field.png"),
//           fit: BoxFit.cover,
//         ),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           const Text(
//             "+38651646587",
//             style: TextStyle(color: Colors.white70, fontSize: 12),
//           ),
//           GestureDetector(
//             onTap: () {
//               setState(() {
//                 _isEditing = !_isEditing;
//               });
//             },
//             child: CircleAvatar(
//               radius: 23, // Adjust size
//               backgroundColor: Colors.transparent, // Transparent background
//               child: Image.asset(
//                 _isEditing
//                     ? "assets/images/profilebutton/edit_button_active.png"
//                     : "assets/images/profilebutton/edit_button_passive.png",
//                 width: 50, // Adjust icon size
//                 height: 50,
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

// Widget _buildEmailPhoneSection() {
//   return Row(
//     children: [
//       _buildEmailSection(),
//       const SizedBox(width: 10),
//       _buildPhoneSection(),
//     ],
//   );
// }

//   // Widget _buildKYCVerificationTitle() {
//   //   String assetPath = kycStatus == "VERIFIED"
//   //       ? "assets/images/profilebutton/name_field.png"
//   //       : "assets/images/profilebutton/profile_alerts.png";

//   //   return Container(
//   //     padding: const EdgeInsets.all(14),
//   //     decoration: BoxDecoration(
//   //       image: DecorationImage(
//   //         image: AssetImage(assetPath),
//   //         fit: BoxFit.cover,
//   //       ),
//   //       borderRadius: BorderRadius.circular(20),
//   //     ),
//   //     child: const Center(
//   //       child: Text(
//   //         "KYC VERIFICATION",
//   //         style: TextStyle(
//   //           color: Colors.white,
//   //           fontSize: 18,
//   //           fontWeight: FontWeight.bold,
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }

//   Widget _buildKYCVerificationTitle() {
//   String assetPath = kycStatus == "VERIFIED"
//       ? "assets/images/profilebutton/name_field.png"
//       : "assets/images/profilebutton/profile_alerts.png";

//   String titleText = "KYC VERIFICATION";
//   Color textColor = Colors.white;
//   double fontSize = 15;

//   if (kycStatus == "PENDING") {
//     titleText = "Thank you for your submission! Your KYC verification is currently in progress. "
//         "Please be patient as our team reviews your documents. If you have any questions, "
//         "feel free to reach out to our support team.";
//     textColor = Colors.black;
//     fontSize = 10;
//   } else if (kycStatus == "TRY AGAIN") {
//     titleText = "We're sorry, but your KYC verification has not been successful. "
//         "Please review the requirements and try again. If you need assistance, "
//         "feel free to contact our support team for guidance.";
//     textColor = Colors.black;
//     fontSize = 10;
//   }

//   // Override text color and font size if profile alert asset is used
//   if (assetPath == "assets/images/profilebutton/profile_alerts.png") {
//     textColor = Colors.black;
//     fontSize = 10;
//   }

//   return Container(
//     height: 80,
//     padding: const EdgeInsets.all(14),
//     decoration: BoxDecoration(
//       image: DecorationImage(
//         image: AssetImage(assetPath),
//         fit: BoxFit.fill,
//       ),
//       borderRadius: BorderRadius.circular(20),
//     ),
//     child: Center(
//       child: BuildSubHeadingText(
//         text: titleText,
//         color: textColor,
//         fontSize: fontSize,
//       ),
//     ),
//   );
// }

//   Widget _buildKYCRow(String leftText) {
//     return Row(
//       children: [
//         Expanded(
//           child: _buildKYCButton(leftText),
//         ),
//         const SizedBox(width: 10),
//         Expanded(
//           child: _buildStatusButton(),
//         ),
//       ],
//     );
//   }

//   Widget _buildKYCButton(String text) {
//     return Container(
//       height: 55,
//       padding: const EdgeInsets.symmetric(vertical: 12),
//       decoration: BoxDecoration(
//         image: const DecorationImage(
//           image: AssetImage("assets/images/profilebutton/kyc_field.png"),
//           fit: BoxFit.fill,
//         ),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Center(
//         child: BuildSubHeadingText(text: text, color: Colors.white, fontSize: 15,textAlign: TextAlign.start,),
//       ),
//     );
//   }

//   Widget _buildStatusButton() {
//     String assetPath;

//     if (kycStatus == "PENDING") {
//       assetPath = "assets/images/profilebutton/pending_notification.png";
//     } else if (kycStatus == "VERIFIED") {
//       assetPath = "assets/images/profilebutton/verified_button.png";
//     } else {
//       assetPath = "assets/images/profilebutton/try_again_button.png";
//     }

//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           if (kycStatus == "PENDING") {
//             kycStatus = "VERIFIED";
//           } else if (kycStatus == "VERIFIED") {
//             kycStatus = "TRY AGAIN";
//           } else {
//             kycStatus = "PENDING";
//           }
//         });
//       },
//       child: Container(
//         height: 45,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Image.asset(
//           assetPath,
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:pokerpad/model/login_response_model.dart';
import 'package:pokerpad/widget/build_sub_heading_text.dart';

class ProfileButtonWidget extends StatefulWidget {
  final Data userData;

  const ProfileButtonWidget({super.key, required this.userData});

  @override
  State<ProfileButtonWidget> createState() => _ProfileButtonWidgetState();
}

class _ProfileButtonWidgetState extends State<ProfileButtonWidget> {
  bool _isEditing = false;
  late String kycStatus;

  @override
  void initState() {
    super.initState();
    // kycStatus = widget.userData.faceStatus ?? "PENDING";
    kycStatus = widget.userData.kyc?.faceStatus ?? "pending";
  }

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
      height: 50,
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
        children: [
          Text(
            "  ${widget.userData.nickname ?? ""}".toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "ID: ${widget.userData.id ?? ""}  ",
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget _buildEmailPhoneSection() {
    return Row(
      children: [
        Flexible(
          child: Container(
            height: 50,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(
                    "assets/images/profilebutton/mail_phone_field.png"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                widget.userData.email ?? "",
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(
                    "assets/images/profilebutton/mail_phone_field.png"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.userData.phone ?? "",
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isEditing = !_isEditing;
                    });
                  },
                  child: CircleAvatar(
                    radius: 23,
                    backgroundColor: Colors.transparent,
                    child: Image.asset(
                      _isEditing
                          ? "assets/images/profilebutton/edit_button_active.png"
                          : "assets/images/profilebutton/edit_button_passive.png",
                      width: 50,
                      height: 50,
                    ),
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
    String assetPath = kycStatus == "VERIFIED"
        ? "assets/images/profilebutton/name_field.png"
        : "assets/images/profilebutton/profile_alerts.png";

    String titleText = "KYC VERIFICATION";
    Color textColor = Colors.white;
    double fontSize = 15;

    if (kycStatus == "PENDING") {
      titleText =
          "Thank you for your submission! Your KYC verification is currently in progress. "
          "Please be patient as our team reviews your documents.";
      textColor = Colors.black;
      fontSize = 10;
    } else if (kycStatus == "TRY AGAIN") {
      titleText =
          "We're sorry, but your KYC verification was not successful. Please review the requirements and try again.";
      textColor = Colors.black;
      fontSize = 10;
    }

    return Container(
      height: 80,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(assetPath),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: BuildSubHeadingText(
          text: titleText,
          color: textColor,
          fontSize: fontSize,
        ),
      ),
    );
  }

  Widget _buildKYCRow(String label) {
    return Row(
      children: [
        Expanded(child: _buildKYCButton(label)),
        const SizedBox(width: 10),
        Expanded(child: _buildStatusButton()),
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
        child: BuildSubHeadingText(
          text: text,
          color: Colors.white,
          fontSize: 15,
          textAlign: TextAlign.start,
        ),
      ),
    );
  }

  Widget _buildStatusButton() {
    String assetPath = kycStatus == "VERIFIED"
        ? "assets/images/profilebutton/verified_button.png"
        : kycStatus == "TRY AGAIN"
            ? "assets/images/profilebutton/try_again_button.png"
            : "assets/images/profilebutton/pending_notification.png";

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
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Image.asset(assetPath, fit: BoxFit.cover),
      ),
    );
  }
}
