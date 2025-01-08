import 'package:flutter/material.dart';
import 'package:pokerpad/view/avatar_page.dart';
import 'package:pokerpad/widget/build_heading_text.dart';
import 'package:pokerpad/widget/build_text_widget.dart';

import '../constants/screen_size.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  final List<TextEditingController> _otpControllers = List.generate(
    4,
    (index) => TextEditingController(),
  );

  void verifyOtp() {
    final otp = _otpControllers.map((controller) => controller.text).join();
    if (otp == "1234") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("OTP Verified Successfully")),
      );
      setState(() {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const AvatarPage(),
            ));
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid OTP")),
      );
    }
  }

  void resendOtp() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("OTP Resent Successfully")),
    );
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
              height: 510,
              width: 400,
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
                            height: 60,
                            width: 50,
                            child: TextField(
                              controller: _otpControllers[index],
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              maxLength: 1,
                              style: const TextStyle(fontSize: 24),
                              decoration: InputDecoration(
                                counterText: "",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
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
                            resendOtp();
                          },
                          child: Image.asset(
                              "assets/images/resend code button.png")),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                          onTap: () {
                            verifyOtp();
                          },
                          child:
                              Image.asset("assets/images/verify button.png")),
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
