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
  final int deviceId;
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
  final VerificationController _verificationController =
      VerificationController();
  final List<TextEditingController> _otpControllers = List.generate(
    4,
    (index) => TextEditingController(),
  );

  // 88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
  // Future<void> verify() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //
  //   final otp = _otpControllers.map((controller) => controller.text).join();
  //   final requestModel = VerificationRequestModel(
  //     email: widget.email,
  //     otp: otp,
  //     deviceId: widget.deviceId,
  //     id: widget.id,
  //   );
  //
  //   try {
  //     print("Request Payload: ${requestModel.toJson()}");
  //     final response = await Dio().post(
  //       "http://3.6.170.253:1080/server.php/api/v1/player/verify",
  //       data: requestModel.toJson(),
  //       options: Options(validateStatus: (status) => true),
  //     );
  //
  //     setState(() {
  //       isLoading = false;
  //     });
  //
  //     if (response.statusCode == 200) {
  //       print("Verification OK");
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => const AvatarPage()),
  //       );
  //     } else {
  //       final errorMessage = response.data['message'] ?? "Verification failed";
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text(errorMessage)),
  //       );
  //     }
  //   } catch (e) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //     print("Exception: $e");
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text("An error occurred")),
  //     );
  //   }
  // }
  Future<void> verify() async {
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
            "Verification Successfully",
            style: TextStyle(color: Colors.white),
          )));
      Navigator.pushReplacement(
          context,
          PageTransition(
              child: const AvatarPage(),
              type: PageTransitionType.rightToLeftWithFade));
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => const AvatarPage()),
      // );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          behavior: SnackBarBehavior.floating,
          content:
              Text(response?.messages?["common"] ?? "Verification failed")));

      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //       content:
      //           Text(response?.messages?["common"] ?? "Verification failed")),
      // );
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
                // opacity: 0.14,
                image: AssetImage(
                  "assets/images/background.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              height: 410,
              width: 350,
              child: Card(
                shadowColor: const Color(0xffB7B7B7),
                elevation: 30,
                color: const Color(0xffB7B7B7),
                shape: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xffB7B7B7),
                  ),
                  borderRadius: BorderRadius.circular(
                    50,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const BuildHeadingText(text: "Verify Email"),
                      const SizedBox(height: 20),
                      const BuildTextWidget(
                        align: TextAlign.center,
                        text:
                            "A 4-digit verification code has been sent to your email Enter the code below",
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                      color: Colors.grey, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
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
                            // resendOtp();
                          },
                          child: Image.asset(
                            "assets/images/resend code button.png",
                            height: 50,
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      isLoading
                          ? const CircularProgressIndicator()
                          : GestureDetector(
                              onTap: () {
                                // verifyOtp();
                                verify();
                              },
                              child: Image.asset(
                                  "assets/images/verify button.png")),
                      //nooo
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
