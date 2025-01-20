import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pokerpad/controller/signup_controller.dart';
import 'package:pokerpad/model/signup_request_model.dart';
import 'package:pokerpad/view/login_page.dart';
import 'package:pokerpad/view/verify_email_page.dart';
import 'package:pokerpad/widget/build_bold_text_widget.dart';
import 'package:pokerpad/widget/build_text_widget.dart';

import '../constants/screen_size.dart';
import '../widget/build_text_field_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool passwordVisible = true;
  TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  final SignupController _signupController = SignupController();
  final _formKey = GlobalKey<FormState>();
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    const emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regex = RegExp(emailPattern);
    if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

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

  Future<void> signup() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      isLoading = true;
    });
    final requestModel = SignupRequestModel(
        email: emailController.text,
        password: passwordController.text,
        deviceId: 1,
        accountNo: "A020241027101417");
    try {
      final response = await _signupController.signup(requestModel);
      setState(() {
        isLoading = false;
      });
      if (response.status == "OK") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            behavior: SnackBarBehavior.floating,
            backgroundColor: CupertinoColors.activeGreen,
            content: const Text(
              "Signup Successfully",
              style: TextStyle(color: Colors.white),
            )));
        Navigator.pushReplacement(
            context,
            PageTransition(
                child: VerifyEmailPage(
                  email: requestModel.email,
                  deviceId: requestModel.deviceId,
                  id: response.id!.toInt(),
                ),
                type: PageTransitionType.rightToLeftWithFade));
        // ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: Text("Signup Sucessfull..!")));
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => VerifyEmailPage(
        //         email: requestModel.email,
        //         deviceId: requestModel.deviceId,
        //         id: response.id!.toInt(),
        //       ),
        //     ));
      } else {
        if (response.status == "FAIL") {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              behavior: SnackBarBehavior.floating,
              content: Text(response.commonMessage ?? "Signup Failed")));

          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //     content: Text(response.commonMessage ?? "Signup Failed")));
        }
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          behavior: SnackBarBehavior.floating,
          content: const Text("Error Signup failed..")));
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
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.transparent,
                  width: 646,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/register.png", width: 200),
                      const BuildTextWidget(
                        text: "Create your new account",
                      ),
                      const SizedBox(height: 40),
                      // Login Fields
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            BuildTextFieldWidget(
                              hintText: "Email                 ",
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              labelText: 'email',
                              validator: validateEmail,
                            ),
                            const SizedBox(height: 5),
                            BuildTextFieldWidget(
                              hintText: "Password",
                              labelText: "password",
                              controller: passwordController,
                              obscureText: passwordVisible,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                },
                                child: passwordVisible
                                    ? Image.asset(
                                        "assets/images/Artboard 28.png",
                                        width: 47)
                                    : Image.asset(
                                        "assets/images/Artboard 29.png",
                                        width: 47),
                              ),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(8)
                              ],
                              validator: validatePassword,
                            ),
                            const SizedBox(height: 5),
                            BuildTextFieldWidget(
                              controller: confirmPasswordController,
                              labelText: "confirm password",
                              hintText: "Confirm password",
                              obscureText: true,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(8)
                              ],
                              validator: (value) => validateConfirmPassword(
                                  passwordController.text, value ?? ""),
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          text: 'Password must be at least ',
                          style: TextStyle(
                            color: Color(0xFF5F6368),
                            fontSize: 14,
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
                      const SizedBox(height: 70),
                      isLoading
                          ? const CircularProgressIndicator()
                          : GestureDetector(
                              onTap: () {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  signup();
                                }
                              },
                              child: Image.asset(
                                "assets/images/sign up button.png",
                                height: 59,
                              ),
                            ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const BuildTextWidget(
                            text: "Already have an account? ",
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                PageTransition(
                                  child: const LoginPage(),
                                  type: PageTransitionType.leftToRightWithFade,
                                ),
                              );
                            },
                            child: const BuildBoldTextWidget(text: "Login"),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
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
