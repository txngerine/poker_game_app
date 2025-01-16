import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pokerpad/constants/screen_size.dart';
import 'package:pokerpad/controller/login_controller.dart';
import 'package:pokerpad/model/login_request_model.dart';
import 'package:pokerpad/view/lobby_page.dart';
import 'package:pokerpad/view/register_page.dart';
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
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final LoginController _loginController = LoginController();
  bool isLoading = false;

  Future<void> login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      isLoading = true;
    });
    final requestModel = LoginRequestModel(
        email: emailController.text,
        password: passwordController.text,
        deviceId: 1,
        accountNo: "A020241027101417");
    try {
      final response = await _loginController.login(requestModel);
      setState(() {
        isLoading = false;
      });
      if (response?.status == "OK") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            behavior: SnackBarBehavior.floating,
            backgroundColor: CupertinoColors.activeGreen,
            content: const Text(
              "Login Scuessfull",
              style: TextStyle(color: Colors.white),
            )));
        Navigator.pushReplacement(
            context,
            PageTransition(
                child: const LobbyPage(),
                type: PageTransitionType.rightToLeftWithFade));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            behavior: SnackBarBehavior.floating,
            content: const Text("Login failed, Invalid email or password!")));
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error:$e")));
    }
  }

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
                            hintText: "        Password",
                            controller: passwordController,
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
                          const BuildBoldTextWidget(text: "Forgot password")
                        ],
                      ),
                    ),
                    const SizedBox(height: 54),
                    isLoading
                        ? const CircularProgressIndicator()
                        : GestureDetector(
                            onTap: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                login();
                              } else {
                                print("Form is not valid");
                              }
                            },
                            child: Image.asset(
                              "assets/images/login button.png",
                              height: 59,
                            )),
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
