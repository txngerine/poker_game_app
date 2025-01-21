import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pokerpad/view/verify_forgot_password.dart';
import 'package:pokerpad/widget/build_text_field_widget.dart';

import '../constants/screen_size.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController emailController = TextEditingController();
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
          Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Stack(
                children: [
                  Image.asset(
                      "assets/images/pokerPadArt/forgot pass frame (1).png"),
                  Positioned(
                    top: 225,
                    left: 60,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: BuildTextFieldWidget(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          hintText: "Your Email",
                          labelText: "Enter Your Email"),
                    ),
                  ),
                  Positioned(
                      top: 325,
                      left: 90,
                      child: SizedBox(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: const VerifyForgotPassword(),
                                    type: PageTransitionType
                                        .rightToLeftWithFade));
                          },
                          child: Image.asset(
                              width: MediaQuery.of(context).size.width / 1.5,
                              "assets/images/pokerPadArt/confirm button.png"),
                        ),
                      ))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
