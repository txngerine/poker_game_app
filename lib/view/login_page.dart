import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pokerpad/constants/screen_size.dart';
import 'package:pokerpad/view/register_page.dart';
import 'package:pokerpad/view/text_page.dart';
import 'package:pokerpad/widget/build_bold_text_widget.dart';
import 'package:pokerpad/widget/build_text_field_widget.dart';
import 'package:pokerpad/widget/build_text_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordVisible = true;
  bool rememberButton = true;
  TextEditingController emailController =
      TextEditingController(text: "user@gmail.com");
  TextEditingController passwordController =
      TextEditingController(text: "User@123");
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
                            controller: emailController,
                            hintText: "Email",
                            labelText: 'email',
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          BuildTextFieldWidget(
                            labelText: "password",
                            hintText: "password",
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
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                                      width: 50,
                                    )
                                  : Image.asset(
                                      "assets/images/Artboard 41.png",
                                      width: 40,
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
                        const BuildBoldTextWidget(text: "Forgot password")
                      ],
                    ),
                    const SizedBox(height: 54),
                    GestureDetector(
                        onTap: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            print("Login button tapped");
                            Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    child: TextPage(),
                                    type: PageTransitionType
                                        .rightToLeftWithFade));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TextPage(),
                                ));
                          } else {
                            print("Form is not valid");
                          }
                        },
                        child: Image.asset("assets/images/login button.png")),
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
