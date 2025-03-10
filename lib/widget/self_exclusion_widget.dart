import 'package:flutter/material.dart';

import 'build_icon_image_widget.dart';
import 'build_sub_heading_text.dart';
import 'build_text_widget.dart';
import 'elevated_button_custom.dart';

class SelfExclusionWidget extends StatefulWidget {
  const SelfExclusionWidget({super.key});

  @override
  State<SelfExclusionWidget> createState() => _SelfExclusionWidgetState();
}

class _SelfExclusionWidgetState extends State<SelfExclusionWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return GestureDetector(
      onTap: () {
        print("clicked");
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white54, width: 2),
                    color: Colors.black),
                width: width / 2,
                height: height / 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const BuildSubHeadingText(
                      text: "self exclusion",
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const BuildTextWidget(
                      align: TextAlign.center,
                      text: "Do you wish to exclude yourself for the \n"
                          "next 24 hours from all game?",
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButtonCustom(
                          onPress: () {},
                          textColor: Colors.white54,
                          text: "No",
                          color: const Color(0xff45474B),
                        ),
                        ElevatedButtonCustom(
                          onPress: () {
                            Navigator.pop(context);
                          },
                          textColor: Colors.black,
                          text: "Yes",
                          color: const Color(0xffEEEEEE),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
      child: const BuildIconImageWidget(
          imgName: "assets/images/lobby/Self Exclusion Button.png"),
    );
  }
}
