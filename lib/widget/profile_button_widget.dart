
import 'package:flutter/material.dart';
import 'package:pokerpad/model/login_response_model.dart';
import 'package:pokerpad/widget/build_sub_heading_text.dart';
import 'package:provider/provider.dart';

import '../provider/country_provider.dart';
import 'phonenumber_popup.dart';

enum KycStatus { verified, pending, tryAgain, unknown }

class ProfileButtonWidget extends StatefulWidget {
  final Data userData;

  const ProfileButtonWidget({super.key, required this.userData});

  @override
  State<ProfileButtonWidget> createState() => _ProfileButtonWidgetState();
}

class _ProfileButtonWidgetState extends State<ProfileButtonWidget> {
  bool _isEditing = false;
  late KycStatus faceStatus;
  late KycStatus idStatus;

  @override
  void initState() {
    super.initState();
    faceStatus = _getKycStatus(widget.userData.kyc?.faceStatus);
    idStatus = _getKycStatus(widget.userData.kyc?.idStatus);
  }

  KycStatus _getKycStatus(String? status) {
  switch (status?.toUpperCase()) {
    case "VERIFIED":
    case "APPROVED":
      return KycStatus.verified;
    case "TRY AGAIN":
      return KycStatus.tryAgain;
    case "PENDING":
      return KycStatus.pending;
    default:
      return KycStatus.unknown;
  }
}


  KycStatus _getNextStatus(KycStatus current) {
    switch (current) {
      case KycStatus.pending:
        return KycStatus.verified;
      case KycStatus.verified:
        return KycStatus.tryAgain;
      case KycStatus.tryAgain:
      default:
        return KycStatus.pending;
    }
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
                _buildKYCRow("FACE CHECK", faceStatus, () {
                  setState(() => faceStatus = _getNextStatus(faceStatus));
                }),
                const SizedBox(height: 10),
                _buildKYCRow("PROOF OF IDENTITY", idStatus, () {
                  setState(() => idStatus = _getNextStatus(idStatus));
                }),
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
                image: AssetImage("assets/images/profilebutton/mail_phone_field.png"),
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
                image: AssetImage("assets/images/profilebutton/mail_phone_field.png"),
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
  showPhoneNumberPopup(
    context,
    userId: widget.userData.id ?? 0,
    phoneNumber: widget.userData.phone ?? '',
    onPhoneNumberUpdated: (updatedPhone) async {
      final provider = Provider.of<CountryProvider>(context, listen: false);
      await provider.updatePhoneNumbe(context, widget.userData.id ?? 0, updatedPhone);
      setState(() {
        widget.userData.phone = updatedPhone;
        _isEditing = false;
      });
    },
  );
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
    String assetPath;
    String titleText;
    Color textColor;
    double fontSize;

    switch (faceStatus) {
      case KycStatus.verified:
        assetPath = "assets/images/profilebutton/name_field.png";
        titleText = "KYC VERIFICATION";
        textColor = Colors.white;
        fontSize = 15;
        break;
      case KycStatus.pending:
        assetPath = "assets/images/profilebutton/profile_alerts.png";
        titleText = "Thank you for your submission! Your KYC verification is currently in progress. Please be patient as our team reviews your documents.";
        textColor = Colors.black;
        fontSize = 10;
        break;
      case KycStatus.tryAgain:
        assetPath = "assets/images/profilebutton/profile_alerts.png";
        titleText = "We're sorry, but your KYC verification was not successful. Please review the requirements and try again.";
        textColor = Colors.black;
        fontSize = 10;
        break;
      default:
        assetPath = "assets/images/profilebutton/profile_alerts.png";
        titleText = "KYC status unknown.";
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

  Widget _buildKYCRow(String label, KycStatus status, VoidCallback onTap) {
    return Row(
      children: [
        Expanded(child: _buildKYCButton(label)),
        const SizedBox(width: 10),
        Expanded(child: _buildStatusButton(status, onTap)),
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

  Widget _buildStatusButton(KycStatus status, VoidCallback onTap) {
    String assetPath;
    switch (status) {
      case KycStatus.verified:
        assetPath = "assets/images/profilebutton/verified_button.png";
        break;
      case KycStatus.tryAgain:
        assetPath = "assets/images/profilebutton/try_again_button.png";
        break;
      case KycStatus.pending:
        assetPath = "assets/images/profilebutton/pending_notification.png";
        break;
      default:
        assetPath = "assets/images/profilebutton/pending_notification.png";
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Image.asset(assetPath, fit: BoxFit.cover),
      ),
    );
  }
}
