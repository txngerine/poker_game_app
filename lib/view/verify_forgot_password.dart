import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pokerpad/model/resetpassword_request_model.dart';
import 'package:pokerpad/view/login_page.dart';
import 'package:pokerpad/widget/build_text_widget.dart';

import '../constants/screen_size.dart';
import '../controller/resetpassword_controller.dart';
import '../widget/build_heading_widget.dart';
import '../widget/build_text_field_widget.dart';

class VerifyForgotPassword extends StatefulWidget {
  final String? email;
  const VerifyForgotPassword({super.key, this.email});

  @override
  State<VerifyForgotPassword> createState() => _VerifyForgotPasswordState();
}

class _VerifyForgotPasswordState extends State<VerifyForgotPassword> {
  bool passwordVisible = true;
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _otpControllers = List.generate(
    6,
    (index) => TextEditingController(),
  );

  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final ResetPasswordController _resetPasswordController =
      ResetPasswordController();
  bool isLoading = false;

  Future<void> resetPassword() async {
    setState(() {
      isLoading = true;
    });
    String otpCode = _otpControllers.map((c) => c.text).join();

    final requestModel = ResetPasswordRequestModel(
        email: widget.email ?? "",
        otp: otpCode,
        newPassword: newPasswordController.text,
        confirmPassword: confirmPasswordController.text);
    try {
      final response =
          await _resetPasswordController.resetPassword(requestModel);
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
              "Reset Password Successfully",
              style: TextStyle(color: Colors.white),
            )));
        Navigator.pushReplacement(
            context,
            PageTransition(
                child: const LoginPage(),
                type: PageTransitionType.rightToLeftWithFade));
      } else {
        if (response?.status == "FAIL") {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              behavior: SnackBarBehavior.floating,
              content: Text(response?.message ?? "Signup Failed")));
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
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
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
          Container(
            width: width,
            height: height / 1.4,
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage("assets/images/phone&country/log-reg frame.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const BuildHeadingWidget(text: "Forgot password"),
                const SizedBox(
                  height: 10,
                ),
                const BuildTextWidget(
                  text: "A 6-digit code has been sent to your email.",
                  color: Colors.black,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    6,
                    (index) => SizedBox(
                      height: 60,
                      width: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/verifyemail/code field.png"),
                              fit: BoxFit
                                  .fill, // Ensures the image covers the text field
                            ),
                          ),
                          child: TextField(
                            controller: _otpControllers[index],
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              counterText: "",

                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              contentPadding: const EdgeInsets.all(
                                  15), // Ensures text stays centered
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
                ),
                Image.asset(
                  width: width / 1.4,
                  "assets/images/verifyemail/resend code button (3).png",
                ),
                const SizedBox(height: 25),
                SizedBox(
                  width: width / 1.24,
                  child: Form(
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
                        ),
                        BuildTextFieldWidget(
                          controller: confirmPasswordController,
                          hintText: "confirm password",
                          labelText: "confirm password",
                          obscureText: true,
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
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60, right: 60),
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
                          text: '1 number, \n',
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
                SizedBox(
                  height: 60,
                ),
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      resetPassword();
                    }
                  },
                  child: isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Image.asset(
                          "assets/images/phone&country/confirm button (1).png",
                          width: width / 1.4,
                        ),
                )
              ],
            ),
          )
          // Align(
          //   alignment: Alignment.topCenter,
          //   child: Column(
          //     children: [
          //       SizedBox(
          //         height: 40,
          //       ),
          //       SizedBox(
          //         height: 550,
          //         width: 400,
          //         child: Card(
          //           shadowColor: const Color(0xffB7B7B7),
          //           elevation: 30,
          //           color: Colors.grey[200],
          //           // color: const Color(0xffB7B7B7),
          //           shape: OutlineInputBorder(
          //             borderSide: const BorderSide(
          //               color: Color(0xffB7B7B7),
          //             ),
          //             borderRadius: BorderRadius.circular(
          //               40,
          //             ),
          //           ),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             children: [
          //               const SizedBox(
          //                 height: 20,
          //               ),
          //               const BuildTextWidget(
          //                 fontSize: 12,
          //                 align: TextAlign.center,
          //                 text:
          //                     "A 6-digit verification code has been sent to your email\n Enter the code below",
          //               ),
          //               const SizedBox(height: 20),
          //               Padding(
          //                 padding: const EdgeInsets.only(left: 40, right: 40),
          //                 child: Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                   children: List.generate(
          //                     6,
          //                     (index) => SizedBox(
          //                       height: 50,
          //                       width: 50,
          //                       child: TextField(
          //                         controller: _otpControllers[index],
          //                         textAlign: TextAlign.center,
          //                         keyboardType: TextInputType.number,
          //                         maxLength: 1,
          //                         style: const TextStyle(fontSize: 15),
          //                         decoration: InputDecoration(
          //                           counterText: "",
          //                           enabledBorder: OutlineInputBorder(
          //                             borderRadius: BorderRadius.circular(10),
          //                             borderSide: BorderSide(
          //                                 color: Colors.grey.shade300,
          //                                 width: 3),
          //                           ),
          //                           focusedBorder: OutlineInputBorder(
          //                             borderRadius: BorderRadius.circular(10),
          //                             borderSide:
          //                                 const BorderSide(color: Colors.blue),
          //                           ),
          //                           fillColor: Colors.white,
          //                           filled: true,
          //                         ),
          //                         onChanged: (value) {
          //                           if (value.isNotEmpty && index < 5) {
          //                             FocusScope.of(context).nextFocus();
          //                           }
          //                         },
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //               const SizedBox(height: 20),
          //               GestureDetector(
          //                   onTap: () {
          //                     // resendOtp();
          //                   },
          //                   child: Image.asset(
          //                     "assets/images/resend code button.png",
          //                     height: 50,
          //                   )),
          //               const SizedBox(
          //                 height: 20,
          //               ),
          //               Form(
          //                 key: _formKey,
          //                 child: Column(
          //                   children: [
          //                     BuildTextFieldWidget(
          //                       controller: newPasswordController,
          //                       hintText: "new password",
          //                       labelText: "new password",
          //                       obscureText: passwordVisible,
          //                       suffixIcon: GestureDetector(
          //                         onTap: () {
          //                           setState(() {
          //                             passwordVisible = !passwordVisible;
          //                           });
          //                         },
          //                         child: passwordVisible
          //                             ? Image.asset(
          //                                 "assets/images/Artboard 28.png",
          //                                 width: 47)
          //                             : Image.asset(
          //                                 "assets/images/Artboard 29.png",
          //                                 width: 47),
          //                       ),
          //                       validator: validatePassword,
          //                     ),
          //                     BuildTextFieldWidget(
          //                       controller: confirmPasswordController,
          //                       hintText: "confirm password",
          //                       labelText: "confirm password",
          //                       obscureText: true,
          //                       validator: (value) => validateConfirmPassword(
          //                           newPasswordController.text, value ?? ""),
          //                       suffixIcon: GestureDetector(
          //                         onTap: () {
          //                           setState(() {
          //                             confirmPasswordController.clear();
          //                           });
          //                         },
          //                         child: Image.asset(
          //                             "assets/images/pokerPadArt/Artboard 30 (1).png"),
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //               Padding(
          //                 padding: const EdgeInsets.only(left: 30, right: 30),
          //                 child: RichText(
          //                   textAlign: TextAlign.center,
          //                   text: const TextSpan(
          //                     text: 'Password must be at least ',
          //                     style: TextStyle(
          //                       color: Color(0xFF5F6368),
          //                       fontSize: 13,
          //                     ),
          //                     children: [
          //                       TextSpan(
          //                         text: '8 characters ',
          //                         style: TextStyle(
          //                           fontWeight: FontWeight.bold,
          //                           color: Colors.black87,
          //                         ),
          //                       ),
          //                       TextSpan(
          //                         text: 'and contain ',
          //                         style: TextStyle(
          //                           color: Color(0xFF5F6368),
          //                           fontSize: 14,
          //                         ),
          //                       ),
          //                       TextSpan(
          //                         text: '1 number, ',
          //                         style: TextStyle(
          //                           fontWeight: FontWeight.bold,
          //                           color: Colors.black87,
          //                         ),
          //                       ),
          //                       TextSpan(
          //                         text: '1 uppercase letter, ',
          //                         style: TextStyle(
          //                           fontWeight: FontWeight.bold,
          //                           color: Colors.black87,
          //                         ),
          //                       ),
          //                       TextSpan(
          //                         text: '1 lowercase letter ',
          //                         style: TextStyle(
          //                           fontWeight: FontWeight.bold,
          //                           color: Colors.black87,
          //                         ),
          //                       ),
          //                       TextSpan(
          //                         text: ' and ',
          //                         style: TextStyle(
          //                           color: Color(0xFF5F6368),
          //                           fontSize: 14,
          //                         ),
          //                       ),
          //                       TextSpan(
          //                         text: '1 symbol.',
          //                         style: TextStyle(
          //                           fontWeight: FontWeight.bold,
          //                           color: Colors.black87,
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               ),
          //               const SizedBox(
          //                 height: 50,
          //               ),
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: [
          //                   GestureDetector(
          //                     onTap: () {
          //                       Navigator.pushReplacement(
          //                           context,
          //                           PageTransition(
          //                               child: const LoginPage(),
          //                               type: PageTransitionType
          //                                   .leftToRightWithFade));
          //                     },
          //                     child: Image.asset(
          //                       "assets/images/pokerPadArt/cancel.png",
          //                       width: 180,
          //                     ),
          //                   ),
          //                   GestureDetector(
          //                     onTap: () {
          //                       if (_formKey.currentState?.validate() ??
          //                           false) {
          //                         resetPassword();
          //                       }
          //                     },
          //                     child: isLoading
          //                         ? const Center(
          //                             child: CircularProgressIndicator(),
          //                           )
          //                         : Image.asset(
          //                             "assets/images/pokerPadArt/proceed.png",
          //                             width: 180,
          //                           ),
          //                   )
          //                 ],
          //               )
          //             ],
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
