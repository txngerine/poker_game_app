import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pokerpad/controller/verification_controller.dart';
import 'package:pokerpad/model/verification_request_model.dart';
import 'package:pokerpad/view/avatar_page.dart';
import 'package:pokerpad/widget/build_heading_text.dart';
import 'package:pokerpad/widget/build_text_widget.dart';

import '../constants/screen_size.dart';

class VerifyEmailPage extends StatefulWidget {
  final String email;
  final String deviceId;
  final int id;
  const VerifyEmailPage(
      {super.key,
      required this.email,
      required this.deviceId,
      required this.id});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isLoading = false;
  String? _errorText; // Error message for OTP validation
  final VerificationController _verificationController =
      VerificationController();
  final List<TextEditingController> _otpControllers = List.generate(
    4,
    (index) => TextEditingController(),
  );

  Future<void> verify() async {
    setState(() {
      _errorText = null; // Reset error message
    });

    // Check if all OTP fields are filled
    bool isAnyFieldEmpty =
        _otpControllers.any((controller) => controller.text.isEmpty);

    if (isAnyFieldEmpty) {
      setState(() {
        _errorText = "Please type the verification code.";
      });
      return;
    }

    setState(() {
      isLoading = true;
    });

    final otp = _otpControllers.map((controller) => controller.text).join();
    final requestModel = VerificationRequestModel(
      email: widget.email,
      otp: otp,
      deviceId: widget.deviceId,
      id: widget.id,
    );

    final response = await _verificationController.verify(requestModel);

    setState(() {
      isLoading = false;
    });

    if (response != null && response.status == "OK") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: CupertinoColors.activeGreen,
          content: const Text(
            "Verification Successful",
            style: TextStyle(color: Colors.white),
          )));
      Navigator.push(
          context,
          PageTransition(
              child: const AvatarPage(),
              type: PageTransitionType.rightToLeftWithFade));
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     elevation: 10,
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(24),
      //     ),
      //     behavior: SnackBarBehavior.floating,
      //     content:
      //         Text(response?.messages?["common"] ?? "Verification failed")));
      setState(() {
        _errorText =
            response?.messages?["common"] ?? "Invalid verification code!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          Center(
            child: SizedBox(
              height: 450,
              width: 350,
              child: Card(
                shadowColor: const Color(0xffB7B7B7),
                elevation: 30,
                color: const Color(0xffB7B7B7),
                shape: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xffB7B7B7),
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const BuildHeadingText(text: "Verify Email"),
                      const SizedBox(height: 10),
                      const Icon(
                        Icons.mail_outline,
                        color: Colors.black26,
                        size: 40,
                      ),
                      const SizedBox(height: 20),
                      const BuildTextWidget(
                        align: TextAlign.center,
                        text:
                            "A 4-digit verification code has been sent to your email. Enter the code below.",
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          4,
                          (index) => SizedBox(
                            height: 40,
                            width: 40,
                            child: TextField(
                              controller: _otpControllers[index],
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              maxLength: 1,
                              style: const TextStyle(fontSize: 15),
                              decoration: InputDecoration(
                                counterText: "",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 4,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                                fillColor: Colors.grey[200],
                                filled: true,
                              ),
                              onChanged: (value) {
                                if (value.isNotEmpty && index < 3) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      GestureDetector(
                        onTap: () {
                          // Resend OTP logic
                        },
                        child: Image.asset(
                          "assets/images/verifyemail/resend code button (3).png",
                          height: 50,
                        ),
                      ),
                      const SizedBox(height: 10),
                      if (_errorText != null) ...[
                        Container(
                          width: 270,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black54, width: 2),
                            color: Colors.orange[50], // Light red background
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              _errorText!,
                              style: const TextStyle(
                                color: Colors.black, // Text color
                              ),
                            ),
                          ),
                        ),
                      ],
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/verifyemail/back button.png",
                            height: 45,
                          ),
                          isLoading
                              ? const CircularProgressIndicator()
                              : GestureDetector(
                                  onTap: verify,
                                  child: Image.asset(
                                    "assets/images/verifyemail/confirm button (1).png",
                                    height: 43,
                                  ),
                                ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
