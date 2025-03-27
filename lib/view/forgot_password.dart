import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pokerpad/controller/forgot_password_controller.dart';
import 'package:pokerpad/model/forgot_password_model.dart';
import 'package:pokerpad/view/verify_forgot_password.dart';
import 'package:pokerpad/widget/build_text_field_widget.dart';

import '../constants/screen_size.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool isLoading = false;
  final TextEditingController emailController = TextEditingController();
  final ForgotPasswordController forgotPasswordController =
      ForgotPasswordController();
  Future<void> forgotPassword() async {
    setState(() {
      isLoading = true;
    });
    final request = ForgotPasswordRequestModel(email: emailController.text);
    try {
      final response = await forgotPasswordController.forgotPassword(request);
      setState(() {
        isLoading = false;
      });
      print(response);
      if (response != null) {
        Navigator.pushReplacement(
            context,
            PageTransition(
                child: VerifyForgotPassword(
                  email: emailController.text,
                ),
                type: PageTransitionType.rightToLeftWithFade));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to send reset email')),
        );
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      // Handle any errors
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An error occurred, please try again')),
      );
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
          Column(
            children: [
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
                            forgotPassword();
                          },
                          child: isLoading
                              ? SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  child: Center(
                                      child: const CircularProgressIndicator()))
                              : Image.asset(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
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
