import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pokerpad/view/image_scroll_page.dart';
import 'package:pokerpad/widget/build_bold_text_widget.dart';
import 'package:pokerpad/widget/build_heading_text.dart';
import 'package:pokerpad/widget/build_text_widget.dart';

import '../constants/screen_size.dart';

class AvatarPage extends StatefulWidget {
  const AvatarPage({super.key});

  @override
  State<AvatarPage> createState() => _AvatarPageState();
}

class _AvatarPageState extends State<AvatarPage> {
  String? selectGender;
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const BuildHeadingText(text: "Create Your Avatar"),
                SizedBox(
                  height: 800,
                  width: 630,
                  child: Card(
                    shadowColor: const Color(0xffB7B7B7),
                    elevation: 30,
                    color: const Color(0xffE4E0E1),
                    shape: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xffB7B7B7),
                      ),
                      borderRadius: BorderRadius.circular(
                        50,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const BuildBoldTextWidget(
                                  text: "Step 1 : Select your gender"),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectGender = "male";
                                        print("male select");
                                      });
                                    },
                                    child: selectGender == "male"
                                        ? Image.asset(
                                            "assets/images/Artboard 41.png",
                                            width: 40,
                                          )
                                        : Image.asset(
                                            "assets/images/empty checkmark.png",
                                            width: 40,
                                          ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  const BuildTextWidget(text: "Male    ")
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset("assets/images/gender.png"),
                              const Spacer(),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectGender = "female";
                                        print("female select");
                                      });
                                    },
                                    child: selectGender == "female"
                                        ? Image.asset(
                                            "assets/images/Artboard 41.png",
                                            width: 40,
                                          )
                                        : Image.asset(
                                            "assets/images/empty checkmark.png",
                                            width: 40,
                                          ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  const BuildTextWidget(text: "Female")
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BuildBoldTextWidget(
                                  text: "Step 2 : Take a Selfie"),
                              BuildTextWidget(text: "Receive your Avatar")
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      50), // Rounded corners
                                  border: Border.all(
                                    color: Colors.grey, // Border color
                                    width: 3.0, // Border width
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.network(
                                    "https://t4.ftcdn.net/jpg/06/11/31/83/360_F_611318347_W9VlSC14WGljlV5K3BP1zEShcr1Dvoq5.jpg",
                                    width: 240,
                                    height: 300,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      40), // Rounded corners
                                  border: Border.all(
                                    color: Colors.grey, // Border color
                                    width: 3.0, // Border width
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.network(
                                    "https://starryai.com/cdn-cgi/image/format=avif,quality=90/https://cdn.prod.website-files.com/61554cf069663530fc823d21/6369fed004b5b041b7ed686a_download-8-min.png",
                                    width: 240,
                                    height: 300,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            decoration: BoxDecoration(
                                color: const Color(0xffFFC94A),
                                borderRadius: BorderRadius.circular(30)),
                            height: 250,
                            width: 580,
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  BuildBoldTextWidget(
                                      text: "Facial Verification"),
                                  BuildTextWidget(
                                      align: TextAlign.center,
                                      text:
                                          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal ")
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: const ImageScrollPage(),
                              type: PageTransitionType.rightToLeftWithFade));
                    },
                    child: Image.asset("assets/images/take a selfie.png")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
