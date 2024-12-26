import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pokerpad/view/terms_page.dart';
import 'package:pokerpad/widget/build_sub_heading_text.dart';
import 'package:pokerpad/widget/build_text_widget.dart';

import '../constants/screen_size.dart';
import '../widget/build_text_field_widget.dart';

class DobPage extends StatefulWidget {
  const DobPage({super.key});

  @override
  State<DobPage> createState() => _DobPageState();
}

class _DobPageState extends State<DobPage> {
  bool rememberButton = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController dobController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Container(
              height: 600,
              width: 670,
              decoration: BoxDecoration(
                  color: const Color(0xffB7B7B7),
                  borderRadius: BorderRadius.circular(50)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const BuildSubHeadingText(text: "DATE OF BIRTH"),
                    const SizedBox(
                      height: 20,
                    ),
                    const BuildTextWidget(
                        align: TextAlign.center,
                        text:
                            "Due to local regulations,you need to make sure that you are at least 18 years old before using the app "),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: _formKey,
                      child: BuildTextFieldWidget(
                        controller: dobController,
                        hintText: "dd/mm/yyyy",
                        labelText: 'email',
                        keyboardType: TextInputType.datetime,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                                  width: 40,
                                )
                              : Image.asset(
                                  "assets/images/Artboard 41.png",
                                  width: 40,
                                ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const BuildTextWidget(
                            align: TextAlign.center,
                            text:
                                "I confirm that this is my real date of birth")
                      ],
                    ),
                    const SizedBox(
                      height: 120,
                    ),
                    GestureDetector(
                        onTap: () {
                          if (_formKey.currentState?.validate() == true) {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: const TermsPage(),
                                    type: PageTransitionType
                                        .rightToLeftWithFade));
                          } else {
                            print("Form not valid");
                          }
                        },
                        child: Image.asset("assets/images/confirm.png"))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
