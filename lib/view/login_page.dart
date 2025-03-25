import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pokerpad/constants/screen_size.dart';
import 'package:pokerpad/view/forgot_password.dart';
import 'package:pokerpad/view/register_page.dart';
import 'package:pokerpad/widget/build_bold_text_widget.dart';
import 'package:pokerpad/widget/build_sub_heading_text.dart';
import 'package:pokerpad/widget/build_text_field_widget.dart';
import 'package:pokerpad/widget/build_text_widget.dart';
import 'package:provider/provider.dart';

import '../provider/login_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordVisible = true;
  bool rememberButton = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    print("Device id login:${loginProvider.deviceId}");

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
              child: Container(
                color: Colors.transparent,
                width: 646,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Image.asset(
                      "assets/images/welcome_to_pokerpad.png",
                    ),
                    const SizedBox(height: 12),
                    const BuildTextWidget(
                      text: "Login to your account",
                    ),
                    const SizedBox(height: 24),
                    // Login Fields
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          BuildTextFieldWidget(
                            controller: loginProvider.emailController,
                            hintText: "Email",
                            labelText: 'email',
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your email";
                              } else if (!RegExp(
                                      r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                                return "Please enter a valid email";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          BuildTextFieldWidget(
                            labelText: "password",
                            hintText: "Password",
                            controller: loginProvider.passwordController,
                            obscureText: passwordVisible,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your password";
                              }
                              return null;
                            },
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                              child: passwordVisible
                                  ? Image.asset(
                                      "assets/images/Artboard 28.png",
                                      width: 47,
                                    )
                                  : Image.asset(
                                      "assets/images/Artboard 29.png",
                                      width: 47,
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Row(
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
                                        width: 30,
                                      )
                                    : Image.asset(
                                        "assets/images/Artboard 41.png",
                                        width: 30,
                                      ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              const BuildTextWidget(
                                text: "Remember me",
                              )
                            ],
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: const ForgotPassword(),
                                        type: PageTransitionType
                                            .rightToLeftWithFade));
                              },
                              child: const BuildBoldTextWidget(
                                  text: "Forgot password"))
                        ],
                      ),
                    ),
                    const SizedBox(height: 54),
                    // isLoading
                    //     ? CircularProgressIndicator()
                    //     : GestureDetector(
                    //         onTap: () {
                    //           if (_formKey.currentState?.validate() ?? false) {
                    //             login(); // Call the login function
                    //           } else {
                    //             print("Form is not valid");
                    //           }
                    //         },
                    //         child: Image.asset(
                    //           "assets/images/login button.png",
                    //           height: 59,
                    //         ),
                    //       ),

                    loginProvider.isLoading
                        ? Column(
                            children: [
                              const SizedBox(height: 20),
                              loginProvider.downloadProgress > 0
                                  ? Column(
                                      children: [
                                        LinearProgressIndicator(
                                          value: loginProvider.downloadProgress,
                                          backgroundColor: Colors.grey[300],
                                          color: Colors.blue,
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          '${(loginProvider.downloadProgress * 100).toStringAsFixed(0)}%',
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    )
                                  : const CircularProgressIndicator(),
                            ],
                          )
                        : GestureDetector(
                            onTap: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                loginProvider
                                    .login(context); // Call the login function
                                // _connectWebSocket();
                              } else {
                                print("Form is not valid");
                              }
                            },
                            child: Image.asset(
                              "assets/images/login button.png",
                              height: 59,
                            ),
                          ),

                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const BuildTextWidget(
                          text: "Don’t have an account? ",
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      child: const RegisterPage(),
                                      type: PageTransitionType
                                          .rightToLeftWithFade));
                            },
                            child: const BuildBoldTextWidget(text: " Sign up")),
                      ],
                    ),
                    const Spacer(),
                    const BuildSubHeadingText(
                      text: "Version:2.0.0",
                      fontSize: 10,
                      color: Colors.black26,
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
