import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pokerpad/controller/signup_controller.dart';
import 'package:pokerpad/controller/skip_address_controller.dart';
import 'package:pokerpad/model/skip_address_request_model.dart';
import 'package:pokerpad/model/skip_address_response_model.dart';
import 'package:pokerpad/view/dob_page.dart';
import 'package:pokerpad/view/kyc_verify_camera_page.dart';

import '../constants/screen_size.dart';

class KycPage extends StatefulWidget {
  const KycPage({super.key});

  @override
  State<KycPage> createState() => _KycPageState();
}

class _KycPageState extends State<KycPage> {
  bool isLoading = false;
  final SkipAddressController _skipAddressController = SkipAddressController();
  @override
  void initState() {
    super.initState();
  }

  showAlertDialogSkip(BuildContext context) {
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.transparent,
      content: Stack(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.asset(
              "assets/images/kyc/kyc alert.png",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              bottom: 66,
              left: MediaQuery.sizeOf(context).width / 6.2,
              child: Row(
                children: [
                  SizedBox(
                      width: 140,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child:
                              Image.asset("assets/images/kyc/no button.png"))),
                  SizedBox(
                      width: 140,
                      child: isLoading
                          ? const CircularProgressIndicator()
                          : GestureDetector(
                              onTap: () {
                                skipButton();
                              },
                              child: Image.asset(
                                  "assets/images/kyc/yes button.png")))
                ],
              ))
        ],
      ),
    );

    // Show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<void> skipButton() async {
    setState(() {
      isLoading = true;
    });
    SkipAddressRequestModel request = SkipAddressRequestModel(
        skip: 1, deviceId: 1, id: SignupController.userId!.toInt());
    SkipAddressResponseModel? response =
        await _skipAddressController.skipButton(request);
    if (response != null && response.status == "OK") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: const Duration(milliseconds: 350),
          content: Text(response.data.message ?? "Skipped successfully!")));
      Navigator.push(
          context,
          PageTransition(
              child: const DobPage(),
              type: PageTransitionType.rightToLeftWithFade));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to skip ID'),
          duration: Duration(milliseconds: 400),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: ScreenSize.screenWidth,
            height: ScreenSize.screenHeight,
            child: Image.asset(
              "assets/images/background.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 65,
                  ),
                  Image.asset(
                    "assets/images/kyc/kyc verify identity.png",
                    height: 55,
                  ),
                  Image.asset(
                    "assets/images/kyc/proof of residence.png",
                    height: 300,
                  ),
                  const SizedBox(
                    height: 75,
                  ),
                  Image.asset(
                    "assets/images/kyc/step 2 take a photo.png",
                    height: 45,
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: const KycVerifyCameraPage(),
                                type: PageTransitionType.rightToLeftWithFade));
                      },
                      child: Image.asset(
                        "assets/images/kyc/Artboard 40 (1).png",
                        height: 57,
                      )),
                  GestureDetector(
                    onTap: () {
                      showAlertDialogSkip(context);
                    },
                    child: Image.asset(
                      "assets/images/kyc/skip button 2.png",
                      height: 57,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
