import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pokerpad/view/forgot_password.dart';
import 'package:pokerpad/view/login_page.dart';
import 'package:pokerpad/widget/build_text_field_widget.dart';

import '../constants/screen_size.dart';
import '../widget/build_text_widget.dart';

class VerifyForgotPassword extends StatefulWidget {
  const VerifyForgotPassword({super.key});

  @override
  State<VerifyForgotPassword> createState() => _VerifyForgotPasswordState();
}

class _VerifyForgotPasswordState extends State<VerifyForgotPassword> {
  bool passwordVisible = true;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    // Updated regex pattern to include all special characters
    const pattern =
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&.#])[A-Za-z\d@$!%*?&.#]{8,}$';
    final regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Password must be at least 8 characters long and include '
          '1 uppercase letter, 1 lowercase letter, 1 number, and 1 symbol (@,  !, %, *, ?, &, #).';
    }
    return null;
  }

  String? validateConfirmPassword(String? confirmPassword, String? password) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Please confirm your password';
    }
    if (confirmPassword != password) {
      return 'Passwords do not match';
    }
    return null;
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
              height: 550,
              width: 400,
              child: Card(
                shadowColor: const Color(0xffB7B7B7),
                elevation: 30,
                color: Colors.grey[200],
                // color: const Color(0xffB7B7B7),
                shape: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xffB7B7B7),
                  ),
                  borderRadius: BorderRadius.circular(
                    40,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const BuildTextWidget(
                      fontSize: 12,
                      align: TextAlign.center,
                      text:
                          "A 6-digit verification code has been sent to your email\n Enter the code below",
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          6,
                          (index) => SizedBox(
                            height: 50,
                            width: 50,
                            child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              maxLength: 1,
                              style: const TextStyle(fontSize: 15),
                              decoration: InputDecoration(
                                counterText: "",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade300, width: 3),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                              ),
                              onChanged: (value) {
                                if (value.isNotEmpty && index < 5) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
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
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          BuildTextFieldWidget(
                            controller: newPasswordController,
                            hintText: "new password",
                            labelText: "new password",
                            obscureText: passwordVisible,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                              child: passwordVisible
                                  ? Image.asset("assets/images/Artboard 28.png",
                                      width: 47)
                                  : Image.asset("assets/images/Artboard 29.png",
                                      width: 47),
                            ),
                            validator: validatePassword,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(8)
                            ],
                          ),
                          BuildTextFieldWidget(
                            controller: confirmPasswordController,
                            hintText: "confirm password",
                            labelText: "confirm password",
                            obscureText: true,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(8)
                            ],
                            validator: (value) => validateConfirmPassword(
                                newPasswordController.text, value ?? ""),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  confirmPasswordController.clear();
                                });
                              },
                              child: Image.asset(
                                  "assets/images/pokerPadArt/Artboard 30 (1).png"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          text: 'Password must be at least ',
                          style: TextStyle(
                            color: Color(0xFF5F6368),
                            fontSize: 13,
                          ),
                          children: [
                            TextSpan(
                              text: '8 characters ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            TextSpan(
                              text: 'and contain ',
                              style: TextStyle(
                                color: Color(0xFF5F6368),
                                fontSize: 14,
                              ),
                            ),
                            TextSpan(
                              text: '1 number, ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            TextSpan(
                              text: '1 uppercase letter, ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            TextSpan(
                              text: '1 lowercase letter ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            TextSpan(
                              text: ' and ',
                              style: TextStyle(
                                color: Color(0xFF5F6368),
                                fontSize: 14,
                              ),
                            ),
                            TextSpan(
                              text: '1 symbol.',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: const ForgotPassword(),
                                    type: PageTransitionType
                                        .leftToRightWithFade));
                          },
                          child: Image.asset(
                            "assets/images/pokerPadArt/cancel.png",
                            width: 180,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: const LoginPage(),
                                      type: PageTransitionType
                                          .rightToLeftWithFade));
                            }
                          },
                          child: Image.asset(
                            "assets/images/pokerPadArt/proceed.png",
                            width: 180,
                          ),
                        )
                      ],
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
