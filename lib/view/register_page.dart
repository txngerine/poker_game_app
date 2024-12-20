import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pokerpad/view/login_page.dart';
import 'package:pokerpad/view/text_page.dart';
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
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                    Image.asset(
                      "assets/images/register.png",
                      width: 200,
                    ),

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
                            hintText: "email",
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            labelText: 'email',
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          BuildTextFieldWidget(
                            hintText: "password",
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
                                      width: 77,
                                    )
                                  : Image.asset(
                                      "assets/images/Artboard 29.png",
                                      width: 77,
                                    ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          BuildTextFieldWidget(
                            controller: confirmPasswordController,
                            labelText: "confirm password",
                            hintText: "confirm password",
                            obscureText: true,
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  confirmPasswordController.clear();
                                },
                                child: Image.asset(
                                    "assets/images/Artboard 30.png")),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        text: 'Password must be at least ',
                        style: TextStyle(
                          color: Color(0xFF5F6368),
                          fontSize: 24,
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
                              fontSize: 24,
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
                              fontSize: 24,
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
                    const SizedBox(
                      height: 100,
                    ),
                    GestureDetector(
                        onTap: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            print("button press");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const TextPage(),
                                ));
                          } else {
                            print("Form is not valid");
                          }
                        },
                        child: Image.asset("assets/images/sign up button.png")),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const BuildTextWidget(
                          text: "Already have an account? ",
                        ),
                        //   BuildPageTransitionButton(
                        //       buttonText: "  Login",
                        //       destinationPage: LoginPage()),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      child: const LoginPage(),
                                      type: PageTransitionType
                                          .leftToRightWithFade));
                            },
                            child: const BuildBoldTextWidget(text: "Login")),
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
