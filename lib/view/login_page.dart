import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:pokerpad/constants/screen_size.dart';
import 'package:pokerpad/view/register_page.dart';
import 'package:pokerpad/widget/build_heading_text.dart';
import 'package:pokerpad/widget/build_text_field_widget.dart';
import 'package:pokerpad/widget/build_text_widget.dart';
import 'package:pokerpad/widget/build_page_transition_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordVisible = true;
  bool rememberButton = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.orange[300],
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
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                color: Colors.transparent,
                width: 646,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/welcome.jpg"),
                    // const BuildHeadingText(text: "WELCOME TO POKERPAD"),
                    const SizedBox(height: 12),
                    const BuildTextWidget(
                      text: "Login to your account",
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                    ),
                    const SizedBox(height: 24),
                    // Login Fields
                    const BuildTextFieldWidget(),
                    const SizedBox(height: 20),
                    BuildTextFieldWidget(
                      obscureText: passwordVisible,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                        child: passwordVisible
                            ? Image.asset("assets/images/Artboard 28.png")
                            : Image.asset("assets/images/Artboard 29.png"),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  rememberButton = !rememberButton;
                                });
                              },
                              child: rememberButton
                                  ? Image.asset(
                                      "assets/images/empty checkmark.png",
                                      width: 53,
                                      height: 54,
                                    )
                                  : Image.asset(
                                      "assets/images/Artboard 41.png"),
                            ),
                            const BuildTextWidget(
                              text: "Remember me",
                              fontSize: 20,
                            )
                          ],
                        ),
                        const BuildTextWidget(
                            text: "Forgot password?", fontSize: 20),
                      ],
                    ),
                    const SizedBox(height: 54),
                    GestureDetector(
                        onTap: () {
                          print("Login button tapped");
                        },
                        child: Image.asset("assets/images/login button.png")),
                    const SizedBox(height: 24),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BuildTextWidget(
                            text: "Don’t have an account? ", fontSize: 20),
                        BuildPageTransitionButton(
                            buttonText: "Sign up",
                            destinationPage: RegisterPage())
                      ],
                    ),
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
