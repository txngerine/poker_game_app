import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pokerpad/view/name_page.dart';
import 'package:pokerpad/widget/build_sub_heading_text.dart';
import 'package:pokerpad/widget/build_text_widget.dart';

import '../constants/screen_size.dart';

class TermsPage extends StatefulWidget {
  const TermsPage({super.key});

  @override
  State<TermsPage> createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
  bool checker = true;
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
              width: 400,
              height: 540,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    spreadRadius: 3,
                    color: Colors.grey,
                    blurRadius: 3.0,
                  ),
                ],
                borderRadius: BorderRadius.circular(50),
                color: const Color(0xffB7B7B7),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const BuildSubHeadingText(text: "TERMS OF SERVICE"),
                  const SizedBox(
                    height: 5,
                  ),
                  const BuildTextWidget(
                      text: "Read to the end to confirm the Terms of Service"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white70),
                      width: 400,
                      height: 300,
                      child: const SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(18.0),
                              child: BuildTextWidget(
                                  fontSize: 15,
                                  text:
                                      "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, , comes from a line in section 1.10.32."),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              checker = !checker;
                            });
                          },
                          child: checker
                              ? Image.asset(
                                  "assets/images/empty checkmark.png",
                                  width: 30,
                                )
                              : Image.asset(
                                  "assets/images/Artboard 41.png",
                                  width: 30,
                                )),
                      const SizedBox(
                        width: 19,
                      ),
                      const BuildTextWidget(
                        text: "I confirm that i fully read the TOS Agreement",
                        fontSize: 14,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 170,
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: const ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(Colors.black)),
                            child: const Text(
                              "  Decline  ",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 170,
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: const NamePage(),
                                      type: PageTransitionType
                                          .rightToLeftWithFade));
                            },
                            style: const ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(Colors.white)),
                            child: const Text(
                              "  Accept  ",
                              style: TextStyle(color: Colors.black),
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
