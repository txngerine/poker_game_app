import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pokerpad/controller/signup_controller.dart';
import 'package:pokerpad/controller/skip_id_controller.dart';
import 'package:pokerpad/model/skip_id_request_model.dart';
import 'package:pokerpad/model/skip_id_response_model.dart';
import 'package:pokerpad/view/kyc_identity_camera_page.dart';
import 'package:pokerpad/view/kyc_page.dart';

import '../constants/screen_size.dart';

class KycCompletePage extends StatefulWidget {
  const KycCompletePage({super.key});

  @override
  State<KycCompletePage> createState() => _KycCompletePageState();
}

class _KycCompletePageState extends State<KycCompletePage> {
  bool isLoading = false;
  final SkipIdController _skipIdController = SkipIdController();
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
              bottom: 67,
              left: MediaQuery.sizeOf(context).width / 6.2,
              child: Row(
                children: [
                  SizedBox(
                      width: 140,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Image.asset(
                            "assets/images/kyc/no button.png",
                          ))),
                  SizedBox(
                      width: 140,
                      child: isLoading
                          ? const CircularProgressIndicator()
                          : GestureDetector(
                              onTap: () {
                                skipButton();
                                // Navigator.push(
                                //     context,
                                //     PageTransition(
                                //         child: const KycPage(),
                                //         type: PageTransitionType
                                //             .rightToLeftWithFade));
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
    try {
      SkipIdRequestModel request = SkipIdRequestModel(
          skip: 1, deviceId: 1, id: SignupController.userId!.toInt());
      SkipIdResponseModel? response =
          await _skipIdController.skipButton(request);
      if (response != null && response.status == "OK") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: const Duration(milliseconds: 350),
            content: Text(response.data?.message ?? "Skipped successfully!")));
        Navigator.push(
            context,
            PageTransition(
                child: const KycPage(),
                type: PageTransitionType.rightToLeftWithFade));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to skip ID'),
            duration: Duration(milliseconds: 400),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred: $e'),
          duration: const Duration(milliseconds: 400),
        ),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

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
                    "assets/images/kyc/complete kyc.png",
                    height: 30,
                  ),
                  Image.asset(
                    "assets/images/kyc/proof of identity.png",
                    height: 350,
                  ),
                  const SizedBox(
                    height: 65,
                  ),
                  Image.asset(
                    "assets/images/kyc/step1.png",
                    height: 40,
                  ),
                  const SizedBox(
                    height: 65,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: const KycIdentityCameraPage(),
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
