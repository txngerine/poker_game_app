import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:pokerpad/view/login_page.dart';
import 'package:pokerpad/widget/build_heading_text.dart';
import 'package:pokerpad/widget/build_text_widget.dart';
import 'package:pokerpad/widget/build_page_transition_button.dart';

import '../constants/screen_size.dart';
import '../widget/build_text_field_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                color: Colors.transparent,
                width: 646,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/register.jpg"),

                    const SizedBox(height: 12),
                    const BuildTextWidget(
                      text: "Create your new account",
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                    ),
                    const SizedBox(height: 40),
                    // Login Fields
                    const BuildTextFieldWidget(),
                    const SizedBox(height: 30),
                    const BuildTextFieldWidget(),
                    const SizedBox(height: 30),
                    const BuildTextFieldWidget(),
                    const SizedBox(height: 30),
                    const BuildTextWidget(
                        align: TextAlign.center,
                        text:
                            "Password must be at least 8 characters and contain 1 number, 1 uppercase letter, 1 lowercase letter, and 1 symbol.",
                        fontSize: 20),
                    const SizedBox(
                      height: 100,
                    ),
                    Image.asset("assets/images/sign up button.png"),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BuildTextWidget(
                            text: "Already have an account? ", fontSize: 20),
                        BuildPageTransitionButton(
                            buttonText: "  Login",
                            destinationPage: LoginPage()),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
